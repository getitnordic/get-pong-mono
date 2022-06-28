using AutoMapper;
using Game;
using GetPong.Core.Handlers.Games;
using GetPong.Core.Handlers.Players;
using GetPong.Core.Infrastructure.Entities.Games;
using GetPong.Core.Models.Commands.Players;
using Grpc.Core;
using Game = GetPong.Core.Infrastructure.Entities.Games.Game;

namespace GetPong.Services;

public class GameService : global::Game.GameService.GameServiceBase
{
    private readonly IAddGameHandler _addGameHandler;
    private readonly IGetGamesHandler _getGamesHandler;
    private readonly IGetPlayerByIdHandler _getPlayerByIdHandler;
    private readonly IUpdatePlayerHandler _updatePlayerHandler;
    private readonly IMapper _mapper;


    public GameService(IAddGameHandler addGameHandler, IMapper mapper, IGetGamesHandler getGamesHandler,
        IGetPlayersHandler getPlayersHandler, IGetPlayerByIdHandler getPlayerByIdHandler, IUpdatePlayerHandler updatePlayerHandler)
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
        var playerOneCommand = new UpdatePlayerCommand()
        {
            Email = playerOne.Email,
            Nickname = playerOne.Nickname,
            FirstName = playerOne.FirstName,
            LastName = playerOne.LastName,
            ImageUrl = playerOne.ImageUrl,
            LastActivity = DateTime.SpecifyKind(DateTime.Now, DateTimeKind.Utc)
        };
        var playerTwoCommand = new UpdatePlayerCommand()
        {
            Email = playerTwo.Email,
            Nickname = playerTwo.Nickname,
            FirstName = playerTwo.FirstName,
            LastName = playerTwo.LastName,
            ImageUrl = playerTwo.ImageUrl,
            LastActivity = DateTime.SpecifyKind(DateTime.Now, DateTimeKind.Utc)
        };
        var updated1 = _updatePlayerHandler.Handle(playerOne.Id, playerOneCommand);
        var updated2 = _updatePlayerHandler.Handle(playerTwo.Id, playerTwoCommand);
        //
        
     

        return Task.FromResult(new SaveGameReply() {GameModel = gameModel});
    }

    public override Task<GetGamesReply> GetGames(GetGamesRequest request, ServerCallContext context)
    {
        var games = _getGamesHandler.Handle(request.Limit, request.Offset);
        var gameModel = _mapper.Map<List<GameModel>>(games);
        
        return Task.FromResult(new GetGamesReply() {GameModel = {gameModel}});
    }
    
    
}