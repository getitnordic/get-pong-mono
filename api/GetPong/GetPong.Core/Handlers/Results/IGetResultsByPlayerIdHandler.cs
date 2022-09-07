using GetPong.Core.Infrastructure.Entities.Results;

namespace GetPong.Core.Handlers.Results;

public interface IGetResultsByPlayerIdHandler
{
    List<Result> Handle(string playerId, int limit, int offset);
}