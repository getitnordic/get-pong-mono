namespace GetPong.Core.Models.Commands.Players;

public class UpdatePlayerCommand
{
    public string FullName { set; get; }
    public string Nickname { set; get; }
    public string Email { set; get; }
    public string ImageUrl { set; get; }
    public DateTime LastActivity { set; get; }
}