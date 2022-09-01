using GetPong.Core.Infrastructure.Entities.Games;
using GetPong.Core.Infrastructure.Entities.Results;
using GetPong.Core.Infrastructure.Repositories;
using Microsoft.Extensions.Configuration;
using MongoDB.Bson;
using MongoDB.Driver;

namespace GetPong.Infrastructure.MongoDb;

public class ResultRepository : IResultRepository
{
    private readonly IMongoCollection<BsonDocument> _mongoCollection;
    private readonly IConfiguration _configuration;
    private readonly IPlayerRepository _playerRepository;

    public ResultRepository(IConfiguration configuration, IPlayerRepository playerRepository)
    {
        _configuration = configuration;
        _playerRepository = playerRepository;
        var mongoClient = new MongoClient(_configuration["MongoDb:ConnectionString"]);
        var mongoDatabase = mongoClient.GetDatabase("gpdb");
        _mongoCollection = mongoDatabase.GetCollection<BsonDocument>("results");
    }

    public Task<List<Result>> GetResultByGameId(string gameId)
    {
        var filter = Builders<BsonDocument>.Filter.Eq(id => id["game_id"], gameId);
        var docs = _mongoCollection.Find(filter).ToList();

        return Task.FromResult(docs.Select(x => new Result(x)).ToList());
    }

    public List<Result> GetResultsByPlayerId(string playerId, int limit, int offset)
    {
        var filter = Builders<BsonDocument>.Filter.Eq(id => id["player_id"], playerId);
        var docs = _mongoCollection.Find(filter).Sort("{time_stamp: -1}").Skip(offset).Limit(limit).ToList();

        return docs.Select(x => new Result(x)).ToList();
    }

