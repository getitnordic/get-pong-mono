using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using GetPong.Core.Infrastructure.Entities.Players;
using GetPong.Core.Infrastructure.Repositories;
using GetPong.Core.Models.Enum;
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
            _mongoDatabase.GetCollection<BsonDocument>("players");

        public Player RegisterExternal(Player player)
        {
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

        public List<Player> GetPlayers()
        {
            var allPlayersBson = _mongoCollection.Find(new BsonDocument()).ToList();
            List<Player> allPlayers = new List<Player>();

            foreach (BsonDocument doc in allPlayersBson)
            {
                Player player = new Player();
                player.Id = doc.GetValue("_id").ToString();
                player.FirstName = doc.GetValue("first_name").ToString();
                player.LastName = doc.GetValue("last_name").ToString();
                player.Nickname = doc.GetValue("nickname").ToString();
                player.ImageUrl = doc.GetValue("image_url").ToString();
                player.Email = doc.GetValue("email").ToString();
                player.Streak = doc.GetValue("streak").ToInt32();
                player.Win = doc.GetValue("win").ToInt32();
                player.Loss = doc.GetValue("loss").ToInt32();
                player.TotalScore = doc.GetValue("total_score").ToInt32();
                player.StreakEnum = (StreakEnum)doc.GetValue("streak_enum").ToInt32();

                allPlayers.Add(player);
            }

            return allPlayers;
        }

        public async Task<Player> GetPlayerById(string playerId)
        {
            // TODO: Change this stupid sorting implementation to an actual mongo query
            
            var allPlayersBson = _mongoCollection.Find(new BsonDocument()).ToList();
            List<Player> allPlayers = new List<Player>();

            var objectId = ObjectId.Parse(playerId);
            var filter = Builders<BsonDocument>.Filter.Eq(d => d["_id"], objectId);
            var docs = await _mongoCollection.FindAsync(filter);

            var doc = docs.FirstOrDefault();
            
            Player player = new Player();
            player.Id = doc.GetValue("_id").ToString();
            player.FirstName = doc.GetValue("first_name").ToString();
            player.LastName = doc.GetValue("last_name").ToString();
            player.Nickname = doc.GetValue("nickname").ToString();
            player.ImageUrl = doc.GetValue("image_url").ToString();
            player.Email = doc.GetValue("email").ToString();
            player.Streak = doc.GetValue("streak").ToInt32();
            player.Win = doc.GetValue("win").ToInt32();
            player.Loss = doc.GetValue("loss").ToInt32();
            player.TotalScore = doc.GetValue("total_score").ToInt32();
            player.StreakEnum = (StreakEnum)doc.GetValue("streak_enum").ToInt32();
            
            return player;
            /*
            foreach (BsonDocument doc in allPlayersBson)
            {
                Player player = new Player();
                player.Id = doc.GetValue("_id").ToString();
                player.FirstName = doc.GetValue("first_name").ToString();
                player.LastName = doc.GetValue("last_name").ToString();
                player.Nickname = doc.GetValue("nickname").ToString();
                player.ImageUrl = doc.GetValue("image_url").ToString();
                player.Email = doc.GetValue("email").ToString();
                player.Streak = doc.GetValue("streak").ToInt32();
                player.Win = doc.GetValue("win").ToInt32();
                player.Loss = doc.GetValue("loss").ToInt32();
                player.TotalScore = doc.GetValue("total_score").ToInt32();
                player.StreakEnum = (StreakEnum)doc.GetValue("streak_enum").ToInt32();

                allPlayers.Add(player);
            }

            foreach (Player player in allPlayers)
            {
                if (player.Id.Equals(playerId))
                {
                    return player;
                }
            }

            throw new Exception("No player with id " + playerId + " found.");
            */
        }
    }
}