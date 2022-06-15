using Azure.Identity;
using GetPong.Core.Clients;
using Microsoft.Graph;
using Microsoft.Extensions.Configuration;

namespace GetPong.Infrastructure.Clients;

public class AzureClient : IAzureClient
{

    private readonly IConfiguration _configuration;

    public AzureClient(IConfiguration configuration)
    {
        _configuration = configuration;
    }

    public IGraphServiceUsersCollectionPage getAzureClient()
    {
        var clientId = _configuration["AzureAD:ClientId"];
        var tenantId = _configuration["AzureAD:TenantId"];
        var clientSecret = _configuration["AzureAD:ClientSecret"];
        var clientSecretCredential = new ClientSecretCredential(tenantId, clientId, clientSecret);
        var graphServiceClient = new GraphServiceClient(clientSecretCredential);

        IGraphServiceUsersCollectionPage? users = graphServiceClient.Users.Request()
            .Select(x => new { x.DisplayName, x.Mail, x.GivenName, x.Id }).GetAsync().Result;

        return users;
    }
}