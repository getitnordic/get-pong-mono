using GetPong.Core.Infrastructure.Entities.Games;
using GetPong.Core.Infrastructure.Entities.Results;

namespace GetPong.Core.Handlers.Games;

public interface ISaveResultHandler
{
    Task<Result> Handle(Game game);
}