using TeamPortal.Services;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddSingleton<AssetService>();

var app = builder.Build();

app.MapGet("/api/assets/count", async (IConfiguration configuration, AssetService assetService) =>
{
    var connectionString = configuration["STORAGE_CONNECTION_STRING"];
    if (string.IsNullOrWhiteSpace(connectionString))
    {
        return Results.Problem(
            statusCode: StatusCodes.Status503ServiceUnavailable,
            title: "Asset storage is not configured.");
    }

    var containerName = configuration["ASSETS_CONTAINER"] ?? "assets";

    try
    {
        var count = await assetService.CountAsync(connectionString, containerName);
        return Results.Ok(new { count });
    }
    catch (Exception exception)
    {
        return Results.Problem(
            detail: exception.Message,
            statusCode: StatusCodes.Status500InternalServerError,
            title: "Unable to count assets.");
    }
});

app.MapGet("/health", () => Results.Ok(new { status = "Healthy" }));

app.Run();

public partial class Program;