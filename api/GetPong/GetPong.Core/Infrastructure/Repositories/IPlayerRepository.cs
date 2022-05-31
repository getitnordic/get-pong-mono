using GetPong.Core.Infrastructure.Entities.Players;

namespace GetPong.Core.Infrastructure.Repositories
{
    public interface IPlayerRepository
    {
        Player RegisterExternal(Player player);
    }
}