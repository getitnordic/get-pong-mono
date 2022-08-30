using Azure.Identity;
using GetPong.Core.Clients;
using Microsoft.Extensions.Configuration;
using Microsoft.Graph;

namespace GetPong.Infrastructure.Clients;

public class AzureClient : IAzureClient
{

    private readonly IConfiguration _configuration;

    public AzureClient(IConfiguration configuration)
    {
        _configuration = configuration;
    }

    public IGraphServiceUsersCollectionPage GetAzureClient()
    {
        var clientId = _configuration["AzureAD:ClientId"];
        var tenantId = _configuration["AzureAD:TenantId"];
        var clientSecret = _configuration["AzureAD:ClientSecret"];
        var clientSecretCredential = new ClientSecretCredential(tenantId, clientId, clientSecret);
        var graphServiceClient = new GraphServiceClient(clientSecretCredential);

        var users = graphServiceClient.Users.Request().Top(999)
            .Select(x => new { x.DisplayName, x.Mail, x.GivenName, x.Id, x.AssignedLicenses, x.AssignedPlans}).GetAsync().Result;

        return users;
    }
}