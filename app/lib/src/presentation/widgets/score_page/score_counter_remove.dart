import 'package:flutter/material.dart';

import '../../../../constants/color_constants.dart';
import '../../../Presentation/widgets/custom_small_container.dart';

class ScoreCounterRemove extends StatefulWidget {
  final int setId;
  final Function(double) setScore;
  final Function(int) getSetId;
  final double score;
  const ScoreCounterRemove(
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
    final isPhoneOrVertical = MediaQuery.of(context).size.width < 1000;
    final isPhone = MediaQuery.of(context).size.width < 550;
    double counter = widget.score;

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
              if (counter > 0) {
                setState(() {
                  counter = 0;
                });
                widget.getSetId(widget.setId);
                widget.setScore(counter);
              }
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
