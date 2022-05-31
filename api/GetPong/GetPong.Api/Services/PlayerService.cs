using Base;
using GetPong.Application.Handlers.Players;
using GetPong.Core.Handlers.Players;
using GetPong.Core.Models.Commands.Players;
using Grpc.Core;
using Player;

namespace GetPong.Services;

public class PlayerService : global::Player.PlayerService.PlayerServiceBase
{

    private readonly IAddPlayerHandler _addPlayerHandler;

    public PlayerService(IAddPlayerHandler addPlayerHandler)
    {
        this._addPlayerHandler = addPlayerHandler;
    }

    /*
     public override Task<GetPlayersReply> GetPlayers(GetPlayersRequest request, ServerCallContext context)
    {
        // Currently hardcoded dummy players

        GetPlayersHandler getPlayersHandler = new GetPlayersHandler();
        Core.Infrastructure.Entities.Players.Player[] players = getPlayersHandler.Handle();
        PlayerModel player1 = new PlayerModel()
        {
            FirstName = players[0].FirstName,
            LastName = players[0].LastName,
            Email = players[0].Email,
        };

        PlayerModel player2 = new PlayerModel()
        {
            FirstName = players[1].FirstName,
            LastName = players[1].LastName,
            Email = players[1].Email,
        };

        PlayerModel[] playersArray =  { player1, player2 };
        
        return Task.FromResult(new GetPlayersReply() { PlayerModel = { playersArray } });
    }*/

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
            FirstName = player.FirstName,
            LastName = player.LastName,
            Email = player.Email,
            Nickname = player.Nickname,
            ImageUrl = player.ImageUrl,
            Streak = player.Streak,
            Win = player.Win,
            Loss = player.Loss,
            TotalScore = player.TotalScore,
            StreakEnum = Base.StreakEnum.None
        };

        return Task.FromResult(new RegisterExternalReply() { PlayerModel = externalUser });
        
    }
    
}