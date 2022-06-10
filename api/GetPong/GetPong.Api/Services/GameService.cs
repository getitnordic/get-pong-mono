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
    private readonly IGetGamesHandler _getGamesHandler;
    private readonly IMapper _mapper;


    public GameService(IAddGameHandler addGameHandler, IMapper mapper, IGetGamesHandler getGamesHandler)
    {
        _addGameHandler = addGameHandler;
        _mapper = mapper;
        _getGamesHandler = getGamesHandler;
    }

    public override Task<SaveGameReply> SaveGame(SaveGameRequest request, ServerCallContext context)
    {
        var game = _addGameHandler.Handle(_mapper.Map<Core.Infrastructure.Entities.Games.Game>(request.GameModel));
        var gameModel = _mapper.Map<GameModel>(game);

        return Task.FromResult(new SaveGameReply() {GameModel = gameModel});
    }

    public override Task<GetGamesReply> GetGames(GetGamesRequest request, ServerCallContext context)
    {
        var games = _getGamesHandler.Handle(request.Limit, request.Offset);
        var gameModel = _mapper.Map<List<GameModel>>(games);
        
        return Task.FromResult(new GetGamesReply() {GameModel = {gameModel}});
    }
}