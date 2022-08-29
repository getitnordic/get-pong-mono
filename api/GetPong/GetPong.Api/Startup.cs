using GetPong.Interceptor;
using GetPong.Services;

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
        services.AddGrpc(c=>c.Interceptors.Add<ExceptionInterceptor>());
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
            endpoints.MapGrpcService<Services.ResultService>();
            

            endpoints.MapGet("/", async context =>
            {
                await context.Response.WriteAsync("Communication with gRPC endpoints must be made through a gRPC client.");
            });
        });
    }
}