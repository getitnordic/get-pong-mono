import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../widgets.dart';

class ScoreCounterAdd extends StatefulWidget {
  final int setId;
  final Function(double) setScore;
  final Function(int) getSetId;
  final double score;
  const ScoreCounterAdd(
      {Key? key,
      required this.setId,
      required this.setScore,
      required this.getSetId,
      required this.score})
      : super(key: key);

  @override
  State<ScoreCounterAdd> createState() => _ScoreCounterAddState();
}

class _ScoreCounterAddState extends State<ScoreCounterAdd> {
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
              setState(() {
                counter = 11;
              });
              widget.getSetId(widget.setId);
              widget.setScore(counter);
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
                  setState(() {
                    counter++;
                  });
                  widget.getSetId(widget.setId);
                  widget.setScore(counter);
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
