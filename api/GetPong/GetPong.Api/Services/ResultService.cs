
using Grpc.Core;

namespace GetPong.Services;

public class ResultService : global::ResultService.ResultServiceBase
{
    public override Task<GetResultByGameIdReply> GetResultByGameId(GetResultByGameIdRequest request, ServerCallContext context)
    {
        return base.GetResultByGameId(request, context);
    }
}