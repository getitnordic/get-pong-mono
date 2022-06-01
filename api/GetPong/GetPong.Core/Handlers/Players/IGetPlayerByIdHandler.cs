using System.Threading.Tasks;
using GetPong.Core.Infrastructure.Entities.Players;

namespace GetPong.Core.Handlers.Players
{
    public interface IGetPlayerByIdHandler
    {
        Task<Player> Handle(string playerId);
    }
}