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
        var offsetMax = offset * limit; // 10
        var offsetMin = offsetMax - limit; // 0

        var games = _gameRepository.GetGames();

        var gamesList = games.OrderBy(g => g.TimeStamp).ToList();
        gamesList.Reverse();

        List<Game> pagenatedList = new List<Game>();
        for (int i = offsetMin; i < offsetMax; i++)
        {
            pagenatedList.Add(gamesList[i]);
        }

        return pagenatedList;
    }
}