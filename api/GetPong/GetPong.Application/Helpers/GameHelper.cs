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

        EloHelper.GameOutcome winnerVariable;
        winnerVariable = team1Win ? EloHelper.GameOutcome.Win : EloHelper.GameOutcome.Loss;

        var playerOne = _playerRepository.GetPlayerById(game.HomeTeamIds[0]);
        var playerTwo = _playerRepository.GetPlayerById(game.AwayTeamIds[0]);
        var calculatedElo =
            EloHelper.CalculateElo(playerOne.Result.TotalScore, playerTwo.Result.TotalScore, winnerVariable);

        _playerRepository.UpdateScoreOfPlayer(game.HomeTeamIds[0], team1Win, calculatedElo[0]);
        _playerRepository.UpdateScoreOfPlayer(game.AwayTeamIds[0], team2Win, calculatedElo[1]);
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

        EloHelper.GameOutcome winnerVariable;
        winnerVariable = team1Win ? EloHelper.GameOutcome.Win : EloHelper.GameOutcome.Loss;

        var playerOne = _playerRepository.GetPlayerById(game.HomeTeamIds[0]);
        var playerTwo = _playerRepository.GetPlayerById(game.AwayTeamIds[0]);
        var playerThree = _playerRepository.GetPlayerById(game.HomeTeamIds[1]);
        var playerFour = _playerRepository.GetPlayerById(game.AwayTeamIds[1]);

        var t1 = (playerOne.Result.TotalScore + playerThree.Result.TotalScore) / 2;
        var t2 = (playerTwo.Result.TotalScore + playerFour.Result.TotalScore) / 2;
        var calculatedElo = EloHelper.CalculateElo(t1, t2, winnerVariable);

        var diff = Math.Abs(calculatedElo[0] - t1) / 2;

        if (team1Win)
        {
            _playerRepository.UpdateScoreOfPlayer(game.HomeTeamIds[0], team1Win, playerOne.Result.TotalScore + diff);
            _playerRepository.UpdateScoreOfPlayer(game.HomeTeamIds[1], team1Win, playerThree.Result.TotalScore + diff);
            _playerRepository.UpdateScoreOfPlayer(game.AwayTeamIds[0], team2Win, playerTwo.Result.TotalScore - diff);
            _playerRepository.UpdateScoreOfPlayer(game.AwayTeamIds[1], team2Win, playerFour.Result.TotalScore - diff);
        }
        else
        {
            _playerRepository.UpdateScoreOfPlayer(game.HomeTeamIds[0], team1Win, playerOne.Result.TotalScore - diff);
            _playerRepository.UpdateScoreOfPlayer(game.HomeTeamIds[1], team1Win, playerThree.Result.TotalScore - diff);
            _playerRepository.UpdateScoreOfPlayer(game.AwayTeamIds[0], team2Win, playerTwo.Result.TotalScore + diff);
            _playerRepository.UpdateScoreOfPlayer(game.AwayTeamIds[1], team2Win, playerFour.Result.TotalScore + diff);
        }
    }
}