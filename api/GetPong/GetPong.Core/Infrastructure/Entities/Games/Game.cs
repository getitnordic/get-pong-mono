using GetPong.Core.Models.Enum;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace GetPong.Core.Infrastructure.Entities.Games;

public class Game
{
    public Game() { }

    public Game(BsonDocument doc)
    {
        Id = doc.GetValue("_id", "").ToString();
        TimeStamp = doc.GetValue("time_stamp").ToUniversalTime();
        HomeTeamIds = doc.GetValue("home_team_ids").AsBsonArray.Select(x => x.AsString).ToList();
        AwayTeamIds = doc.GetValue("away_team_ids").AsBsonArray.Select(x => x.AsString).ToList();
        Sets = doc.GetValue("sets").AsBsonArray.Select(x => new GameSet()
        {
            AwayTeam = x.AsBsonDocument.GetValue("AwayTeam").AsInt32,
            HomeTeam = doc.GetValue("", x.AsBsonDocument.GetValue("HomeTeam")).AsInt32,
            SetNo = doc.GetValue("", x.AsBsonDocument.GetValue("SetNo")).AsInt32
        }).ToList();
    }

    [BsonId]
    [BsonRepresentation(BsonType.ObjectId)]
    public string? Id { set; get; }

    [BsonDateTimeOptions(Kind = DateTimeKind.Utc)]

    public DateTime TimeStamp { set; get; }

    public List<string> HomeTeamIds { set; get; }
    public List<string> AwayTeamIds { set; get; }
    public List<GameSet> Sets { set; get; }
}