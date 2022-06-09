using AutoMapper;
using Base;
using Game;
using GetPong.Core.Infrastructure.Entities.Games;
using GetPong.Core.Models.Commands.Players;
using Player;

namespace GetPong.MapperProfiles;

public class GetPongProfile : Profile
{
    public GetPongProfile()
    {
        CreateMap(typeof(PlayerModel), typeof(Core.Infrastructure.Entities.Players.Player)).ReverseMap();
        CreateMap(typeof(PlayerModel), typeof(Task<Core.Infrastructure.Entities.Players.Player>)).ReverseMap();
        CreateMap(typeof(AddPlayerCommand), typeof(Core.Infrastructure.Entities.Players.Player)).ReverseMap();
        CreateMap(typeof(RegisterExternalRequest), typeof(AddPlayerCommand)).ReverseMap();
        CreateMap(typeof(PlayerModel), typeof(AddPlayerCommand)).ReverseMap();
        
        CreateMap(typeof(GameModel), typeof(Core.Infrastructure.Entities.Games.Game)).ReverseMap();
        CreateMap(typeof(SetModel), typeof(GameSet)).ReverseMap();
    }
}