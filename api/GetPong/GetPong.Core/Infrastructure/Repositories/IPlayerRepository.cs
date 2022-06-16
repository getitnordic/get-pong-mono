using System.Collections.Generic;
using System.Threading.Tasks;
using GetPong.Core.Infrastructure.Entities.Players;
using GetPong.Core.Models.Commands.Players;

namespace GetPong.Core.Infrastructure.Repositories
{
    public interface IPlayerRepository
    {
        Player RegisterPlayer(Player player);

        List<Player> GetPlayers();

        Task<Player> GetPlayerById(string playerId);

        Task<Player> UpdatePlayer(string playerId, AddPlayerCommand addPlayerCommand);

        void UpdateScoreOfPlayer(string playerId, bool didPlayerWin);

    }
}