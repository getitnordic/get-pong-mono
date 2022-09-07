using GetPong.Core.Infrastructure.Entities.Results;

namespace GetPong.Core.Handlers.Results;

public interface IGetResultsHandler
{
    List<Result> Handle(int limit);
}