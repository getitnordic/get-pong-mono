using GetPong.Core.Core.Helpers;
using GetPong.Core.Handlers.Games;
using GetPong.Core.Infrastructure.Entities.Games;
using GetPong.Core.Infrastructure.Repositories;

namespace GetPong.Application.Handlers.Games
{
    public class AddGameHandler : IAddGameHandler
    {
        private readonly IGameRepository _gameRepository;
        private readonly IGameHelper _gameHelper;

        public AddGameHandler(IGameRepository gameRepository, IGameHelper gameHelper)
        {
            _gameRepository = gameRepository;
            _gameHelper = gameHelper;
        }

        public Game Handle(Game game)
        {
            var gameInDb = _gameRepository.AddGame(game);
            if (game.HomeTeamIds.Count == 2)
                _gameHelper.SaveDoubleMatchScoreToDb(gameInDb);
            else
                _gameHelper.SaveSingleMatchScoreToDb(gameInDb);

            return gameInDb;
        }
    }
}