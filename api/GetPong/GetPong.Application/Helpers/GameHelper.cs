using AutoMapper;
using GetPong.Core.Core.Helpers;
using GetPong.Core.Infrastructure.Entities.Games;
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

    public void SaveSingleMatchScoreToDb(Game game)
    {
        var player1Score = 0;
        var player2Score = 0;

        foreach (var gameSet in game.Sets)
        {
            if (gameSet.HomeTeam > gameSet.AwayTeam) player1Score++;
            else player2Score++;
        }

        var team1Win = player1Score > player2Score;
        var team2Win = player2Score > player1Score;

        _playerRepository.UpdateScoreOfPlayer(game.HomeTeamIds[0], team1Win);
        _playerRepository.UpdateScoreOfPlayer(game.AwayTeamIds[0], team2Win);
    }

    public void SaveDoubleMatchScoreToDb(Game game)
    {
        var team1SetsWon = 0;
        var team2SetsWon = 0;

        foreach (var gameSet in game.Sets)
        {
            if (gameSet.HomeTeam > gameSet.AwayTeam) team1SetsWon++;
            else team2SetsWon++;
        }

        var team1Win = team1SetsWon > team2SetsWon;
        var team2Win = team2SetsWon > team1SetsWon;
        
        _playerRepository.UpdateScoreOfPlayer(game.HomeTeamIds[0], team1Win);
        _playerRepository.UpdateScoreOfPlayer(game.HomeTeamIds[1], team1Win);
        _playerRepository.UpdateScoreOfPlayer(game.AwayTeamIds[0], team2Win);
        _playerRepository.UpdateScoreOfPlayer(game.AwayTeamIds[1], team2Win);
    }
}