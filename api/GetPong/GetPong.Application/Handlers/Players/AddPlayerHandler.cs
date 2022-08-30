using GetPong.Core.Handlers.Players;
using GetPong.Core.Infrastructure.Entities.Players;
using GetPong.Core.Infrastructure.Repositories;
using GetPong.Core.Models.Commands.Players;
using GetPong.Core.Models.Enum;

namespace GetPong.Application.Handlers.Players;

public class AddPlayerHandler : IAddPlayerHandler
{
    private readonly IPlayerRepository _playerRepository;

    public AddPlayerHandler(IPlayerRepository playerRepository)
    {
        _playerRepository = playerRepository;
    }

    public Player Handle(AddPlayerCommand addPlayerCommand)
    {
        var player = new Player
        {
            FullName = addPlayerCommand.FullName,
            Nickname = addPlayerCommand.Nickname,
            Email = addPlayerCommand.Email,
            ImageUrl = "",
            Streak = 0,
            Win = 0,
            Loss = 0,
            TotalScore = 1000,
            AzureAdId = "externalPlayer",
            StreakEnum = StreakEnum.None,
            LastActivity = DateTime.SpecifyKind(new DateTime(2000, 1, 1), DateTimeKind.Utc)
        };
        ValidatePlayerCommand(addPlayerCommand);

        _playerRepository.RegisterPlayer(player);

        return player;
    }

    private static void ValidatePlayerCommand(AddPlayerCommand playerCommand)
    {
        if (string.IsNullOrEmpty(playerCommand.FullName))
        {
            throw new Exception("full name is mandatory");
        }
    }
}