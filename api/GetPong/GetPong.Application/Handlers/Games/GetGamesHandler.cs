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
        // TODO: Make pagenation logic cleaner and do exception handling for request out of scope

        // This should probably only query the documents we actually want, instead of getting all and then doing the pagenation?
        var games = _gameRepository.GetGames(offset, limit);

        return games;
    }
}