using GetPong.Core.Core.Helpers;

namespace GetPong.Application.Helpers;

public class EloHelper
{
    public enum GameOutcome
    {
        Win = 1,
        Loss = 0
    }

    public static double ExpectationToWin(int playerOneRating, int playerTwoRating)
    {
        return 1 / (1 + Math.Pow(10, (playerTwoRating - playerOneRating) / 400.0));
    }

    public static void CalculateElo(ref int playerOneRating, ref int playerTwoRating, GameOutcome outcome)
    {
        const int eloK = 32;

        var delta = (int) (eloK * ((int) outcome - ExpectationToWin(playerOneRating, playerTwoRating)));


        playerTwoRating -= delta;
        playerOneRating += delta;
    }
}