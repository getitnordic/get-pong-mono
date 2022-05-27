using Base;
using Grpc.Core;
using Player;

namespace GetPong.Services;

public class PlayerService : Player.PlayerService.PlayerServiceBase
{
    public override Task<GetPlayersReply> GetPlayers(GetPlayersRequest request, ServerCallContext context)
    {
        // Test player
        var userTest = new PlayerModel();
        userTest.FirstName = "Dummy";
        userTest.Email = "test@email.com";
        return Task.FromResult(new GetPlayersReply() { PlayerModel = { userTest } });
        // return base.GetPlayers(request, context);
    }

    public override Task<RegisterExternalReply> RegisterExternal(RegisterExternalRequest request, ServerCallContext context)
    {
        var externalUser = new PlayerModel()
        {
            FirstName = request.PlayerModel.FirstName,
            LastName = request.PlayerModel.LastName,
            Nickname = request.PlayerModel.Nickname,
            ImageUrl = request.PlayerModel.ImageUrl,
            Email = request.PlayerModel.Email
        };
        /*
        var externalUser = new PlayerModel();
        externalUser.FirstName = request.PlayerModel.FirstName;
        externalUser.LastName = request.PlayerModel.LastName;
        externalUser.Nickname = request.PlayerModel.Nickname;
        externalUser.ImageUrl = request.PlayerModel.ImageUrl;
        externalUser.Email = request.PlayerModel.Email;
        */
        return Task.FromResult(new RegisterExternalReply() { PlayerModel =  externalUser });
    }
}