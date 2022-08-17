using AutoMapper;
using Game;
using GetPong.Core.Handlers.Games;
using GetPong.Core.Handlers.Players;
using GetPong.Core.Models.Commands.Players;
using Grpc.Core;

namespace GetPong.Services;

public class GameService : global::Game.GameService.GameServiceBase
{
    private readonly IAddGameHandler _addGameHandler;
    private readonly IGetGamesHandler _getGamesHandler;
    private readonly IGetPlayerByIdHandler _getPlayerByIdHandler;
    private readonly IUpdatePlayerHandler _updatePlayerHandler;
    private readonly IMapper _mapper;

    public GameService(IAddGameHandler addGameHandler, IMapper mapper, IGetGamesHandler getGamesHandler,
        IGetPlayerByIdHandler getPlayerByIdHandler,
        IUpdatePlayerHandler updatePlayerHandler)
    {
        _addGameHandler = addGameHandler;
        _mapper = mapper;
        _getGamesHandler = getGamesHandler;
        _getPlayerByIdHandler = getPlayerByIdHandler;
        _updatePlayerHandler = updatePlayerHandler;
    }

    public override Task<SaveGameReply> SaveGame(SaveGameRequest request, ServerCallContext context)
    {
        var game = _addGameHandler.Handle(_mapper.Map<Core.Infrastructure.Entities.Games.Game>(request.GameModel));
        var gameModel = _mapper.Map<GameModel>(game);

        //Update lastActivity on players in the game. Add functionality for doubles and make it cleaner later.
        var playerOne = _getPlayerByIdHandler.Handle(game.HomeTeamIds[0]).Result;
        var playerTwo = _getPlayerByIdHandler.Handle(game.AwayTeamIds[0]).Result;
        var playerOneCommand = _mapper.Map<UpdatePlayerCommand>(playerOne);
        var playerTwoCommand = _mapper.Map<UpdatePlayerCommand>(playerTwo);
        playerOneCommand.LastActivity = DateTime.SpecifyKind(DateTime.Now, DateTimeKind.Utc);
        playerTwoCommand.LastActivity = DateTime.SpecifyKind(DateTime.Now, DateTimeKind.Utc);
        var updated1 = _updatePlayerHandler.Handle(playerOne.Id, playerOneCommand);
        var updated2 = _updatePlayerHandler.Handle(playerTwo.Id, playerTwoCommand);

        //For doubles
        if (game.HomeTeamIds.Count != 2) return Task.FromResult(new SaveGameReply() { GameModel = gameModel });

        var playerThree = _getPlayerByIdHandler.Handle(game.HomeTeamIds[1]).Result;
        var playerFour = _getPlayerByIdHandler.Handle(game.AwayTeamIds[1]).Result;
        var playerThreeCommand = _mapper.Map<UpdatePlayerCommand>(playerThree);
        var playerFourCommand = _mapper.Map<UpdatePlayerCommand>(playerFour);
        playerThreeCommand.LastActivity = DateTime.SpecifyKind(DateTime.Now, DateTimeKind.Utc);
        playerFourCommand.LastActivity = DateTime.SpecifyKind(DateTime.Now, DateTimeKind.Utc);
        var updated3 = _updatePlayerHandler.Handle(playerThree.Id, playerThreeCommand);
        var updated4 = _updatePlayerHandler.Handle(playerFour.Id, playerFourCommand);
        //

        return Task.FromResult(new SaveGameReply() { GameModel = gameModel });
    }

    public override Task<GetGamesReply> GetGames(GetGamesRequest request, ServerCallContext context)
    {
        var games = _getGamesHandler.Handle(request.Limit, request.Offset);
        var gameModel = _mapper.Map<List<GameModel>>(games);

        return Task.FromResult(new GetGamesReply() { GameModel = { gameModel } });
    }
}