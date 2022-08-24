using AutoMapper;
using GetPong.Core.Handlers.Results;
using GetPong.Core.Infrastructure.Entities.Results;
using Grpc.Core;

namespace GetPong.Services;

public class ResultService : global::ResultService.ResultServiceBase
{
    private readonly IGetResultByGameIdHandler _getResultByGameIdHandler;
    private readonly IMapper _mapper;

    public ResultService(IGetResultByGameIdHandler getResultByGameIdHandler, IMapper mapper)
    {
        _getResultByGameIdHandler = getResultByGameIdHandler;
        _mapper = mapper;
    }

    public override async Task<GetResultByGameIdReply> GetResultByGameId(GetResultByGameIdRequest request,
        ServerCallContext context)
    {
        var result = await _getResultByGameIdHandler.Handle(request.GameId);
       
        var resultModel = _mapper.Map<List<ResultModel>>(result);
        
        return new GetResultByGameIdReply() { ResultModel = {resultModel} };
    }
}