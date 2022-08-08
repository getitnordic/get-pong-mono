using GetPong.Services;
using NLog;
using ILogger = NLog.ILogger;

namespace GetPong.Api;

public class Startup
{
    private IConfiguration Configuration { get; }
    private IWebHostEnvironment Environment { get; }

    public Startup(IConfiguration configuration, IWebHostEnvironment environment)
    {
        Configuration = configuration;
        Environment = environment;
    }

    public static void ConfigureServices(IServiceCollection services)
    {
        services.AddGrpc();
        services.AddAutoMapper(typeof(Startup));
        
        
        Infrastructure.Startup.ConfigureServices(services); 
        Application.Startup.ConfigureServices(services);
    }

    public void Configure(IApplicationBuilder app)
    {
        if (Environment.IsDevelopment())
        {
            app.UseDeveloperExceptionPage();
        }

        app.UseRouting();

        //app.UseAuthentication();

        //app.UseAuthorization();

        app.UseEndpoints(endpoints =>
        {
            endpoints.MapGrpcService<PlayerService>();
            endpoints.MapGrpcService<GameService>();
            
            endpoints.MapGet("/", async context =>
            {
                await context.Response.WriteAsync("Communication with gRPC endpoints must be made through a gRPC client.");
            });
        });
    }
}