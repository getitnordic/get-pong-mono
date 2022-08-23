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

    public async Task<Result> GetResultByGameId(string gameId)
    {
        var filter = Builders<BsonDocument>.Filter.Eq(id => id["game_id"], gameId);
        var docs = await _mongoCollection.FindAsync(filter);
        var doc = docs.FirstOrDefault();

        return new Result(doc);
    }

    public Task<Result> SaveResult(Game game)
    {

        //Check which team won

        int homeTeamScore = 0;
        int awayTeamScore = 0;
        bool didHomeTeamWin = false;

        for (int i = 0; i < game.Sets.Count; i++)
        {
            homeTeamScore += game.Sets[i].HomeTeam;
            awayTeamScore += game.Sets[i].AwayTeam;
        }

        if (homeTeamScore > awayTeamScore)
        {
            didHomeTeamWin = true;
        }
        
        // singles match
        if (game.AwayTeamIds.Count == 1)
        {

            var player1 = _playerRepository.GetPlayerById(game.HomeTeamIds[0]);
            var player2 = _playerRepository.GetPlayerById(game.AwayTeamIds[0]);

            if (didHomeTeamWin)
            {
                var player1Doc = new BsonDocument()
                    .Add("elo_diff", player1.Result.TotalScore - player2.Result.TotalScore)
                    .Add("new_elo", player1.Result.TotalScore + 10)
                    .Add("game_won", true)
                    .Add("time_stamp", game.TimeStamp);
                
                var player2Doc = new BsonDocument()
                    .Add("elo_diff", player2.Result.TotalScore - player1.Result.TotalScore)
                    .Add("new_elo", player2.Result.TotalScore - 10)
                    .Add("game_won", false)
                    .Add("time_stamp", game.TimeStamp);
                _mongoCollection.InsertOne(player1Doc);  
                _mongoCollection.InsertOne(player2Doc);   
            }
            else
            {
                var player1Doc = new BsonDocument()
                    .Add("elo_diff", player2.Result.TotalScore - player1.Result.TotalScore)
                    .Add("new_elo", player1.Result.TotalScore - 10)
                    .Add("game_won", false)
                    .Add("time_stamp", game.TimeStamp);
                
                var player2Doc = new BsonDocument()
                    .Add("elo_diff", player1.Result.TotalScore - player2.Result.TotalScore)
                    .Add("new_elo", player2.Result.TotalScore + 10)
                    .Add("game_won", true)
                    .Add("time_stamp", game.TimeStamp);
                _mongoCollection.InsertOne(player1Doc);  
                _mongoCollection.InsertOne(player2Doc); 
            }
        }
        // doubles match
        else if (game.AwayTeamIds.Count == 2)
        {
            
        }

        return null;
    }
}