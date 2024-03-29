﻿using GetPong.Core.Handlers.Results;
using GetPong.Core.Infrastructure.Entities.Results;
using GetPong.Core.Infrastructure.Repositories;

namespace GetPong.Application.Handlers.Results;

public class GetResultsByPlayerIdHandler : IGetResultsByPlayerIdHandler
{
    private readonly IResultRepository _resultRepository;

    public GetResultsByPlayerIdHandler(IResultRepository resultRepository)
    {
        _resultRepository = resultRepository;
    }

    public List<Result> Handle(string playerId, int limit, int offset)
    {
        return _resultRepository.GetResultsByPlayerId(playerId, limit, offset);
    }
}