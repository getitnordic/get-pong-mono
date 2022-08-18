import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../widgets.dart';

class ScoreCounterAdd extends StatefulWidget {
  final int setId;
  final Function(double) setScore;
  final Function(int) getSetId;
  final double score;
  ScoreCounterAdd(
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
    bool isPhone = MediaQuery.of(context).size.width < 500;
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
            child: const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                '11',
                style: TextStyle(
                  color: ColorConstants.secondaryTextColor,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        const SizedBox(
          width: 15,
        ),
        CustomSmallContainer(
          height: 60,
          width: 70,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
            child: IconButton(
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
                size: 38,
              ),
            ),
          ),
        )
      ],
    );
  }
}
