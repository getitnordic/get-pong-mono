using System;
using GetPong.Core.Handlers.Players;
using GetPong.Core.Infrastructure.Entities.Players;
using GetPong.Core.Infrastructure.Repositories;
using GetPong.Core.Models.Commands.Players;
using GetPong.Core.Models.Enum;

namespace GetPong.Application.Handlers.Players
{
    public class AddPlayerHandler : IAddPlayerHandler
    {
        private readonly IPlayerRepository _playerRepository;

        public AddPlayerHandler(IPlayerRepository playerRepository)
        {
            _playerRepository = playerRepository;
        }
        
        public Player Handle(AddPlayerCommand addPlayerCommand)
        {
            ValidatePlayerCommand(addPlayerCommand);
            Player player = new Player
            {
                FirstName = addPlayerCommand.FirstName,
                LastName = addPlayerCommand.LastName,
                Nickname = addPlayerCommand.Nickname,
                Email = addPlayerCommand.Email,
                ImageUrl = "",
                Streak = 0,
                Win = 0,
                Loss = 0,
                TotalScore = 1000,
                StreakEnum = StreakEnum.None
            };

            _playerRepository.RegisterExternal(player);

            return player;
        }

        private void ValidatePlayerCommand(AddPlayerCommand playerCommand)
        {
            if (string.IsNullOrEmpty(playerCommand.FirstName))
            {
                throw new Exception("firstname is mandatory");
            }
        }

        public Player Handle(Player addPlayerCommand)
        {
            throw new NotImplementedException();
        }
    }
}