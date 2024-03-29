﻿using System.Collections;
using GetPong.Core.Infrastructure.Entities.Games;
using GetPong.Core.Infrastructure.Repositories;
using Microsoft.Extensions.Configuration;
using MongoDB.Bson;
using MongoDB.Driver;

namespace GetPong.Infrastructure.MongoDb
{
    public class GameRepository : IGameRepository
    {
        private readonly IMongoCollection<BsonDocument> MongoCollection;
        private readonly IConfiguration _configuration;

        public GameRepository(IConfiguration configuration)
        {
            _configuration = configuration;
            var MongoClient = new MongoClient(_configuration["MongoDb:ConnectionString"]);
            var MongoDatabase = MongoClient.GetDatabase("gpdb");
            MongoCollection = MongoDatabase.GetCollection<BsonDocument>("games");
        }

        public Game AddGame(Game game)
        {
            var doc = new BsonDocument()
                .Add("time_stamp", DateTime.UtcNow)
                .Add("home_team_ids", new BsonArray(game.HomeTeamIds))
                .Add("away_team_ids", new BsonArray(game.AwayTeamIds))
                .Add("sets", new BsonArray(game.Sets.Select(i => i.ToBsonDocument())));

            MongoCollection.InsertOne(doc);

            game.Id = doc["_id"].ToString();
            game.TimeStamp = doc["time_stamp"].ToUniversalTime();
            return game;
        }

        public List<Game> GetGames(int offset, int limit)
        {
            var allGamesBson = MongoCollection.Find(new BsonDocument()).Sort("{time_stamp: -1}").Skip(offset).Limit(limit).ToList();

            return allGamesBson.Select(doc => new Game(doc)).ToList();
        }

        public  List<Game> GetGamesByPlayerId(string playerId)
        {
            var builder = Builders<BsonDocument>.Filter;
            var filter = builder.Eq("home_team_ids", playerId) | builder.Eq("away_team_ids", playerId);
            var allGamesBson = MongoCollection.Find(filter).ToList();

            return allGamesBson.Select(i=> new Game(i)).ToList(); 
        }
    }
}