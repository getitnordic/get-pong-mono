using System.Collections.Generic;
using GetPong.Core.Infrastructure.Entities.Players;

namespace GetPong.Core.Handlers.Players
{
    public interface IGetPlayersHandler
    {
        List<Player> Handle();
    }
}