using GetPong.Core.Infrastructure.Entities.Games;

namespace GetPong.Core.Handlers.Games;

public interface IGetGamesHandler
{
    List<Game> Handle(int limit, int offset);
}