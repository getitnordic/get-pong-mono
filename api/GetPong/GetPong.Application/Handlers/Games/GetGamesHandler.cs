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
        
        var offsetMax = offset * limit;
        var offsetMin = offsetMax - limit;

        // This should probably only query the documents we actually want, instead of getting all and then doing the pagenation?
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