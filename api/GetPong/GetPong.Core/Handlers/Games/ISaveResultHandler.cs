using GetPong.Core.Infrastructure.Entities.Games;
using GetPong.Core.Infrastructure.Entities.Results;

namespace GetPong.Core.Handlers.Games;

public interface ISaveResultHandler
{
    void Handle(Game game);
}