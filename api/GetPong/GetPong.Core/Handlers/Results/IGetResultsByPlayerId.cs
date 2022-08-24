using GetPong.Core.Infrastructure.Entities.Results;

namespace GetPong.Core.Handlers.Results;

public interface IGetResultsByPlayerId
{
    List<Result> Handle(String playerId);
}