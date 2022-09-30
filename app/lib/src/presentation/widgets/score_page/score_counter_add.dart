import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/enums/score_type.dart';

import '../../../../constants/constants.dart';
import '../../../../enums/team.dart';
import '../widgets.dart';

class ScoreCounterAdd extends ConsumerStatefulWidget {
  final int setId;
  final Function(int, Team, ScoreType) setScore;

  final double score;
  final Team team;
  const ScoreCounterAdd({
    Key? key,
    required this.setId,
    required this.setScore,
    required this.score,
    required this.team,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ScoreCounterAddState();
}

class _ScoreCounterAddState extends ConsumerState<ScoreCounterAdd> {
  @override
  Widget build(BuildContext context) {
    final isPhoneOrVertical = MediaQuery.of(context).size.width < 1000;
    final isPhone = MediaQuery.of(context).size.width < 550;

    double counter = widget.score;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isPhone)
          TextButton(
            onPressed: () {
              counter = 11;

              widget.setScore(widget.setId, widget.team, ScoreType.max);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                '11',
                style: TextStyle(
                  color: ColorConstants.secondaryTextColor,
                  fontSize: isPhoneOrVertical ? 24 : 48,
                ),
              ),
            ),
          ),
        const SizedBox(
          width: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: CustomSmallContainer(
            height: isPhoneOrVertical ? 60 : 90,
            width: isPhoneOrVertical ? 70 : 100,
            child: SizedBox(
              height: isPhoneOrVertical ? 60 : 90,
              width: isPhoneOrVertical ? 70 : 100,
              child: IconButton(
                iconSize: isPhoneOrVertical ? 38 : 58,
                onPressed: () {
                  counter++;

                  widget.setScore(widget.setId, widget.team, ScoreType.add);
                },
                icon: const Icon(
                  Icons.add,
                  color: ColorConstants.primaryColor,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
