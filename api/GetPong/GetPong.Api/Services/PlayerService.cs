using AutoMapper;
using Base;
using GetPong.Core.Handlers.Players;
using GetPong.Core.Models.Commands.Players;
using Grpc.Core;
using NLog;
using NLog.Fluent;
using Player;
using ILogger = NLog.ILogger;

namespace GetPong.Services;

public class PlayerService : global::Player.PlayerService.PlayerServiceBase
{
    
    private readonly IAddPlayerHandler _addPlayerHandler;
    private readonly IGetPlayersHandler _getPlayersHandler;
    private readonly IGetPlayerByIdHandler _getPlayerByIdHandler;
    private readonly IUpdatePlayerHandler _updatePlayerHandler;
    private readonly ISyncAzureAdToDb _syncAzureAdToDb;
    private readonly IMapper _mapper;
    
    public PlayerService(IAddPlayerHandler addPlayerHandler, IGetPlayersHandler getPlayersHandler,
        IGetPlayerByIdHandler getPlayerByIdHandler, IUpdatePlayerHandler updatePlayerHandler, IMapper mapper, ISyncAzureAdToDb syncAzureAdToDb)

    {
        _addPlayerHandler = addPlayerHandler;
        _getPlayersHandler = getPlayersHandler;
        _getPlayerByIdHandler = getPlayerByIdHandler;
        _updatePlayerHandler = updatePlayerHandler;
        _mapper = mapper;
        _syncAzureAdToDb = syncAzureAdToDb;
    }

    // Get all players
    public override Task<GetPlayersReply> GetPlayers(GetPlayersRequest request, ServerCallContext context)
    {
        List<Core.Infrastructure.Entities.Players.Player> players = _getPlayersHandler.Handle();
        var playerModels = _mapper.Map<List<PlayerModel>>(players);
        return Task.FromResult(new GetPlayersReply() {PlayerModel = {playerModels}});
    }

    // Get player by ID
    public override async Task<GetPlayerByIdReply> GetPlayerById(GetPlayerByIdRequest request,
        ServerCallContext context)
    {
        var player = await _getPlayerByIdHandler.Handle(request.PlayerId);
        var playerModel = _mapper.Map<PlayerModel>(player);
        return new GetPlayerByIdReply() {PlayerModel = playerModel};
    }

    // Register external player
    public override Task<RegisterExternalReply> RegisterExternal(RegisterExternalRequest request,
        ServerCallContext context)
    {
        var player =
            _addPlayerHandler.Handle(
                _mapper.Map<AddPlayerCommand>(request));
        
        var externalUser = _mapper.Map<PlayerModel>(player);
        return Task.FromResult(new RegisterExternalReply() {PlayerModel = externalUser});
    }


    //Update player
    public override async Task<UpdatePlayerReply> UpdatePlayer(UpdatePlayerRequest request, ServerCallContext context)
    {
        var updatedPlayer =
            await _updatePlayerHandler.Handle(request.PlayerModel.Id,
                _mapper.Map<UpdatePlayerCommand>(request.PlayerModel));

        var updatedPlayerModel = _mapper.Map<PlayerModel>(updatedPlayer);
        return await Task.FromResult(new UpdatePlayerReply() {PlayerModel = updatedPlayerModel});
    }

    //Sync ad to db
    public override Task<SyncAzureAdToDbReply> SyncAzureAdToDb(SyncAzureAdToDbRequest request,
        ServerCallContext context)
    {

        var test = _syncAzureAdToDb.Handle();
        return Task.FromResult(new SyncAzureAdToDbReply() {Message = "return a message of success/failure"});
    }
}