using GetPong.Core.Handlers.Players;
using GetPong.Core.Infrastructure.Entities.Players;
using GetPong.Core.Infrastructure.Repositories;

namespace GetPong.Application.old.Handlers.Players
{
    public class GetPlayersHandler : IGetPlayersHandler
    {
        private readonly IPlayerRepository _playerRepository;

        public GetPlayersHandler(IPlayerRepository playerRepository)
        {
            _playerRepository = playerRepository;
        }

        public List<Player> Handle()
        {
            return _playerRepository.GetPlayers();

        }

    }
}