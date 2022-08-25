using GetPong.Core.Infrastructure.Entities.Results;

namespace GetPong.Core.Handlers.Results;

public interface IGetResultsByPlayerId
{
    List<Result> Handle(string playerId, int limit, int offset);
}