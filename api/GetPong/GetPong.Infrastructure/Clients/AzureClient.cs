using Azure.Identity;
using GetPong.Core.Clients;
using Microsoft.Graph;

namespace GetPong.Infrastructure.Clients;

public class AzureClient : IAzureClient
{
    public IGraphServiceUsersCollectionPage getAzureClient()
    {
        //TODO fetch data from appsettings
        var clientId = "df75520c-c168-4c9e-a9b9-ccb7045fd434";
        var tenantId = "8990c32d-7eb3-4e7e-8a29-0e4ec8618f48";
        var clientSecret = "3YW8Q~9Ul-wJdRXuI6cKTVEqQNBO7X_YX1Xtodgv";
        var clientSecretCredential = new ClientSecretCredential(tenantId, clientId, clientSecret);
        var graphServiceClient = new GraphServiceClient(clientSecretCredential);

        IGraphServiceUsersCollectionPage? users = graphServiceClient.Users.Request()
            .Select(x => new { x.DisplayName, x.Mail, x.GivenName, x.Id }).GetAsync().Result;

        return users;
    }
}