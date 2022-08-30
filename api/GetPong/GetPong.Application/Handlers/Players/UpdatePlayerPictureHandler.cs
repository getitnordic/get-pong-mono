using GetPong.Core.Handlers.Players;
using GetPong.Core.Infrastructure.Repositories;

namespace GetPong.Application.Handlers.Players;

public class UpdatePlayerPictureHandler : IUpdatePlayerPictureHandler
{
    private readonly IBlobRepository _blobRepository;

    public UpdatePlayerPictureHandler(IBlobRepository blobRepository)
    {
        _blobRepository = blobRepository;
    }

    public async Task<string> Handle(string playerId, string base64Data)
    {
        return await _blobRepository.UpdatePlayerPicture(playerId, base64Data);
    }
}