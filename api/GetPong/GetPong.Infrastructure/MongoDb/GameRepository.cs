using System.Net.WebSockets;
using System.Threading.Tasks;
using GetPong.Core.Infrastructure.Entities.Games;
using GetPong.Core.Infrastructure.Repositories;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Serializers;
using MongoDB.Driver;

namespace GetPong.Infrastructure.MongoDb
{
    public class GameRepository : IGameRepository
    {
        private static readonly MongoClient MongoClient =
            new MongoClient(
                "mongodb+srv://gpadmin:z2Gt6fKIypG6ATlL@getpongcluster.jsweu.mongodb.net/?retryWrites=true&w=majority");

        private static readonly IMongoDatabase MongoDatabase = MongoClient.GetDatabase("gpdb");

        private static readonly IMongoCollection<BsonDocument> MongoCollection =
            MongoDatabase.GetCollection<BsonDocument>("games");


        public Game AddGame(Game game)
        {
            var doc = new BsonDocument()
                .Add("time_stamp", game.TimeStamp)
                .Add("home_team_ids", new BsonArray(game.HomeTeamIds))
                .Add("away_team_ids", new BsonArray(game.AwayTeamIds))
                .Add("sets", new BsonArray(game.Sets.Select(i => i.ToBsonDocument())));

            MongoCollection.InsertOne(doc);

            game.Id = doc["_id"].ToString();
            return game;
        }
    }
}