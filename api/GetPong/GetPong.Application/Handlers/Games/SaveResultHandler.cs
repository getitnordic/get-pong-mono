using GetPong.Core.Handlers.Games;
using GetPong.Core.Infrastructure.Entities.Games;
using GetPong.Core.Infrastructure.Entities.Results;
using GetPong.Core.Infrastructure.Repositories;

namespace GetPong.Application.Handlers.Games;

public class SaveResultHandler : ISaveResultHandler
{
    private readonly IResultRepository _resultRepository;

    public SaveResultHandler(IResultRepository repository)
    {
        _resultRepository = repository;
    }

    public void Handle(Game game)
    {
        _resultRepository.SaveResult(game);
    }
}