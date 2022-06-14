using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
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
        private static readonly MongoClient MongoClient =
            new MongoClient(
                "mongodb+srv://gpadmin:z2Gt6fKIypG6ATlL@getpongcluster.jsweu.mongodb.net/?retryWrites=true&w=majority"); //TODO Fetch connectionstring from appsettings & dependency injection

        private static readonly IMongoDatabase MongoDatabase = MongoClient.GetDatabase("gpdb");

        private static readonly IMongoCollection<BsonDocument> MongoCollection =
            MongoDatabase.GetCollection<BsonDocument>("players");

        public Player RegisterPlayer(Player player)
        {
            var doc = new BsonDocument()
                .Add("first_name", player.FirstName)
                .Add("last_name", player.LastName)
                .Add("nickname", player.Nickname)
                .Add("image_url", player.ImageUrl)
                .Add("email", player.Email)
                .Add("streak", player.Streak)
                .Add("win", player.Win)
                .Add("loss", player.Loss)
                .Add("total_score", player.TotalScore)
                .Add("streak_enum", player.StreakEnum)
                .Add("azure_ad_id", player.AzureAdId);

            MongoCollection.InsertOne(doc);
            player.Id = doc["_id"].ToString();

            return player;
        }

        public List<Player> GetPlayers()
        {
            var allPlayersBson = MongoCollection.Find(new BsonDocument()).ToList();
            return allPlayersBson.Select(doc => new Player(doc))
                .ToList();
        }

        public async Task<Player> GetPlayerById(string playerId)
        {
            var objectId = ObjectId.Parse(playerId);
            var filter = Builders<BsonDocument>.Filter.Eq(d => d["_id"], objectId);
            var docs = await MongoCollection.FindAsync(filter);
            var doc = docs.FirstOrDefault();

            return new Player(doc);
        }

        public async Task<Player> UpdatePlayer(string playerId, AddPlayerCommand addPlayerCommand)
        {
            var objectId = ObjectId.Parse(playerId);
            var filter = Builders<BsonDocument>.Filter.Eq(d => d["_id"], objectId);
            var getPlayer = await GetPlayerById(playerId);

            var playerDoc = new BsonDocument()
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
                .Add("streak_enum", getPlayer.StreakEnum)
                .Add("azure_ad_id", getPlayer.AzureAdId);


            await MongoCollection.ReplaceOneAsync(filter, playerDoc);

            return new Player
            {
                FirstName = playerDoc.GetValue("first_name").ToString(),
                LastName = playerDoc.GetValue("last_name").ToString(),
                Nickname = playerDoc.GetValue("nickname").ToString(),
                ImageUrl = playerDoc.GetValue("image_url").ToString(),
                Email = playerDoc.GetValue("email").ToString(),
                Streak = playerDoc.GetValue("streak").ToInt32(),
                Win = playerDoc.GetValue("win").ToInt32(),
                Loss = playerDoc.GetValue("loss").ToInt32(),
                TotalScore = playerDoc.GetValue("total_score").ToInt32(),
                AzureAdId = playerDoc.GetValue("azure_ad_id").ToString(),
                StreakEnum = (StreakEnum)playerDoc.GetValue("streak_enum").ToInt32()
            };
        }
    }
}