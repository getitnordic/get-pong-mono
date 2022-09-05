using GetPong.Core.Infrastructure.Entities.Games;

namespace GetPong.Core.Handlers.Games;

public interface IAddGameHandler
{
    Task<Game> Handle(Game game);
}