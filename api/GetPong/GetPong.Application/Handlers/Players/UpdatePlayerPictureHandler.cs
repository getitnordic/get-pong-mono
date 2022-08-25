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

    public string Handle(string playerId, string base64Data)
    {
        var responseMessage = _blobRepository.UpdatePlayerPicture(playerId, base64Data);
        
        //TODO: this retrieves name of thread, change this to something that makes sense
        return responseMessage.ToString();
    }
}