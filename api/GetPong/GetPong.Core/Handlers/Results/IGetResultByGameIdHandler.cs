using GetPong.Core.Infrastructure.Entities.Results;

namespace GetPong.Core.Handlers.Results;

public interface IGetResultByGameIdHandler
{
    Task<List<Result>> Handle(String gameId);
}