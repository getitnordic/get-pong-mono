using Azure.Identity;
using GetPong.Core.Clients;
using GetPong.Core.Handlers.Players;
using GetPong.Core.Infrastructure.Entities.Players;
using GetPong.Core.Infrastructure.Repositories;
using GetPong.Core.Models.Enum;
using GetPong.Infrastructure.Clients;
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

        List<Player> listOfUsers = new List<Player>();
        foreach (var user in users)
        {
            listOfUsers.Add(new Player()
            {
                FirstName = user.DisplayName,
                Email = "mailen",
                AzureAdId = user.Id,
                LastName = "lastname",
                Nickname = "nickname",
                ImageUrl = "",
                Streak = 0,
                Win = 0,
                Loss = 0,
                TotalScore = 1000,
                StreakEnum = StreakEnum.None
                
            });
        }

        var PlayersInMongoDb = _playerRepository.GetPlayers();
        bool isAdUserAlreadyInDb = false;

        foreach (var player in listOfUsers)
        {
            foreach (var playerInMongoDb in PlayersInMongoDb)
            {
                if (playerInMongoDb.AzureAdId.Equals(player.AzureAdId))
                {
                    isAdUserAlreadyInDb = true;
                }
            }

            if (!isAdUserAlreadyInDb)
            {
                _playerRepository.RegisterPlayer(player);
                // TODO: Exchange Console.Writeline with real logging in the future
                Console.WriteLine(player.FirstName + " added to mongo player collection");
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