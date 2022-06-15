using MongoDB.Bson;

namespace GetPong.Core.Core.Helpers;

public interface IHelper
{
    string getStringValue(BsonDocument doc, string key);
    int getIntValue(BsonDocument doc, string key);
    long getLongValue(BsonDocument doc, string key);
}