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

    public PlayerService(IAddPlayerHandler addPlayerHandler, IGetPlayersHandler getPlayersHandler,

        IGetPlayerByIdHandler getPlayerByIdHandler, IUpdatePlayerHandler updatePlayerHandler)

    {
        _addPlayerHandler = addPlayerHandler;
        _getPlayersHandler = getPlayersHandler;
        _getPlayerByIdHandler = getPlayerByIdHandler;
        _updatePlayerHandler = updatePlayerHandler;
    }

    // Get all players
    public override Task<GetPlayersReply> GetPlayers(GetPlayersRequest request, ServerCallContext context)
    {
        List<Core.Infrastructure.Entities.Players.Player> players = _getPlayersHandler.Handle();
        List<PlayerModel> playerModels = players.Select(p => new PlayerModel()
        {
            Id = p.Id,
            FirstName = p.FirstName,
            LastName = p.LastName,
            Nickname = p.Nickname,
            ImageUrl = p.ImageUrl,
            Email = p.Email,
            Streak = p.Streak,
            Win = p.Win,
            Loss = p.Loss,
            TotalScore = p.TotalScore,
            StreakEnum = (StreakEnum)((int)p.StreakEnum)
        }).ToList();

        return Task.FromResult(new GetPlayersReply() { PlayerModel = { playerModels } });
    }

    // Get player by ID
    public override async Task<GetPlayerByIdReply> GetPlayerById(GetPlayerByIdRequest request,
        ServerCallContext context)
    {
        var player = await _getPlayerByIdHandler.Handle(request.PlayerId);
        PlayerModel playerModel = new PlayerModel();
        playerModel.Id = player.Id;
        playerModel.FirstName = player.FirstName;
        playerModel.LastName = player.LastName;
        playerModel.Nickname = player.Nickname;
        playerModel.ImageUrl = player.ImageUrl;
        playerModel.Email = player.Email;
        playerModel.Streak = player.Streak;
        playerModel.Win = player.Win;
        playerModel.Loss = player.Loss;
        playerModel.TotalScore = player.TotalScore;
        playerModel.StreakEnum = (StreakEnum)(int)player.StreakEnum;

        return new GetPlayerByIdReply() { PlayerModel = playerModel };
    }

    // Register external player
    public override Task<RegisterExternalReply> RegisterExternal(RegisterExternalRequest request,
        ServerCallContext context)
    {
        var player = _addPlayerHandler.Handle(new AddPlayerCommand()
        {
            FirstName = request.FirstName,
            LastName = request.LastName,
            Email = request.Email,
            Nickname = request.Nickname
        });


        PlayerModel externalUser = new PlayerModel()
        {
            Id = player.Id,
            FirstName = player.FirstName,
            LastName = player.LastName,
            Email = player.Email,
            Nickname = player.Nickname,
            ImageUrl = player.ImageUrl,
            Streak = player.Streak,
            Win = player.Win,
            Loss = player.Loss,
            TotalScore = player.TotalScore,
            StreakEnum = StreakEnum.None
        };

        return Task.FromResult(new RegisterExternalReply() { PlayerModel = externalUser });
    }


    //Update player
    public override Task<UpdatePlayerReply> UpdatePlayer(UpdatePlayerRequest request, ServerCallContext context)
    {
        var updatedPlayer = _updatePlayerHandler.Handle(request.PlayerModel.Id, new AddPlayerCommand()
        {
            FirstName = request.PlayerModel.FirstName,
            LastName = request.PlayerModel.LastName,
            Email = request.PlayerModel.Email,
            Nickname = request.PlayerModel.Nickname
        });
        PlayerModel updatedPlayerModel = new PlayerModel()
        {
            Id = request.PlayerModel.Id,
            FirstName = updatedPlayer.Result.FirstName,
            LastName = updatedPlayer.Result.LastName,
            Email = updatedPlayer.Result.Email,
            Nickname = updatedPlayer.Result.Nickname,
            ImageUrl = updatedPlayer.Result.ImageUrl,
            Streak = updatedPlayer.Result.Streak,
            Win = updatedPlayer.Result.Win,
            Loss = updatedPlayer.Result.Loss,
            TotalScore = updatedPlayer.Result.TotalScore,
            StreakEnum = (StreakEnum)updatedPlayer.Result.StreakEnum
        };

        return Task.FromResult(new UpdatePlayerReply() { PlayerModel = updatedPlayerModel });
    }

}