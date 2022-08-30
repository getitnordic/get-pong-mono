namespace GetPong.Core.Handlers.Players;

public interface IDeletePlayerPictureHandler
{
    Task<string> Handle(string playerId);
}