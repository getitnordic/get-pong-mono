using GetPong.Core.Models.Enum;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace GetPong.Core.Infrastructure.Entities.Players
{
    public class Player
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string Id { set; get; }
        public string FirstName { set; get; }
        public string LastName { set; get; }
        public string Nickname { set; get; }
        public string ImageUrl { set; get; }
        public string Email { set; get; }
        public int Streak { set; get; }
        public int Win { set; get; }
        public int Loss { set; get; }
        public int TotalScore { set; get; }
        public StreakEnum StreakEnum { set; get; }
    }
}