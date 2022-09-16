using Grpc.Core;
using Identity;

namespace Identity.Services;

public class AuthService : Authorize.AuthorizeBase
{
    private readonly ILogger<AuthService> _logger;
    public AuthService(ILogger<AuthService> logger)
    {
        _logger = logger;
    }

    public override Task<LoginResponse> Login(LoginRequest request, ServerCallContext context)
    {
        int test = 0;
      // Stuff can go here
        return Task.FromResult(new LoginResponse
        {
            Id = "Hello Test "
        });
    }
}
