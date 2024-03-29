﻿using AutoMapper;
using Base;
using Game;
using GetPong.Application.Helpers;
using GetPong.Core.Handlers.Games;
using GetPong.Core.Handlers.Players;
using GetPong.Core.Models.Commands.Players;
using Grpc.Core;
using Player;

namespace GetPong.Services;

public class GameService : global::Game.GameService.GameServiceBase
{
    private readonly IAddGameHandler _addGameHandler;
    private readonly IGetGamesHandler _getGamesHandler;
    private readonly IGetPlayerByIdHandler _getPlayerByIdHandler;
    private readonly IUpdatePlayerHandler _updatePlayerHandler;
    private readonly IGetGamesByPlayerIdHandler _getGamesByPlayerIdHandler;
    private readonly ISaveResultHandler _saveResultHandler;
    private readonly IGetWinProbabilityHandler _getWinProbabilityHandler;
    private readonly IMapper _mapper;


    public GameService(IAddGameHandler addGameHandler, IMapper mapper, IGetGamesHandler getGamesHandler,
        IGetPlayerByIdHandler getPlayerByIdHandler,
        IUpdatePlayerHandler updatePlayerHandler, IGetGamesByPlayerIdHandler getGamesByPlayerIdHandler,
        ISaveResultHandler saveResultHandler, IGetWinProbabilityHandler getWinProbabilityHandler)
    {
        _addGameHandler = addGameHandler;
        _getGamesHandler = getGamesHandler;
        _getPlayerByIdHandler = getPlayerByIdHandler;
        _updatePlayerHandler = updatePlayerHandler;
        _getGamesByPlayerIdHandler = getGamesByPlayerIdHandler;
        _saveResultHandler = saveResultHandler;
        _getWinProbabilityHandler = getWinProbabilityHandler;
        _mapper = mapper;
    }

    public override async Task<SaveGameReply> SaveGame(SaveGameRequest request, ServerCallContext context)
    {
        var game = await _addGameHandler.Handle(
            _mapper.Map<Core.Infrastructure.Entities.Games.Game>(request.GameModel));
        await _saveResultHandler.Handle(game);
        var gameModel = _mapper.Map<GameModel>(game);

        //Update lastActivity on players in the game. 
        var playerOne = _getPlayerByIdHandler.Handle(game.HomeTeamIds[0]).Result;
        var playerTwo = _getPlayerByIdHandler.Handle(game.AwayTeamIds[0]).Result;

        var playerOneCommand = _mapper.Map<UpdatePlayerCommand>(playerOne);
        var playerTwoCommand = _mapper.Map<UpdatePlayerCommand>(playerTwo);
        playerOneCommand.LastActivity = DateTime.SpecifyKind(DateTime.Now, DateTimeKind.Utc);
        playerTwoCommand.LastActivity = DateTime.SpecifyKind(DateTime.Now, DateTimeKind.Utc);
        await _updatePlayerHandler.Handle(playerOne.Id, playerOneCommand);
        await _updatePlayerHandler.Handle(playerTwo.Id, playerTwoCommand);

        //For doubles
        if (game.HomeTeamIds.Count != 2) return new SaveGameReply() {GameModel = gameModel};

        var playerThree = _getPlayerByIdHandler.Handle(game.HomeTeamIds[1]).Result;
        var playerFour = _getPlayerByIdHandler.Handle(game.AwayTeamIds[1]).Result;
        var playerThreeCommand = _mapper.Map<UpdatePlayerCommand>(playerThree);
        var playerFourCommand = _mapper.Map<UpdatePlayerCommand>(playerFour);
        playerThreeCommand.LastActivity = DateTime.SpecifyKind(DateTime.Now, DateTimeKind.Utc);
        playerFourCommand.LastActivity = DateTime.SpecifyKind(DateTime.Now, DateTimeKind.Utc);
        _updatePlayerHandler.Handle(playerThree.Id, playerThreeCommand);
        _updatePlayerHandler.Handle(playerFour.Id, playerFourCommand);

        return new SaveGameReply() {GameModel = gameModel};
    }

    public override Task<GetGamesReply> GetGames(GetGamesRequest request, ServerCallContext context)
    {
        var games = _getGamesHandler.Handle(request.Limit, request.Offset);
        var gameModel = _mapper.Map<List<GameModel>>(games);

        return Task.FromResult(new GetGamesReply() {GameModel = {gameModel}});
    }

    public override async Task<GetGamesByPlayerIdReply> GetGamesById(GetGamesByPlayerIdRequest request,
        ServerCallContext context)
    {
        var player = await _getGamesByPlayerIdHandler.Handle(request.Id);
        var gameModel = _mapper.Map<List<GameModel>>(player);

        return new GetGamesByPlayerIdReply() {GameModel = {gameModel}};
    }

    public override Task<GetWinProbabilityReply> GetWinProbability(GetWinProbabilityRequest request,
        ServerCallContext context)
    {
        var getWinProbability = _getWinProbabilityHandler.Handle(request.HomeTeamElo, request.AwayTeamElo);

        return Task.FromResult(new GetWinProbabilityReply() {WinProbability = getWinProbability});
    }
}