using System;
using System.Threading.Tasks;
using GetPong.Core.Handlers.Players;
using GetPong.Core.Infrastructure.Entities.Players;
using GetPong.Core.Infrastructure.Repositories;
using GetPong.Core.Models.Commands.Players;

namespace GetPong.Application.old.Handlers.Players
{
    public class UpdatePlayerHandler : IUpdatePlayerHandler
    {
        private readonly IPlayerRepository _playerRepository;

        public UpdatePlayerHandler(IPlayerRepository playerRepository)
        {
            _playerRepository = playerRepository;
        }

        public  async Task<Player> Handle(string playerId, UpdatePlayerCommand updatePlayerCommand)
        {
            return await _playerRepository.UpdatePlayer(playerId, updatePlayerCommand);
        }
    }
}