import 'package:flutter/material.dart';
import 'package:get_pong/config/themes/color_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerRankingListHeader extends StatelessWidget {
  final VoidCallback onPressedPlayer;
  final VoidCallback onPressedWins;
  final VoidCallback onPressedLosses;
  final VoidCallback onPressedPlayed;

  const PlayerRankingListHeader({
    Key? key,
    required this.onPressedPlayer,
    required this.onPressedPlayed,
    required this.onPressedWins,
    required this.onPressedLosses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10),
          child: TextButton(
            onPressed: () => onPressedPlayer(),
            child: Text(
              'Player',
              style: GoogleFonts.goldman(
                  fontSize: 20, color: ColorConstants.primaryColor),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 50,
                child: TextButton(
                  onPressed: () => onPressedPlayed(),
                  child: Text(
                    'P',
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
                    style: GoogleFonts.goldman(
                        fontSize: 20, color: ColorConstants.primaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
