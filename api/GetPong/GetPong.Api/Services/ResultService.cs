using AutoMapper;
using GetPong.Core.Handlers.Results;
using GetPong.Core.Infrastructure.Entities.Results;
using Grpc.Core;

namespace GetPong.Services;

public class ResultService : global::ResultService.ResultServiceBase
{
    private readonly IGetResultByGameIdHandler _getResultByGameIdHandler;
    private readonly IGetResultsByPlayerId _getResultsByPlayerId;
    private readonly IMapper _mapper;

    public ResultService(IGetResultByGameIdHandler getResultByGameIdHandler, IMapper mapper, IGetResultsByPlayerId getResultsByPlayerId)
    {
        _getResultByGameIdHandler = getResultByGameIdHandler;
        _mapper = mapper;
        _getResultsByPlayerId = getResultsByPlayerId;
    }

    public override async Task<GetResultByGameIdReply> GetResultByGameId(GetResultByGameIdRequest request,
        ServerCallContext context)
    {
        var result = await _getResultByGameIdHandler.Handle(request.GameId);
       
        var resultModel = _mapper.Map<List<ResultModel>>(result);
        
        return new GetResultByGameIdReply() { ResultModel = {resultModel} };
    }

    public override async Task<GetResultsByPlayerIdReply> GetResultsByPlayerId(GetResultsByPlayerIdRequest request, ServerCallContext context)
    {
        var resultList = _getResultsByPlayerId.Handle(request.PlayerId);
        var resultModel = _mapper.Map<List<ResultModel>>(resultList);
        return new GetResultsByPlayerIdReply() { ResultModels = { resultModel } };

    }
}