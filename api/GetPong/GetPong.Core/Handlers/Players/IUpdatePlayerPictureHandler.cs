namespace GetPong.Core.Handlers.Players;

public interface IUpdatePlayerPictureHandler
{
    string Handle(string playerId, string base64Data);
}