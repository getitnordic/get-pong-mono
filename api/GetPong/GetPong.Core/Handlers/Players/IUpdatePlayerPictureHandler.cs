namespace GetPong.Core.Handlers.Players;

public interface IUpdatePlayerPictureHandler
{
    Task<string> Handle(string playerId, string base64Data);
}