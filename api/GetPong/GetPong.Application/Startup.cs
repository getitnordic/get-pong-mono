using GetPong.Application.Handlers.Games;
using GetPong.Application.Handlers.Players;
using GetPong.Application.Helpers;
using GetPong.Application.old.Handlers.Players;
using GetPong.Core.Clients;
using GetPong.Core.Core.Helpers;
using GetPong.Core.Handlers.Games;
using GetPong.Core.Handlers.Players;
using GetPong.Infrastructure.Clients;
using Microsoft.Extensions.DependencyInjection;


namespace GetPong.Application
{
    public static class Startup
    {
        public static void ConfigureServices(IServiceCollection services)
        {
            // Handlers
            services.AddScoped<IAddPlayerHandler, AddPlayerHandler>();
            services.AddScoped<IGetPlayersHandler, GetPlayersHandler>();
            services.AddScoped<IGetPlayerByIdHandler, GetPlayerByIdHandler>();
            services.AddScoped<IUpdatePlayerHandler, UpdatePlayerHandler>();
            services.AddScoped<ISyncAzureAdToDb, SyncAzureAdToDb>();

            services.AddScoped<IAddGameHandler, AddGameHandler>();
            services.AddScoped<IGetGamesHandler, GetGamesHandler>();

            // Helpers
            services.AddScoped<IHelper, Helper>();
            services.AddScoped<IGameHelper, GameHelper>();

            //Clients
            services.AddScoped<IAzureClient, AzureClient>();
        }
    }
}