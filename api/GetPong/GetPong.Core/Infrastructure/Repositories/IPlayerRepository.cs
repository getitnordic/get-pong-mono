using System.Collections.Generic;
using System.Threading.Tasks;
using GetPong.Core.Infrastructure.Entities.Players;

namespace GetPong.Core.Infrastructure.Repositories
{
    public interface IPlayerRepository
    {
        Player RegisterExternal(Player player);
        List<Player> GetPlayers();

        Task<Player> GetPlayerById(string playerId);
    }
}