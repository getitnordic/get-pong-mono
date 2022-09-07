using GetPong.Core.Handlers.Results;
using GetPong.Core.Infrastructure.Entities.Results;
using GetPong.Core.Infrastructure.Repositories;

namespace GetPong.Application.Handlers.Results;

public class GetResultsHandler : IGetResultsHandler
{

    private readonly IResultRepository _resultRepository;

    public GetResultsHandler(IResultRepository resultRepository)
    {
        _resultRepository = resultRepository;
    }

    public List<Result> Handle(int limit)
    {
        return _resultRepository.GetResults(limit);
    }
}