using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace GetPong.Core.Infrastructure.Entities.Results;

public class Result

{
    public Result() { }
    
    public Result(BsonDocument doc)
    {
        EloDiff = doc.GetValue("elo_diff").AsInt32;
        NewElo = doc.GetValue("new_elo").AsInt32;
        GameWon = doc.GetValue("game_won").AsBoolean;;
        TimeStamp  = doc.GetValue("time_stamp").ToUniversalTime();;
        GameId  = doc.GetValue("game_id").AsString;
        PlayerId = doc.GetValue("player_id").AsString;
    }

    public int EloDiff { set; get; }
    public int NewElo { set; get; }
    public bool GameWon { set; get; }
    [BsonDateTimeOptions(Kind = DateTimeKind.Utc)]
    public DateTime TimeStamp { get; set; }
    public string GameId { set; get; }
    public string PlayerId { set; get; }
}