using GetPong.Core.Infrastructure.Repositories;
using GetPong.Infrastructure.MongoDb;
using Microsoft.Extensions.DependencyInjection;
using NLog;

namespace GetPong.Infrastructure
{
    public class Startup
    {
        public static void ConfigureServices(IServiceCollection services)
        {
            
            // Repositories
            services.AddScoped<IPlayerRepository, PlayerRepository>();
            services.AddScoped<IGameRepository, GameRepository>();
          
        }
    }
}