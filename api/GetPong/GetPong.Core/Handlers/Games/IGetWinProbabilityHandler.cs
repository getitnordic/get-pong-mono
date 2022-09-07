using System.Reflection.Metadata;

namespace GetPong.Core.Handlers.Games;

public interface IGetWinProbabilityHandler
{
    double Handle(int homeTeamElo, int awayTeamElo);
}