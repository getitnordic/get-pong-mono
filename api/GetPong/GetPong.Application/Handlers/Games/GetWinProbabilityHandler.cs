using GetPong.Application.Helpers;
using GetPong.Core.Handlers.Games;

namespace GetPong.Application.Handlers.Games;

public class GetWinProbabilityHandler : IGetWinProbabilityHandler
{
    public double Handle(int homeTeamElo, int awayTeamElo)
    {
        return EloHelper.ExpectationToWin(homeTeamElo, awayTeamElo);
    }
}