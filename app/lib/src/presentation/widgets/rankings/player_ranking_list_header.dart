import 'package:flutter/material.dart';
import 'package:get_pong/constants/color_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerRankingListHeader extends StatelessWidget {
  const PlayerRankingListHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Player',
            style: GoogleFonts.goldman(
                fontSize: 20, color: ColorConstants.primaryColor),
          ),
          SizedBox(
            width: 220,
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                  child: Text(
                    'P',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.goldman(
                        fontSize: 20, color: ColorConstants.primaryColor),
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Text(
                    'W',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.goldman(
                        fontSize: 20, color: ColorConstants.primaryColor),
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: Text(
                    'L',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.goldman(
                        fontSize: 20, color: ColorConstants.primaryColor),
                  ),
                ),
                SizedBox(
                  width: 70,
                  child: Text(
                    'Score',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.goldman(
                        fontSize: 20, color: ColorConstants.primaryColor),
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
