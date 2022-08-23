﻿using GetPong.Core.Infrastructure.Entities.Games;
using GetPong.Core.Infrastructure.Entities.Results;

namespace GetPong.Core.Infrastructure.Repositories;

public interface IResultRepository
{
    Task<Result> GetResultByGameId(string gameId);
    Task<Result> SaveResult(Game game);

}