using GetPong.Core.Infrastructure.Entities.Results;

namespace GetPong.Core.Handlers.Results;

public interface IGetResultByGameIdHandler
{
    Task<Result> Handle(String gameId);
}