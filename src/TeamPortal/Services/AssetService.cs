using Azure.Storage.Blobs;

namespace TeamPortal.Services;

public sealed class AssetService
{
    public async Task<int> CountAsync(string connectionString, string containerName)
    {
        var containerClient = new BlobContainerClient(connectionString, containerName);
        var count = 0;

        await foreach (var blob in containerClient.GetBlobsAsync())
        {
            count++;
        }

        return count;
    }
}