using GetPong.Core.Core.Helpers;
using MongoDB.Bson;

namespace GetPong.Application.Helpers;

public class Helper : IHelper
{
    public string GetStringValue(BsonDocument doc, string key)
    {
        try
        {
            return doc.GetValue(key)?.ToString() ?? "";
        }
        catch (Exception e)
        {
            return "";
        }
    }

    public int GetIntValue(BsonDocument doc, string key)
    {
        try
        {
            return doc.GetValue(key)?.ToInt32() ?? 0;
        }
        catch (Exception e)
        {
            return 0;
        }
    }

    public long GetLongValue(BsonDocument doc, string key)
    {
        try
        {
            return doc.GetValue(key)?.ToInt64() ?? 0;
        }
        catch (Exception e)
        {
            return 0;
        }
    }
}