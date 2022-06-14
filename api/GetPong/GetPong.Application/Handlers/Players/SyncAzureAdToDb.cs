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

        List<Player> listOfPlayers = new List<Player>();
        foreach (var user in users)
        {
            listOfPlayers.Add(new Player()
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

        foreach (var player in listOfPlayers)
        {
            // TODO: Add check if AD user is already in mongoDB
            // If present -> DON'T add to DB
            // Else Add to DB
            _playerRepository.RegisterPlayer(player);
        }
        
        return listOfPlayers;
    }
}