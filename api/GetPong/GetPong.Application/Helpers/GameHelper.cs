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
        var player1Id = game.HomeTeamIds[0];
        var player2Id = game.AwayTeamIds[0];
        var player3Id = game.HomeTeamIds[1];
        var player4Id = game.AwayTeamIds[1];

        var player1Win = false;
        var player2Win = false;

        var player1Score = 0;
        var player2Score = 0;
        
        foreach (var gameSet in game.Sets)
        {
            if (gameSet.HomeTeam > gameSet.AwayTeam)
            {
                player1Score++;
            }
            else
            {
                player2Score++;
            }
        }
        
        if (player1Score > player2Score)
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
        _playerRepository.UpdateScoreOfPlayer(player3Id, player1Win);
        _playerRepository.UpdateScoreOfPlayer(player2Id, player2Win);
        _playerRepository.UpdateScoreOfPlayer(player4Id, player2Win);

        // TODO: make it return true if successfully updated, else false
        return true;
    }
}