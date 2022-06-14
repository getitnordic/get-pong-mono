using System.Net.Sockets;
using System.Net.WebSockets;
using System.Threading.Tasks;
using GetPong.Core.Core.Helpers;
using GetPong.Core.Infrastructure.Entities.Games;
using GetPong.Core.Infrastructure.Repositories;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Serializers;
using MongoDB.Driver;

namespace GetPong.Infrastructure.MongoDb
{
    public class GameRepository : IGameRepository
    {
        private readonly IMongoCollection<BsonDocument> MongoCollection;
        private readonly IHelper _helper;

        public GameRepository(IHelper helper)
        {
            _helper = helper;
            var MongoClient = new MongoClient("mongodb+srv://gpadmin:z2Gt6fKIypG6ATlL@getpongcluster.jsweu.mongodb.net/?retryWrites=true&w=majority"); //TODO Fetch connectionstring from appsettings
            var MongoDatabase = MongoClient.GetDatabase("gpdb");
            MongoCollection = MongoDatabase.GetCollection<BsonDocument>("games");
        }

        public Game AddGame(Game game)
        {
            var doc = new BsonDocument()
                .Add("time_stamp", DateTime.UtcNow.Ticks)
                .Add("home_team_ids", new BsonArray(game.HomeTeamIds))
                .Add("away_team_ids", new BsonArray(game.AwayTeamIds))
                .Add("sets", new BsonArray(game.Sets.Select(i => i.ToBsonDocument())));

            MongoCollection.InsertOne(doc);

            game.Id = doc["_id"].ToString();
            game.TimeStamp = doc["time_stamp"].ToInt64();
            return game;
        }

        public List<Game> GetGames(int offset, int limit)
        {
            var allGamesBson = MongoCollection.Find(new BsonDocument()).Sort("{time_stamp: -1}").Skip(offset).Limit(limit).ToList();

            return allGamesBson.Select(doc => new Game()
            {
                Id = doc.GetValue("_id").ToString(),
                TimeStamp = _helper.getLongValue(doc, "time_stamp"),
                HomeTeamIds = doc.GetValue("home_team_ids").AsBsonArray.Select(x => x.AsString).ToList(),
                AwayTeamIds = doc.GetValue("away_team_ids").AsBsonArray.Select(x => x.AsString).ToList(),
                Sets = doc.GetValue("sets").AsBsonArray.Select(x => new GameSet()
                {
                    AwayTeam = x.AsBsonDocument.GetValue("AwayTeam").AsInt32,//doc.GetValue("", x.AsBsonDocument.GetValue("AwayTeam")).AsInt32, //TODO varför behöver vi ha en tom sträng här?
                    HomeTeam = doc.GetValue("", x.AsBsonDocument.GetValue("HomeTeam")).AsInt32,
                    SetNo = doc.GetValue("", x.AsBsonDocument.GetValue("SetNo")).AsInt32
                }).ToList()
            }).ToList();
        }
    }
}