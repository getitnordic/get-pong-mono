using AutoMapper;
using GetPong.Core.Handlers.Results;
using GetPong.Core.Infrastructure.Entities.Results;
using Grpc.Core;

namespace GetPong.Services;

public class ResultService : global::ResultService.ResultServiceBase
{
    private readonly IGetResultByGameIdHandler _getResultByGameIdHandler;
    private readonly IGetResultsByPlayerIdHandler _getResultsByPlayerIdHandler;
    private readonly IGetResultsHandler _getResultsHandler;
    private readonly IMapper _mapper;

    public ResultService(IGetResultByGameIdHandler getResultByGameIdHandler, IMapper mapper, IGetResultsByPlayerIdHandler getResultsByPlayerIdHandler, IGetResultsHandler getResultsHandler)
    {
        _getResultByGameIdHandler = getResultByGameIdHandler;
        _getResultsByPlayerIdHandler = getResultsByPlayerIdHandler;
        _getResultsHandler = getResultsHandler;
        _mapper = mapper;
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
        var resultList = _getResultsByPlayerIdHandler.Handle(request.PlayerId, request.Limit, request.Offset);
        var resultModel = _mapper.Map<List<ResultModel>>(resultList);
        
        return new GetResultsByPlayerIdReply() { ResultModels = { resultModel } };
    }

    public override Task<GetResultsReply> GetResults(GetResultsRequest request, ServerCallContext context)
    {
        var results = _getResultsHandler.Handle(request.Limit);
        var resultModels = _mapper.Map<List<ResultModel>>(results);

        return Task.FromResult(new GetResultsReply() {ResultModel = {resultModels}});
    }
}