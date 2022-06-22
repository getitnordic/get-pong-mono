import 'package:flutter/material.dart';
import 'package:get_pong/constants/color_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerRankingListHeader extends StatelessWidget {
  const PlayerRankingListHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Player',
          style: GoogleFonts.goldman(
              fontSize: 20, color: ColorConstants.primaryColor),
        ),
        SizedBox(
          width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'P',
                style: GoogleFonts.goldman(
                    fontSize: 20, color: ColorConstants.primaryColor),
              ),
              Text(
                'W',
                style: GoogleFonts.goldman(
                    fontSize: 20, color: ColorConstants.primaryColor),
              ),
              Text(
                'L',
                style: GoogleFonts.goldman(
                    fontSize: 20, color: ColorConstants.primaryColor),
              ),
              Text(
                'Score',
                style: GoogleFonts.goldman(
                    fontSize: 20, color: ColorConstants.primaryColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
