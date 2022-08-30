using GetPong.Core.Infrastructure.Entities.Games;

namespace GetPong.Core.Core.Helpers;

public interface IGameHelper
{
    void SaveSingleMatchScoreToDb(Game game);
    void SaveDoubleMatchScoreToDb(Game game);
}