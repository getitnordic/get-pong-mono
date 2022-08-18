using GetPong.Core.Infrastructure.Entities.Players;
using GetPong.Core.Models.Commands.Players;

namespace GetPong.Core.Handlers.Players
{
    public interface IUpdatePlayerHandler
    {
        Task<Player> Handle(string playerId, UpdatePlayerCommand updatePlayerCommand);
    }
}