using Azure.Identity;
using GetPong.Core.Handlers.Players;
using GetPong.Core.Infrastructure.Entities.Players;
using GetPong.Core.Infrastructure.Repositories;
using Microsoft.Graph;

namespace GetPong.Application.Handlers.Players;

public class SyncAzureAdToDb : ISyncAzureAdToDb
{
    private readonly IPlayerRepository _playerRepository;


    public SyncAzureAdToDb(IPlayerRepository playerRepository)
    {
        _playerRepository = playerRepository;
    }

    public List<Player> Handle()
    {
        var clientId = "df75520c-c168-4c9e-a9b9-ccb7045fd434";
        var tenantId = "8990c32d-7eb3-4e7e-8a29-0e4ec8618f48";
        var clientSecret = "3YW8Q~9Ul-wJdRXuI6cKTVEqQNBO7X_YX1Xtodgv";
        var clientSecretCredential = new ClientSecretCredential(tenantId, clientId, clientSecret);
        var graphServiceClient = new GraphServiceClient(clientSecretCredential);

        var users = graphServiceClient.Users.Request()
            .Select(x => new {x.DisplayName, x.Mail, x.GivenName, x.Id}).GetAsync().Result;

        Console.WriteLine(users);
        return null;
    }
}