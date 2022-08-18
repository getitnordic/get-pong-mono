using Microsoft.Graph;

namespace GetPong.Core.Clients;

public interface IAzureClient
{
    IGraphServiceUsersCollectionPage getAzureClient();
}