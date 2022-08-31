using GetPong.Core.Infrastructure.Repositories;
using GetPong.Infrastructure.BlobStorage;
using GetPong.Infrastructure.MongoDb;
using Microsoft.Extensions.DependencyInjection;

namespace GetPong.Infrastructure
{
    public static class Startup
    {
        public static void ConfigureServices(IServiceCollection services)
        {
            // Repositories
            services.AddScoped<IPlayerRepository, PlayerRepository>();
            services.AddScoped<IGameRepository, GameRepository>();
            services.AddScoped<IResultRepository, ResultRepository>();
            services.AddScoped<IBlobRepository, BlobRepository>();
        }
    }
}