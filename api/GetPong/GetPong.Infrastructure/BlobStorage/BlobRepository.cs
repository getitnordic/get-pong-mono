using Azure.Storage.Blobs;
using GetPong.Core.Infrastructure.Repositories;

namespace GetPong.Infrastructure.BlobStorage;

public class BlobRepository : IBlobRepository
{
    static string blobStorageConnectionString = "DefaultEndpointsProtocol=https;AccountName=getpong;AccountKey=o9vSulBseFq12UvBk9t6SJfz/nUiVdnKQqPjS9RDAcdS4fQjjUOg3GoenQgiSUQHDEh6RQw3dTqv+ASt+wXOwA==;EndpointSuffix=core.windows.net";
    static string blobStorageContainerName = "getpong";

    BlobContainerClient container = new BlobContainerClient(blobStorageConnectionString, blobStorageContainerName);

    public async Task<string> UpdatePlayerPicture(string playerId, string base64Data)
    {
        // write base64Data to blobstorage where playerId = playerId
        var blob = container.GetBlobClient(base64Data);
        var stream = base64Data;
        await blob.UploadAsync(stream);
        
        // TODO: Add imageUrl to player collection in mongoDB aswell
        return "picture uploaded";
    }
}