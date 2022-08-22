using AutoMapper;
using Base;
using Game;
using GetPong.Core.Infrastructure.Entities.Games;
using GetPong.Core.Models.Commands.Players;
using Google.Protobuf.WellKnownTypes;
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
        CreateMap(typeof(PlayerModel), typeof(UpdatePlayerCommand)).ReverseMap();
        CreateMap(typeof(Core.Infrastructure.Entities.Players.Player), typeof(UpdatePlayerCommand)).ReverseMap();
        CreateMap<DateTime, Timestamp>().ConvertUsing<TimestampConverter>();
        CreateMap<Timestamp, DateTime>().ConvertUsing<DateTimeConverter>();
    }
}

//TODO Put these where?
public class TimestampConverter : ITypeConverter<DateTime, Timestamp>
{
    public Timestamp Convert(DateTime source, Timestamp destination, ResolutionContext context)
    {
        return Timestamp.FromDateTime(source);
    }
}
public class DateTimeConverter : ITypeConverter<Timestamp, DateTime>
{
    public DateTime Convert(Timestamp source, DateTime destination, ResolutionContext context)
    {
        return source.ToDateTime();
    }
}