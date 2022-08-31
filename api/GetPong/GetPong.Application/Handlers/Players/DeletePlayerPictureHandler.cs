using GetPong.Core.Handlers.Players;
using GetPong.Core.Infrastructure.Repositories;

namespace GetPong.Application.Handlers.Players;

public class DeletePlayerPictureHandler : IDeletePlayerPictureHandler

{
    private readonly IBlobRepository _blobRepository;

    public DeletePlayerPictureHandler(IBlobRepository blobRepository)
    {
        _blobRepository = blobRepository;
    }

    public async Task<string> Handle(string playerId)
    {
        return await _blobRepository.DeletePlayerPicture(playerId);
    }
}