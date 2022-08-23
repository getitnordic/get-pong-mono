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
}