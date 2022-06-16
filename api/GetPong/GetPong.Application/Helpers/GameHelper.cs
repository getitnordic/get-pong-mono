using AutoMapper;
using GetPong.Core.Core.Helpers;
using GetPong.Core.Infrastructure.Entities.Games;
using GetPong.Core.Infrastructure.Entities.Players;
using GetPong.Core.Infrastructure.Repositories;

namespace GetPong.Application.Helpers;

public class GameHelper : IGameHelper
{

    private readonly IPlayerRepository _playerRepository;
    private readonly IMapper _mapper;
    
    // Takes in a game from AddGameHandler, crunches numbers, adds win/loss to player DB and calculates totalScore
    public GameHelper(IPlayerRepository playerRepository, IMapper mapper)
    {
        _playerRepository = playerRepository;
        _mapper = mapper;
    }

    public bool SaveSingleMatchScoreToDb(Game game)
    {
        // Stupid solution but might kinda work?
        string player1Id = game.HomeTeamIds[0];
        string player2Id = game.AwayTeamIds[0];

        var player1FromDb =_playerRepository.GetPlayerById(player1Id);
        var player2FromDb =_playerRepository.GetPlayerById(player2Id);

        bool player1Win = false;
        bool player2Win = false;

        if (game.Sets[0].HomeTeam > game.Sets[0].AwayTeam)
        {
            player1Win = true;
            player2Win = false;
        }
        else
        {
            player1Win = false;
            player2Win = true;
        }
        
        _playerRepository.UpdateScoreOfPlayer(player1Id, player1Win);
        _playerRepository.UpdateScoreOfPlayer(player2Id, player2Win);

        // TODO: make it return true if successfully updated, else false
        return true;
    }
}