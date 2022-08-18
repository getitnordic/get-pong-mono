using GetPong.Core.Infrastructure.Entities.Games;

namespace GetPong.Core.Infrastructure.Repositories
{
    public interface IGameRepository
    {
        Game AddGame(Game game);
        List<Game> GetGames(int offset, int limit);
    }
}