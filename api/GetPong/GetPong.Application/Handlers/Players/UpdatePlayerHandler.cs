using GetPong.Core.Handlers.Players;
using GetPong.Core.Infrastructure.Entities.Players;
using GetPong.Core.Infrastructure.Repositories;
using GetPong.Core.Models.Commands.Players;

namespace GetPong.Application.Handlers.Players
{
    public class UpdatePlayerHandler : IUpdatePlayerHandler
    {
        private readonly IPlayerRepository _playerRepository;

        public UpdatePlayerHandler(IPlayerRepository playerRepository)
        {
            _playerRepository = playerRepository;
        }

        public Player Handle(AddPlayerCommand addPlayerCommand)
        {
            // xxxxxxxxxx
            return null;
        }
    }
}