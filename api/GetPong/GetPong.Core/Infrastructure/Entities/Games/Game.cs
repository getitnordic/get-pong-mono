using System.Collections.Generic;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace GetPong.Core.Infrastructure.Entities.Games
{
    public class Game
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string? Id { set; get; }
        [BsonDateTimeOptions(Kind = DateTimeKind.Utc)]

        public DateTime TimeStamp { set; get; }
        public List<string> HomeTeamIds { set; get; }
        public List<string> AwayTeamIds { set; get; }
        public List<GameSet> Sets { set; get; }

      
    }
}