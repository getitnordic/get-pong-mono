using GetPong.Core.Infrastructure.Entities.Players;
using GetPong.Core.Models.Commands.Players;

namespace GetPong.Core.Infrastructure.Repositories
{
    public interface IPlayerRepository
    {
        void RegisterPlayer(Player player);

        List<Player> GetPlayers();

        Task<Player> GetPlayerById(string playerId);

        Task<Player> UpdatePlayer(string playerId, UpdatePlayerCommand updatePlayerCommand);

        Task UpdateScoreOfPlayer(string playerId, bool didPlayerWin, int newElo);
        
    }
}