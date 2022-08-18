using GetPong.Core.Clients;
using GetPong.Core.Handlers.Players;
using GetPong.Core.Infrastructure.Entities.Players;
using GetPong.Core.Infrastructure.Repositories;
using GetPong.Core.Models.Enum;
using Microsoft.Graph;

namespace GetPong.Application.Handlers.Players;

public class SyncAzureAdToDb : ISyncAzureAdToDb
{
    private readonly IPlayerRepository _playerRepository;
    private readonly IAzureClient _azureClient;


    public SyncAzureAdToDb(IPlayerRepository playerRepository, IAzureClient azureClient)
    {
        _playerRepository = playerRepository;
        _azureClient = azureClient;
    }

    public List<Player> Handle()
    {
        var users = _azureClient.getAzureClient();

        var listOfUsers = (from user in users
            where !user.DisplayName.Contains("admin", StringComparison.CurrentCultureIgnoreCase) &&
                  !user.DisplayName.Contains("getit", StringComparison.CurrentCultureIgnoreCase) &&
                  !user.DisplayName.Contains("test", StringComparison.CurrentCultureIgnoreCase) &&
                  !user.DisplayName.Contains("db24", StringComparison.CurrentCultureIgnoreCase) &&
                  !user.DisplayName.Contains("faktura", StringComparison.CurrentCultureIgnoreCase) &&
                  !user.DisplayName.Contains("d b", StringComparison.CurrentCultureIgnoreCase) &&
                  !user.DisplayName.Contains("system", StringComparison.CurrentCultureIgnoreCase) &&
                  !user.DisplayName.Contains("account", StringComparison.CurrentCultureIgnoreCase) &&
                  !user.DisplayName.Contains("you.sr", StringComparison.CurrentCultureIgnoreCase) &&
                  !user.DisplayName.Contains("workbuddy", StringComparison.CurrentCultureIgnoreCase) &&
                  !user.DisplayName.Contains('(', StringComparison.CurrentCultureIgnoreCase) &&
                  !user.DisplayName.Contains("scanner", StringComparison.CurrentCultureIgnoreCase)
            select new Player()
            {
                FullName = user.DisplayName,
                Email = "mailen",
                AzureAdId = user.Id,
                Nickname = "nickname",
                ImageUrl = "",
                Streak = 0,
                Win = 0,
                Loss = 0,
                TotalScore = 1000,
                StreakEnum = StreakEnum.None,
                LastActivity = DateTime.SpecifyKind(new DateTime(2000, 1, 1), DateTimeKind.Utc)
            }).DistinctBy(i => i.FullName).ToList();

        

        var playersInMongoDb = _playerRepository.GetPlayers();
        var isAdUserAlreadyInDb = false;

        foreach (var player in listOfUsers)
        {
            foreach (var playerInMongoDb in playersInMongoDb.Where(playerInMongoDb => playerInMongoDb.AzureAdId.Equals(player.AzureAdId)))
            {
                isAdUserAlreadyInDb = true;
            }

            if (!isAdUserAlreadyInDb)
            {
                _playerRepository.RegisterPlayer(player);
                // TODO: Exchange Console.Writeline with real logging in the future
                Console.WriteLine(player.FullName + " added to mongo player collection");
            }
            else
            {
                // TODO: logging here fore users already exists in DB);
            }

            isAdUserAlreadyInDb = false;
        }

        return listOfUsers;
    }
}