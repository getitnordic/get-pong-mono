using AutoMapper;
using Base;

namespace GetPong.Api.MapperProfiles;

public class GetPongProfile : Profile
{
    public GetPongProfile()
    {
        CreateMap(typeof(PlayerModel), typeof(Core.Infrastructure.Entities.Players.Player)).ReverseMap();
    }
}