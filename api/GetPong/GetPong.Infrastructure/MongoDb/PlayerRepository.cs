using GetPong.Core.Infrastructure.Entities.Players;
using GetPong.Core.Infrastructure.Repositories;
using GetPong.Core.Models.Commands.Players;
using GetPong.Core.Models.Enum;
using Microsoft.Extensions.Configuration;
using MongoDB.Bson;
using MongoDB.Driver;

namespace GetPong.Infrastructure.MongoDb;

public class PlayerRepository : IPlayerRepository
{
    private readonly IMongoCollection<BsonDocument> MongoCollection;
    private readonly IConfiguration _configuration;

    public PlayerRepository(IConfiguration configuration)
    {
        _configuration = configuration;
        var MongoClient = new MongoClient(_configuration["MongoDb:ConnectionString"]);
        var MongoDatabase = MongoClient.GetDatabase("gpdb");
        MongoCollection = MongoDatabase.GetCollection<BsonDocument>("players");
    }

    public void RegisterPlayer(Player player)
    {
        var doc = new BsonDocument()
            .Add("full_name", player.FullName)
            .Add("nickname", player.Nickname)
            .Add("image_url", player.ImageUrl)
            .Add("email", player.Email)
            .Add("streak", player.Streak)
            .Add("win", player.Win)
            .Add("loss", player.Loss)
            .Add("total_score", player.TotalScore)
            .Add("streak_enum", player.StreakEnum)
            .Add("azure_ad_id", player.AzureAdId)
            .Add("last_activity", player.LastActivity);

        MongoCollection.InsertOne(doc);
        player.Id = doc["_id"].ToString();
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

    public async Task<Player> UpdatePlayer(string playerId, UpdatePlayerCommand updatePlayerCommand)
    {
        var objectId = ObjectId.Parse(playerId);
        var filter = Builders<BsonDocument>.Filter.Eq(d => d["_id"], objectId);
        var getPlayer = await GetPlayerById(playerId);

        var playerDoc = new BsonDocument()
            .Add("_id", ObjectId.Parse(playerId))
            .Add("full_name", updatePlayerCommand.FullName)
            .Add("nickname", updatePlayerCommand.Nickname)
            .Add("email", updatePlayerCommand.Email)
            .Add("image_url", updatePlayerCommand.ImageUrl)
            .Add("streak", getPlayer.Streak)
            .Add("win", getPlayer.Win)
            .Add("loss", getPlayer.Loss)
            .Add("total_score", getPlayer.TotalScore)
            .Add("streak_enum", getPlayer.StreakEnum)
            .Add("azure_ad_id", getPlayer.AzureAdId)
            .Add("last_activity", updatePlayerCommand.LastActivity);

        await MongoCollection.ReplaceOneAsync(filter, playerDoc);

        return new Player
        {
            Id = playerId,
            FullName = playerDoc.GetValue("full_name").ToString(),
            Nickname = playerDoc.GetValue("nickname").ToString(),
            ImageUrl = playerDoc.GetValue("image_url").ToString(),
            Email = playerDoc.GetValue("email").ToString(),
            Streak = playerDoc.GetValue("streak").ToInt32(),
            Win = playerDoc.GetValue("win").ToInt32(),
            Loss = playerDoc.GetValue("loss").ToInt32(),
            TotalScore = playerDoc.GetValue("total_score").ToInt32(),
            AzureAdId = playerDoc.GetValue("azure_ad_id").ToString(),
            StreakEnum = (StreakEnum)playerDoc.GetValue("streak_enum").ToInt32(),
            LastActivity = playerDoc.GetValue("last_activity").ToUniversalTime()
        };
    }

    public async Task UpdateScoreOfPlayer(string playerId, bool didPlayerWin, int newElo)
    {
        var objectId = ObjectId.Parse(playerId);
        var filter = Builders<BsonDocument>.Filter.Eq(d => d["_id"], objectId);
        var getPlayer = await GetPlayerById(playerId);

        var isPlayerOnWinStreak = getPlayer.StreakEnum == StreakEnum.Win;

        
        var playerDoc = didPlayerWin switch
        {
            true when isPlayerOnWinStreak => new BsonDocument().Add("_id", ObjectId.Parse(playerId))
                .Add("full_name", getPlayer.FullName)
                .Add("nickname", getPlayer.Nickname)
                .Add("email", getPlayer.Email)
                .Add("image_url", getPlayer.ImageUrl)
                .Add("streak", getPlayer.Streak + 1)
                .Add("win", getPlayer.Win + 1)
                .Add("loss", getPlayer.Loss)
                .Add("total_score", newElo)
                .Add("streak_enum", 1)
                .Add("azure_ad_id", getPlayer.AzureAdId)
                .Add("last_activity", getPlayer.LastActivity),
            true when !isPlayerOnWinStreak => new BsonDocument().Add("_id", ObjectId.Parse(playerId))
                .Add("full_name", getPlayer.FullName)
                .Add("nickname", getPlayer.Nickname)
                .Add("email", getPlayer.Email)
                .Add("image_url", getPlayer.ImageUrl)
                .Add("streak", 1)
                .Add("win", getPlayer.Win + 1)
                .Add("loss", getPlayer.Loss)
                .Add("total_score", newElo)
                .Add("streak_enum", 1)
                .Add("azure_ad_id", getPlayer.AzureAdId)
                .Add("last_activity", getPlayer.LastActivity),
            false when isPlayerOnWinStreak => new BsonDocument().Add("_id", ObjectId.Parse(playerId))
                .Add("full_name", getPlayer.FullName)
                .Add("nickname", getPlayer.Nickname)
                .Add("email", getPlayer.Email)
                .Add("image_url", getPlayer.ImageUrl)
                .Add("streak", 1)
                .Add("win", getPlayer.Win)
                .Add("loss", getPlayer.Loss + 1)
                .Add("total_score", newElo)
                .Add("streak_enum", 2)
                .Add("azure_ad_id", getPlayer.AzureAdId)
                .Add("last_activity", getPlayer.LastActivity),
            _ => new BsonDocument().Add("_id", ObjectId.Parse(playerId))
                .Add("full_name", getPlayer.FullName)
                .Add("nickname", getPlayer.Nickname)
                .Add("email", getPlayer.Email)
                .Add("image_url", getPlayer.ImageUrl)
                .Add("streak", getPlayer.Streak + 1)
                .Add("win", getPlayer.Win)
                .Add("loss", getPlayer.Loss + 1)
                .Add("total_score", newElo)
                .Add("streak_enum", 2)
                .Add("azure_ad_id", getPlayer.AzureAdId)
                .Add("last_activity", getPlayer.LastActivity)
        };

        await MongoCollection.ReplaceOneAsync(filter, playerDoc);
    }
}