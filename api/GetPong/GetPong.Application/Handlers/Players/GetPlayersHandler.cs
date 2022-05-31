using GetPong.Core.Infrastructure.Entities.Players;

namespace GetPong.Application.Handlers.Players
{
    public class GetPlayersHandler
    {
        public Player[] Handle()
        {
            // Should get att players from database.
            Player p1 = new Player()
            {
                FirstName = "Player 1",
                LastName = "Playersson",
                Email = "player1@mail.com"
            };
            Player p2 = new Player()
            {
                FirstName = "Player 2",
                LastName = "Playersson",
                Email = "player2@mail.com"
            };

            Player[] players = new Player[] { p1, p2 };

            return players;
        }
        
    }
}