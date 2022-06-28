using GetPong.Core.Infrastructure.Entities.Games;

namespace GetPong.Core.Core.Helpers;

public interface IGameHelper
{
    bool SaveSingleMatchScoreToDb(Game game);
    bool SaveDoubleMatchScoreToDb(Game game);
}