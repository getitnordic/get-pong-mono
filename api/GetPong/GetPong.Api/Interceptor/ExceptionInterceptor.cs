using Grpc.Core;

namespace GetPong.Interceptor;

public class ExceptionInterceptor : Grpc.Core.Interceptors.Interceptor
{
    private readonly ILogger<ExceptionInterceptor> _logger;


    public ExceptionInterceptor(ILogger<ExceptionInterceptor> logger)
    {
        _logger = logger;
        Console.WriteLine("logger created");
    }

    public override async Task<TResponse> UnaryServerHandler<TRequest, TResponse>(TRequest request,
        ServerCallContext context,
        UnaryServerMethod<TRequest, TResponse> continuation)
    {
        try
        {
            return await base.UnaryServerHandler(request, context, continuation);
        }

        catch (Exception e)
        {
            _logger.LogError(e, $"Error thrown by {context.Method}.");
            throw new RpcException(new Status(StatusCode.Internal, "Something went wrong"));
        }
    }
}