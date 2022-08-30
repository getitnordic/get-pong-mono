
namespace GetPong.Core.Infrastructure.Repositories;

public interface IBlobRepository
{
    Task<string> UpdatePlayerPicture(string playerId, string base64Data);
    Task<string> DeletePlayerPicture(string playerId);
}