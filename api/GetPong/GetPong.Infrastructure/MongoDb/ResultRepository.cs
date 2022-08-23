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

    public ResultRepository(IConfiguration configuration)
    {
        _configuration = configuration;
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

        // singles match
        if (game.AwayTeamIds.Count == 1)
        {
            //TODO: Change hardcoded dummy values to real values
            var player1Doc = new BsonDocument()
                .Add("elo_diff", 1234)
                .Add("new_elo", 1000 + 1234)
                .Add("game_won", true)
                .Add("time_stamp", DateTime.UtcNow);
            _mongoCollection.InsertOne(player1Doc);
        }
        // doubles match
        else if (game.AwayTeamIds.Count == 2)
        {
            
        }

        return null;
    }
}