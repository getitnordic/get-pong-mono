import 'package:flutter/material.dart';
import 'package:get_pong/src/Presentation/widgets/custom_small_container.dart';
import 'package:get_pong/src/domain/entities/ping_pong_match.dart';

class ScoreboardListItem extends StatelessWidget {
  const ScoreboardListItem({Key? key, required this.match}) : super(key: key);
  final PingPongMatch match;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomSmallContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 165,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    match.playerOne.name,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CircleAvatar(
                      radius: 12.0,
                      backgroundImage: NetworkImage(match.playerOne.imageUrl),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      match.playerOneScore.toString(),
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 5,
              child: Text(
                  ' - ',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(
              width: 165,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                    child: Text(
                      match.playerTwoScore.toString(),
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                      radius: 12.0,
                      backgroundImage: NetworkImage(match.playerTwo.imageUrl),
                    ),
                  ),
                  Text(
                      match.playerTwo.name,
                    style: const TextStyle(
                        fontSize: 11,
                        color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
