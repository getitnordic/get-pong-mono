using System.Threading.Tasks;
using GetPong.Core.Handlers.Games;
using GetPong.Core.Infrastructure.Entities.Games;
using GetPong.Core.Infrastructure.Repositories;

namespace GetPong.Application.Handlers.Games
{
    public class AddGameHandler : IAddGameHandler
    {
        private readonly IGameRepository _gameRepository;

        public AddGameHandler(IGameRepository gameRepository)
        {
            _gameRepository = gameRepository;
        }

        public Game Handle(Game game)
        {
            return _gameRepository.AddGame(game);
        }
    }
}