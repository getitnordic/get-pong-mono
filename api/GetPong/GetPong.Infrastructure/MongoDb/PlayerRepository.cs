using GetPong.Core.Infrastructure.Entities.Players;
using GetPong.Core.Infrastructure.Repositories;
using MongoDB.Bson;
using MongoDB.Driver;

namespace GetPong.Infrastructure.MongoDb
{
    public class PlayerRepository : IPlayerRepository
    {
        private static MongoClient _mongoClient =
            new MongoClient(
                "mongodb+srv://gpadmin:z2Gt6fKIypG6ATlL@getpongcluster.jsweu.mongodb.net/?retryWrites=true&w=majority");

        private static IMongoDatabase _mongoDatabase = _mongoClient.GetDatabase("gpdb");

        private static IMongoCollection<BsonDocument> _mongoCollection =
            _mongoDatabase.GetCollection<BsonDocument>("GetPongCollection");

        public Player RegisterExternal(Player player)
        {
            
            // TODO: Figure out player.id value = null, lol what idk wtf im doing
            BsonDocument doc = new BsonDocument()
                .Add("first_name", player.FirstName)
                .Add("last_name", player.LastName)
                .Add("nickname", player.Nickname)
                .Add("image_url", player.ImageUrl)
                .Add("email", player.Email)
                .Add("streak", player.Streak)
                .Add("win", player.Win)
                .Add("loss", player.Loss)
                .Add("total_score", player.TotalScore)
                .Add("streak_enum", player.StreakEnum);
            
            _mongoCollection.InsertOne(doc);
            player.Id = doc["_id"].ToString();

            return player;
        }
        
    }
}