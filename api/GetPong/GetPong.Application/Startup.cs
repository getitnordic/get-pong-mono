using GetPong.Application.Handlers.Players;
using GetPong.Core.Handlers.Players;
using Microsoft.Extensions.DependencyInjection;


namespace GetPong.Application
{
    public class Startup
    {
        public static void ConfigureServices(IServiceCollection services)
        {
            // Helpers
            services.AddScoped<IAddPlayerHandler, AddPlayerHandler>();
            
        }
    }
}