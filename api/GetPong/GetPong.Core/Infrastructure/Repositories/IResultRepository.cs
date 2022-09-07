using GetPong.Core.Infrastructure.Entities.Games;
using GetPong.Core.Infrastructure.Entities.Results;

namespace GetPong.Core.Infrastructure.Repositories;

public interface IResultRepository
{
    Task<List<Result>> GetResultByGameId(string gameId);
    Task SaveResult(Game game);
    List<Result> GetResultsByPlayerId(string playerId, int limit, int offset);
    List<Result> GetResults(int limit);
}