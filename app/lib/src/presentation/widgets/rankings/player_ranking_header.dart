import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../constants/color_constants.dart';

class PlayerRankingHeader extends StatelessWidget {
  final VoidCallback onPressedPlayer;
  final VoidCallback onPressedWins;
  final VoidCallback onPressedLosses;
  final VoidCallback onPressedPlayed;
  final VoidCallback onPressedScore;

  const PlayerRankingHeader({
    Key? key,
    required this.onPressedPlayer,
    required this.onPressedWins,
    required this.onPressedLosses,
    required this.onPressedPlayed,
    required this.onPressedScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => onPressedPlayer(),
            child: Text(
              'Player',
              style: GoogleFonts.goldman(
                  fontSize: 20, color: ColorConstants.primaryColor),
            ),
          ),
          SizedBox(
            width: 230,
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                  child: TextButton(
                    onPressed: () => onPressedPlayed(),
                    child: Text(
                      'P',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.goldman(
                          fontSize: 20, color: ColorConstants.primaryColor),
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: TextButton(
                    onPressed: () => onPressedWins(),
                    child: Text(
                      'W',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.goldman(
                          fontSize: 20, color: ColorConstants.primaryColor),
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: TextButton(
                    onPressed: () => onPressedLosses(),
                    child: Text(
                      'L',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.goldman(
                          fontSize: 20, color: ColorConstants.primaryColor),
                    ),
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: TextButton(
                    onPressed: () => onPressedScore(),
                    child: Text(
                      'Score',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.goldman(
                          fontSize: 20, color: ColorConstants.primaryColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
