using GetPong.Core.Core.Helpers;
using MongoDB.Bson;

namespace GetPong.Application.Helpers;

public class Helper : IHelper
{
    public string getStringValue(BsonDocument doc, string key)
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

    public int getIntValue(BsonDocument doc, string key)
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

    public long getLongValue(BsonDocument doc, string key)
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