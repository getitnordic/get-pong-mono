using GetPong.Api;
using Microsoft.AspNetCore.Server.Kestrel.Core;

namespace GetPong
{
    public static class Program
    {
        public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
        }
        private static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                });
        
        // //For running on macOS
        // private static IHostBuilder CreateHostBuilder(string[] args) =>
        //     Host.CreateDefaultBuilder(args)
        //         .ConfigureWebHostDefaults(webBuilder =>
        //         {
        //             webBuilder.ConfigureKestrel(options =>
        //             {
        //                 options.ListenLocalhost(5000, o => o.Protocols = HttpProtocols.Http2);
        //             });
        //             webBuilder.UseStartup<Startup>();
        //         });
    }
}