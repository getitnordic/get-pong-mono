using GetPong.Core.Handlers.Games;
using GetPong.Core.Infrastructure.Entities.Games;
using GetPong.Core.Infrastructure.Repositories;

namespace GetPong.Application.Handlers.Games;

public class GetGamesByPlayerIdHandler : IGetGamesByPlayerIdHandler
{
    private readonly IGameRepository _gameRepository;

    public GetGamesByPlayerIdHandler(IGameRepository gameRepository)
    {
        _gameRepository = gameRepository;
    }

    public Task<List<Game>> Handle(string playerId)
    {
        return  Task.FromResult(_gameRepository.GetGamesByPlayerId(playerId));
    }
}