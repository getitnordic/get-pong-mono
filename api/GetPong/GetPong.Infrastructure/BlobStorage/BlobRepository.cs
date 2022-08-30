using Azure.Storage.Blobs;
using GetPong.Core.Infrastructure.Repositories;
using Microsoft.Extensions.Configuration;

namespace GetPong.Infrastructure.BlobStorage;

public class BlobRepository : IBlobRepository
{
    private readonly IConfiguration _configuration;
    private const string blobStorageContainerName = "getpong";
    private BlobContainerClient _container;

    public BlobRepository(IConfiguration configuration)
    {
        _configuration = configuration;
        var blobStorageConnectionString = _configuration["BlobStorage:ConnectionString"];
        _container = new(blobStorageConnectionString, blobStorageContainerName);
    }

    public async Task<string> UpdatePlayerPicture(string playerId, string base64Data)
    {
        try
        {
            _container.GetBlobClient(blobStorageContainerName);
            var data = Convert.FromBase64String(base64Data);
            Stream stream = new MemoryStream(data);
            await _container.UploadBlobAsync("pp_id_" + playerId + ".jpg", stream);
        }
        catch (Exception e)
        {
            Console.WriteLine(e);
            throw;
        }

        // TODO: Add imageUrl to player collection in mongoDB aswell
        return "picture uploaded";
    }

    public async Task<string> DeletePlayerPicture(string playerId)
    {
        _container.GetBlobClient(blobStorageContainerName);

        await _container.DeleteBlobAsync("pp_id_" + playerId + ".jpg");

        return "picture deleted";
    }
}