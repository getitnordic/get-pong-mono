import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/color_constants.dart';
import '../../../../enums/score_type.dart';
import '../../../../enums/team.dart';
import '../../../Presentation/widgets/custom_small_container.dart';

class ScoreCounterRemove extends ConsumerStatefulWidget {
  final int setId;
  final Function(int, Team, ScoreType) setScore;

  final double score;
  final Team team;
  const ScoreCounterRemove({
    Key? key,
    required this.setId,
    required this.setScore,
    required this.score,
    required this.team,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ScoreCounterRemoveState();
}

class _ScoreCounterRemoveState extends ConsumerState<ScoreCounterRemove> {
  late double counter;

  @override
  void initState() {
    counter = widget.score;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isPhoneOrVertical = MediaQuery.of(context).size.width < 1000;
    final isPhone = MediaQuery.of(context).size.width < 550;

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CustomSmallContainer(
            height: isPhoneOrVertical ? 60 : 90,
            width: isPhoneOrVertical ? 70 : 100,
            child: SizedBox(
              height: isPhoneOrVertical ? 60 : 90,
              width: isPhoneOrVertical ? 70 : 100,
              child: IconButton(
                iconSize: isPhoneOrVertical ? 38 : 58,
                onPressed: () {
                  counter--;
                  widget.setScore(widget.setId, widget.team, ScoreType.remove);
                },
                icon: const Icon(
                  Icons.remove,
                  color: ColorConstants.primaryColor,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        if (!isPhone)
          TextButton(
            onPressed: () {
              counter = 0;

              widget.setScore(widget.setId, widget.team, ScoreType.min);
            },
            child: Text(
              '0',
              style: TextStyle(
                color: ColorConstants.secondaryTextColor,
                fontSize: isPhoneOrVertical ? 24 : 48,
              ),
            ),
          ),
      ],
    );
  }
}
