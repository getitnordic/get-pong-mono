import 'package:flutter/material.dart';

import '../../../../constants/color_constants.dart';
import '../../../Presentation/widgets/custom_small_container.dart';

class ScoreCounterRemove extends StatefulWidget {
  final int setId;
  final Function(double) setScore;
  final Function(int) getSetId;
  final double score;
  ScoreCounterRemove(
      {Key? key,
      required this.setId,
      required this.setScore,
      required this.getSetId,
      required this.score})
      : super(key: key);

  @override
  State<ScoreCounterRemove> createState() => _ScoreCounterRemoveState();
}

class _ScoreCounterRemoveState extends State<ScoreCounterRemove> {
  @override
  Widget build(BuildContext context) {
    bool isPhone = MediaQuery.of(context).size.width < 500;
    double counter = widget.score;

    return Row(
      children: [
        CustomSmallContainer(
          height: 60,
          width: 70,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
            child: IconButton(
              onPressed: () {
                if (counter > 0) {
                  setState(() {
                    counter--;
                  });
                  widget.getSetId(widget.setId);
                  widget.setScore(counter);
                }
              },
              icon: const Icon(
                Icons.remove,
                color: ColorConstants.primaryColor,
                size: 38,
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
              if (counter > 0) {
                setState(() {
                  counter = 0;
                });
                widget.getSetId(widget.setId);
                widget.setScore(counter);
              }
            },
            child: const Text(
              '0',
              style: TextStyle(
                color: ColorConstants.secondaryTextColor,
                fontSize: 24,
              ),
            ),
          ),
      ],
    );
  }
}
