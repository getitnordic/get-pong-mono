using AutoMapper;
using Base;
using GetPong.Core.Handlers.Players;
using GetPong.Core.Models.Commands.Players;
using Grpc.Core;
using Player;

namespace GetPong.Services;

public class PlayerService : global::Player.PlayerService.PlayerServiceBase
{
    private readonly IAddPlayerHandler _addPlayerHandler;
    private readonly IGetPlayersHandler _getPlayersHandler;
    private readonly IGetPlayerByIdHandler _getPlayerByIdHandler;
    private readonly IUpdatePlayerHandler _updatePlayerHandler;
    private readonly ISyncAzureAdToDb _syncAzureAdToDb;
    private readonly IUpdatePlayerPictureHandler _updatePlayerPictureHandler;
    private readonly IDeletePlayerPictureHandler _deletePlayerPictureHandler;
    private readonly IMapper _mapper;

    public PlayerService(IAddPlayerHandler addPlayerHandler, IGetPlayersHandler getPlayersHandler,
        IGetPlayerByIdHandler getPlayerByIdHandler, IUpdatePlayerHandler updatePlayerHandler, IMapper mapper,
        ISyncAzureAdToDb syncAzureAdToDb, IUpdatePlayerPictureHandler updatePlayerPictureHandler,
        IDeletePlayerPictureHandler deletePlayerPictureHandler)

    {
        _addPlayerHandler = addPlayerHandler;
        _getPlayersHandler = getPlayersHandler;
        _getPlayerByIdHandler = getPlayerByIdHandler;
        _updatePlayerHandler = updatePlayerHandler;
        _syncAzureAdToDb = syncAzureAdToDb;
        _updatePlayerPictureHandler = updatePlayerPictureHandler;
        _deletePlayerPictureHandler = deletePlayerPictureHandler;
        _mapper = mapper;
    }

    public override Task<GetPlayersReply> GetPlayers(GetPlayersRequest request, ServerCallContext context)
    {
        var players = _getPlayersHandler.Handle();
        var playerModels = _mapper.Map<List<PlayerModel>>(players);

        return Task.FromResult(new GetPlayersReply() { PlayerModel = { playerModels } });
    }

    public override async Task<GetPlayerByIdReply> GetPlayerById(GetPlayerByIdRequest request,
        ServerCallContext context)
    {
        var player = await _getPlayerByIdHandler.Handle(request.PlayerId);
        var playerModel = _mapper.Map<PlayerModel>(player);

        return new GetPlayerByIdReply() { PlayerModel = playerModel };
    }

    public override Task<RegisterExternalReply> RegisterExternal(RegisterExternalRequest request,
        ServerCallContext context)
    {
        var player = _addPlayerHandler.Handle(_mapper.Map<AddPlayerCommand>(request));
        var externalUser = _mapper.Map<PlayerModel>(player);

        return Task.FromResult(new RegisterExternalReply() { PlayerModel = externalUser });
    }

    public override async Task<UpdatePlayerReply> UpdatePlayer(UpdatePlayerRequest request, ServerCallContext context)
    {
        var updatedPlayer = await _updatePlayerHandler.Handle(request.PlayerModel.Id,
            _mapper.Map<UpdatePlayerCommand>(request.PlayerModel));
        var updatedPlayerModel = _mapper.Map<PlayerModel>(updatedPlayer);

        return await Task.FromResult(new UpdatePlayerReply() { PlayerModel = updatedPlayerModel });
    }

    public override Task<SyncAzureAdToDbReply> SyncAzureAdToDb(SyncAzureAdToDbRequest request,
        ServerCallContext context)
    {
        try
        {
           _syncAzureAdToDb.Handle();
        }
        catch (Exception)
        {
            throw new RpcException(new Status(StatusCode.Internal, "Something went wrong"));
        }

        return Task.FromResult(new SyncAzureAdToDbReply() { Message = "Successfully synced AD users to database" });
    }

    public override async Task<UpdatePlayerPictureReply> UpdatePlayerPicture(UpdatePlayerPictureRequest request,
        ServerCallContext context)
    {
        var response = await _updatePlayerPictureHandler.Handle(request.PlayerId, request.Base64Data);

        return await Task.FromResult(new UpdatePlayerPictureReply() { ResponseMessage = response });
    }

    public override async Task<DeletePlayerPictureReply> DeletePlayerPicture(DeletePlayerPictureRequest request,
        ServerCallContext context)
    {
        var response = _deletePlayerPictureHandler.Handle(request.PlayerId);

        return await Task.FromResult(new DeletePlayerPictureReply() { ResponseMessage = response.Result });
    }
}