    public void SaveResult(Game game)
    {
        //Check which team won
        var homeTeamScore = 0;
        var awayTeamScore = 0;

        foreach (var gameSet in game.Sets)
        {
            homeTeamScore += gameSet.HomeTeam;
            awayTeamScore += gameSet.AwayTeam;
        }

        var player1 = _playerRepository.GetPlayerById(game.HomeTeamIds[0]);
        var player2 = _playerRepository.GetPlayerById(game.AwayTeamIds[0]);

        var player1Doc = new BsonDocument();
        var player2Doc = new BsonDocument();
        var player3Doc = new BsonDocument();
        var player4Doc = new BsonDocument();

        switch (game.AwayTeamIds.Count)
        {
            //TODO Update elo values with actual ELO values from games played
            // singles match
            case 1:
            {
                if (homeTeamScore > awayTeamScore) // Home wins
                {
                    player1Doc
                        .Add("game_id", game.Id)
                        .Add("elo_diff", Math.Abs(player1.Result.TotalScore - player2.Result.TotalScore))
                        .Add("new_elo", player1.Result.TotalScore)
                        .Add("game_won", true)
                        .Add("time_stamp", game.TimeStamp)
                        .Add("player_id", game.HomeTeamIds[0]);
                    player2Doc
                        .Add("game_id", game.Id)
                        .Add("elo_diff", Math.Abs(player2.Result.TotalScore - player1.Result.TotalScore))
                        .Add("new_elo", player2.Result.TotalScore)
                        .Add("game_won", false)
                        .Add("time_stamp", game.TimeStamp)
                        .Add("player_id", game.AwayTeamIds[0]);

                    _mongoCollection.InsertOne(player1Doc);
                    _mongoCollection.InsertOne(player2Doc);
                }
                else // Away wins
                {
                    player1Doc
                        .Add("game_id", game.Id)
                        .Add("elo_diff", Math.Abs(player2.Result.TotalScore - player1.Result.TotalScore))
                        .Add("new_elo", player1.Result.TotalScore)
                        .Add("game_won", false)
                        .Add("time_stamp", game.TimeStamp)
                        .Add("player_id", game.HomeTeamIds[0]);

                    player2Doc
                        .Add("game_id", game.Id)
                        .Add("elo_diff", Math.Abs(player1.Result.TotalScore - player2.Result.TotalScore))
                        .Add("new_elo", player2.Result.TotalScore)
                        .Add("game_won", true)
                        .Add("time_stamp", game.TimeStamp)
                        .Add("player_id", game.AwayTeamIds[0]);
                    _mongoCollection.InsertOne(player1Doc);
                    _mongoCollection.InsertOne(player2Doc);
                }

                break;
            }
            // doubles match
            case 2:
                var player3 = _playerRepository.GetPlayerById(game.HomeTeamIds[1]);
                var player4 = _playerRepository.GetPlayerById(game.AwayTeamIds[1]);
                var diff = Math.Abs(player1.Result.TotalScore + player3.Result.TotalScore -
                                    (player2.Result.TotalScore + player4.Result.TotalScore));
                if (homeTeamScore > awayTeamScore) // Home wins
                {
                    player1Doc
                        .Add("game_id", game.Id)
                        .Add("elo_diff", diff)
                        .Add("new_elo", player1.Result.TotalScore)
                        .Add("game_won", true)
                        .Add("time_stamp", game.TimeStamp)
                        .Add("player_id", game.HomeTeamIds[0]);
                    player2Doc
                        .Add("game_id", game.Id)
                        .Add("elo_diff", diff)
                        .Add("new_elo", player2.Result.TotalScore - diff)
                        .Add("game_won", false)
                        .Add("time_stamp", game.TimeStamp)
                        .Add("player_id", game.AwayTeamIds[0]);

                    player3Doc
                        .Add("game_id", game.Id)
                        .Add("elo_diff", diff)
                        .Add("new_elo", player3.Result.TotalScore + diff)
                        .Add("game_won", true)
                        .Add("time_stamp", game.TimeStamp)
                        .Add("player_id", game.HomeTeamIds[1]);

                    player4Doc
                        .Add("game_id", game.Id)
                        .Add("elo_diff", diff)
                        .Add("new_elo", player4.Result.TotalScore - diff)
                        .Add("game_won", false)
                        .Add("time_stamp", game.TimeStamp)
                        .Add("player_id", game.AwayTeamIds[1]);

                    _mongoCollection.InsertOne(player1Doc);
                    _mongoCollection.InsertOne(player2Doc);
                    _mongoCollection.InsertOne(player3Doc);
                    _mongoCollection.InsertOne(player4Doc);
                }
                else // Away wins
                {
                    player1Doc
                        .Add("game_id", game.Id)
                        .Add("elo_diff", diff)
                        .Add("new_elo", player1.Result.TotalScore)
                        .Add("game_won", false)
                        .Add("time_stamp", game.TimeStamp)
                        .Add("player_id", game.HomeTeamIds[0]);

                    player2Doc
                        .Add("game_id", game.Id)
                        .Add("elo_diff", diff)
                        .Add("new_elo", player2.Result.TotalScore)
                        .Add("game_won", true)
                        .Add("time_stamp", game.TimeStamp)
                        .Add("player_id", game.AwayTeamIds[0]);

                    player3Doc
                        .Add("game_id", game.Id)
                        .Add("elo_diff", diff)
                        .Add("new_elo", player3.Result.TotalScore)
                        .Add("game_won", false)
                        .Add("time_stamp", game.TimeStamp)
                        .Add("player_id", game.HomeTeamIds[1]);

                    player4Doc
                        .Add("game_id", game.Id)
                        .Add("elo_diff", diff)
                        .Add("new_elo", player4.Result.TotalScore)
                        .Add("game_won", true)
                        .Add("time_stamp", game.TimeStamp)
                        .Add("player_id", game.AwayTeamIds[1]);

                    _mongoCollection.InsertOne(player1Doc);
                    _mongoCollection.InsertOne(player2Doc);
                    _mongoCollection.InsertOne(player3Doc);
                    _mongoCollection.InsertOne(player4Doc);
                }

                break;
        }
    }
}