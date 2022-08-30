using GetPong.Core.Infrastructure.Entities.Players;

namespace GetPong.Core.Handlers.Players;

public interface ISyncAzureAdToDb
{
    void Handle();
}