using System.Threading.Tasks;
using GetPong.Core.Handlers.Players;
using GetPong.Core.Infrastructure.Entities.Players;
using GetPong.Core.Infrastructure.Repositories;

namespace GetPong.Application.Handlers.Players
{
    public class GetPlayerByIdHandler : IGetPlayerByIdHandler
    {
        private readonly IPlayerRepository _playerRepository;

        public GetPlayerByIdHandler(IPlayerRepository playerRepository)
        {
            _playerRepository = playerRepository;
        }

        public async Task<Player> Handle(string playerId)
        {
            return await _playerRepository.GetPlayerById(playerId);
        }
    }
}