using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Threading.Tasks;
using GetPong.Core.Infrastructure.Entities.Players;
using GetPong.Core.Infrastructure.Repositories;
using GetPong.Core.Models.Commands.Players;
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
            var allPlayers = new List<Player>();

            foreach (BsonDocument doc in allPlayersBson)
            {
                var player = new Player();
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

        }


        public async Task<Player> UpdatePlayer(string playerId, AddPlayerCommand addPlayerCommand)
        {
            var objectId = ObjectId.Parse(playerId);
            var filter = Builders<BsonDocument>.Filter.Eq(d => d["_id"], objectId);

            var getPlayer = await GetPlayerById(playerId);

            BsonDocument playerDoc = new BsonDocument()
                .Add("_id", ObjectId.Parse(playerId))
                .Add("first_name", addPlayerCommand.FirstName)
                .Add("last_name", addPlayerCommand.LastName)
                .Add("nickname", addPlayerCommand.Nickname)
                .Add("email", addPlayerCommand.Email)
                .Add("image_url", getPlayer.ImageUrl)
                .Add("streak", getPlayer.Streak)
                .Add("win", getPlayer.Win)
                .Add("loss", getPlayer.Loss)
                .Add("total_score", getPlayer.TotalScore)
                .Add("streak_enum", getPlayer.StreakEnum);


            // var docs = await _mongoCollection.UpdateOneAsync(filter, playerDoc);
            await _mongoCollection.ReplaceOneAsync(filter, playerDoc);
            //var docs = await _mongoCollection.UpdateOneAsync(filter, doc);

            Player player = new Player();
            player.Id = playerDoc.GetValue("_id").ToString();
            player.FirstName = playerDoc.GetValue("first_name").ToString();
            player.LastName = playerDoc.GetValue("last_name").ToString();
            player.Nickname = playerDoc.GetValue("nickname").ToString();
            player.ImageUrl = playerDoc.GetValue("image_url").ToString();
            player.Email = playerDoc.GetValue("email").ToString();
            player.Streak = playerDoc.GetValue("streak").ToInt32();
            player.Win = playerDoc.GetValue("win").ToInt32();
            player.Loss = playerDoc.GetValue("loss").ToInt32();
            player.TotalScore = playerDoc.GetValue("total_score").ToInt32();
            player.StreakEnum = (StreakEnum)playerDoc.GetValue("streak_enum").ToInt32();
            return player;

        }
    }
}