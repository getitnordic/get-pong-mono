using GetPong.Core.Handlers.Games;
using GetPong.Core.Infrastructure.Entities.Games;
using GetPong.Core.Infrastructure.Repositories;

namespace GetPong.Application.Handlers.Games;

public class GetGamesHandler : IGetGamesHandler
{
    private readonly IGameRepository _gameRepository;

    public GetGamesHandler(IGameRepository gameRepository)
    {
        _gameRepository = gameRepository;
    }

    public List<Game> Handle(int limit, int offset)
    {
        return _gameRepository.GetGames(offset, limit);
    }
}