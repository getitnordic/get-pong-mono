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

    public List<Result> GetResults(int limit)
    {
        var allResultsBson = _mongoCollection.Find(new BsonDocument()).Sort("{time_stamp: -1}").Limit(limit).ToList();
        return allResultsBson.Select(doc => new Result(doc)).ToList();
    }

    public async Task SaveResult(Game game)
    {
        //Check which team won
        var homeTeamScore = 0;
        var awayTeamScore = 0;

        foreach (var gameSet in game.Sets)
        {
            if (gameSet.HomeTeam > gameSet.AwayTeam) homeTeamScore++; else awayTeamScore++;
        }

        var player1 = await _playerRepository.GetPlayerById(game.HomeTeamIds[0]);
        var player2 = await _playerRepository.GetPlayerById(game.AwayTeamIds[0]);

        var player1Doc = new BsonDocument();
        var player2Doc = new BsonDocument();
        var player3Doc = new BsonDocument();
        var player4Doc = new BsonDocument();
        var player1OldScore = 1000;
        var player3OldScore = 1000;
        try
        {
            player1OldScore = GetResultsByPlayerId(player1.Id, 1, 0)[0].NewElo;
        }
        catch (Exception e)
        {
            // ignored
        }

        switch (game.AwayTeamIds.Count)
        {
            // singles match
            case 1:
            {
                var diffSingle = Math.Abs(player1.TotalScore - player1OldScore);
                if (homeTeamScore > awayTeamScore) // Home wins
                {
                    player1Doc
                        .Add("game_id", game.Id)
                        .Add("elo_diff", diffSingle)
                        .Add("new_elo", player1.TotalScore)
                        .Add("game_won", true)
                        .Add("time_stamp", game.TimeStamp)
                        .Add("player_id", game.HomeTeamIds[0]);

                    player2Doc
                        .Add("game_id", game.Id)
                        .Add("elo_diff", -diffSingle)
                        .Add("new_elo", player2.TotalScore)
                        .Add("game_won", false)
                        .Add("time_stamp", game.TimeStamp)
                        .Add("player_id", game.AwayTeamIds[0]);
                }
                else // Away wins
                {
                    player1Doc
                        .Add("game_id", game.Id)
                        .Add("elo_diff", -diffSingle)
                        .Add("new_elo", player1.TotalScore)
                        .Add("game_won", false)
                        .Add("time_stamp", game.TimeStamp)
                        .Add("player_id", game.HomeTeamIds[0]);

                    player2Doc
                        .Add("game_id", game.Id)
                        .Add("elo_diff", diffSingle)
                        .Add("new_elo", player2.TotalScore)
                        .Add("game_won", true)
                        .Add("time_stamp", game.TimeStamp)
                        .Add("player_id", game.AwayTeamIds[0]);
                }

                await _mongoCollection.InsertOneAsync(player1Doc);
                await _mongoCollection.InsertOneAsync(player2Doc);
                break;
            }
            // doubles match
            case 2:
                var player3 = await _playerRepository.GetPlayerById(game.HomeTeamIds[1]);
                var player4 = await _playerRepository.GetPlayerById(game.AwayTeamIds[1]);
                try
                {
                    player3OldScore = GetResultsByPlayerId(player3.Id, 1, 0)[0].NewElo;
                }
                catch (Exception e)
                {
                    // ignored
                }

                var diffDouble =
                    Math.Abs((player1OldScore + player3OldScore - (player1.TotalScore + player3.TotalScore)) / 2);
                if (homeTeamScore > awayTeamScore) // Home wins
                {
                    player1Doc
                        .Add("game_id", game.Id)
                        .Add("elo_diff", diffDouble)
                        .Add("new_elo", player1.TotalScore)
                        .Add("game_won", true)
                        .Add("time_stamp", game.TimeStamp)
                        .Add("player_id", game.HomeTeamIds[0]);
                    player2Doc
                        .Add("game_id", game.Id)
                        .Add("elo_diff", -diffDouble)
                        .Add("new_elo", player2.TotalScore)
                        .Add("game_won", false)
                        .Add("time_stamp", game.TimeStamp)
                        .Add("player_id", game.AwayTeamIds[0]);

                    player3Doc
                        .Add("game_id", game.Id)
                        .Add("elo_diff", diffDouble)
                        .Add("new_elo", player3.TotalScore)
                        .Add("game_won", true)
                        .Add("time_stamp", game.TimeStamp)
                        .Add("player_id", game.HomeTeamIds[1]);

                    player4Doc
                        .Add("game_id", game.Id)
                        .Add("elo_diff", -diffDouble)
                        .Add("new_elo", player4.TotalScore)
                        .Add("game_won", false)
                        .Add("time_stamp", game.TimeStamp)
                        .Add("player_id", game.AwayTeamIds[1]);
                }
                else // Away wins
                {
                    player1Doc
                        .Add("game_id", game.Id)
                        .Add("elo_diff", -diffDouble)
                        .Add("new_elo", player1.TotalScore)
                        .Add("game_won", false)
                        .Add("time_stamp", game.TimeStamp)
                        .Add("player_id", game.HomeTeamIds[0]);

                    player2Doc
                        .Add("game_id", game.Id)
                        .Add("elo_diff", diffDouble)
                        .Add("new_elo", player2.TotalScore)
                        .Add("game_won", true)
                        .Add("time_stamp", game.TimeStamp)
                        .Add("player_id", game.AwayTeamIds[0]);

                    player3Doc
                        .Add("game_id", game.Id)
                        .Add("elo_diff", -diffDouble)
                        .Add("new_elo", player3.TotalScore)
                        .Add("game_won", false)
                        .Add("time_stamp", game.TimeStamp)
                        .Add("player_id", game.HomeTeamIds[1]);

                    player4Doc
                        .Add("game_id", game.Id)
                        .Add("elo_diff", diffDouble)
                        .Add("new_elo", player4.TotalScore)
                        .Add("game_won", true)
                        .Add("time_stamp", game.TimeStamp)
                        .Add("player_id", game.AwayTeamIds[1]);
                }

                await _mongoCollection.InsertOneAsync(player1Doc);
                await _mongoCollection.InsertOneAsync(player2Doc);
                await _mongoCollection.InsertOneAsync(player3Doc);
                await _mongoCollection.InsertOneAsync(player4Doc);
                break;
        }
    }
}