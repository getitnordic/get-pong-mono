using GetPong.Core.Handlers.Results;
using GetPong.Core.Infrastructure.Entities.Results;
using GetPong.Core.Infrastructure.Repositories;

namespace GetPong.Application.Handlers.Results;

public class GetResultByGameIdHandler : IGetResultByGameIdHandler
{

    private readonly IResultRepository _resultRepository;

    public GetResultByGameIdHandler(IResultRepository resultRepository)
    {
        _resultRepository = resultRepository;
    }

    public async Task<List<Result>> Handle(string gameId)
    {
        return await _resultRepository.GetResultByGameId(gameId);
    }
}