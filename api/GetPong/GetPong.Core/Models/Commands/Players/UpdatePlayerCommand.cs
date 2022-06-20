namespace GetPong.Core.Models.Commands.Players;

public class UpdatePlayerCommand
{
    public string FirstName { set; get; }
    public string LastName { set; get; }
    public string Nickname { set; get; }
    public string Email { set; get; }
    public DateTime LastActivity { set; get; }
}