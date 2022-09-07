using GetPong.Core.Infrastructure.Entities.Games;

namespace GetPong.Core.Core.Helpers;

public interface IGameHelper
{
    Task SaveSingleMatchScoreToDb(Game game);
    Task SaveDoubleMatchScoreToDb(Game game);
}