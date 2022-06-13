using GetPong.Application.Handlers.Games;
using GetPong.Application.Handlers.Players;
using GetPong.Application.old.Handlers.Players;
using GetPong.Core.Handlers.Games;
using GetPong.Core.Handlers.Players;
using Microsoft.Extensions.DependencyInjection;


namespace GetPong.Application
{
    public static class Startup
    {
        public static void ConfigureServices(IServiceCollection services)
        {
            // Helpers
            services.AddScoped<IAddPlayerHandler, AddPlayerHandler>();
            services.AddScoped<IGetPlayersHandler, GetPlayersHandler>();
            services.AddScoped<IGetPlayerByIdHandler, GetPlayerByIdHandler>();
            services.AddScoped<IUpdatePlayerHandler, UpdatePlayerHandler>();
            services.AddScoped<ISyncAzureAdToDb, SyncAzureAdToDb>();

            services.AddScoped<IAddGameHandler, AddGameHandler>();
            services.AddScoped<IGetGamesHandler, GetGamesHandler>();
        }
    }
}