using MongoDB.Bson;

namespace GetPong.Core.Core.Helpers;

public interface IHelper
{
    string GetStringValue(BsonDocument doc, string key);
    int GetIntValue(BsonDocument doc, string key);
    long GetLongValue(BsonDocument doc, string key);
}