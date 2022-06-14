using GetPong.Core.Models.Enum;
using Microsoft.Graph;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace GetPong.Core.Infrastructure.Entities.Players
{
    public class Player
    {
        public Player() {}
        
        public Player(BsonDocument doc)
        {
            Id = doc.GetValue("_id", "").ToString();
            FirstName = doc.GetValue("first_name").AsString;
            LastName = doc.GetValue("last_name").AsString;
            Nickname = doc.GetValue("nickname").AsString;
            ImageUrl = doc.GetValue("image_url").AsString;
            Email = doc.GetValue("email").AsString;
            Streak = doc.GetValue("streak").AsInt32;
            Win = doc.GetValue("win").AsInt32;
            Loss = doc.GetValue("loss").AsInt32;
            TotalScore = doc.GetValue("total_score").AsInt32;
            AzureAdId = doc.GetValue("azure_ad_id", "N/A").AsString;
            StreakEnum = (StreakEnum)doc.GetValue("streak_enum").AsInt32;
        }
        
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
        public string AzureAdId { set; get; }
        public StreakEnum StreakEnum { set; get; }
    }
}