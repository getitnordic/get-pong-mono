using MongoDB.Bson.Serialization.Attributes;

namespace GetPong.Core.Infrastructure.Entities.Results;

public class Result

{
    public Result()
    {
    }

    private int EloDiff { set; get; }
    private int NewElo { set; get; }
    bool GameWon { set; get; }
    [BsonDateTimeOptions(Kind = DateTimeKind.Utc)]
    public DateTime TimeStamp { get; set; }
    string GameId { set; get; }
}