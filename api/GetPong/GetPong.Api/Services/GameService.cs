using AutoMapper;
using Game;
using GetPong.Core.Handlers.Games;
using GetPong.Core.Infrastructure.Entities.Games;
using Grpc.Core;
using Game = GetPong.Core.Infrastructure.Entities.Games.Game;

namespace GetPong.Services;

public class GameService : global::Game.GameService.GameServiceBase
{
    private readonly IAddGameHandler _addGameHandler;
    private readonly IMapper _mapper;


    public GameService(IAddGameHandler addGameHandler, IMapper mapper)
    {
        _addGameHandler = addGameHandler;
        _mapper = mapper;
    }

    public override Task<SaveGameReply> SaveGame(SaveGameRequest request, ServerCallContext context)
    {
        var game = _addGameHandler.Handle(_mapper.Map<Core.Infrastructure.Entities.Games.Game>(request.GameModel));
        GameModel gm = new GameModel()
        {
            TimeStamp = game.TimeStamp,
            HomeTeamIds = { game.HomeTeamIds },
            AwayTeamIds = {game.AwayTeamIds}
        };


        return Task.FromResult(new SaveGameReply() {GameModel = gm});
    }
}