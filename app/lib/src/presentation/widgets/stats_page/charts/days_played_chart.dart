import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/constants.dart';
import '../day.dart';
import 'indicator.dart';

class DaysPlayedChart extends StatefulWidget {
  final List<Day> days;
  const DaysPlayedChart({Key? key, required this.days}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State<DaysPlayedChart> {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 500,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: PieChart(
              PieChartData(
                  pieTouchData: PieTouchData(
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    setState(() {
                      if (!event.isInterestedForInteractions ||
                          pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null) {
                        touchedIndex = -1;
                        return;
                      }
                      touchedIndex =
                          pieTouchResponse.touchedSection!.touchedSectionIndex;
                    });
                  }),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections()),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Indicator(
                color: const Color(0xff8635d5),
                text: widget.days[0].name,
                isSquare: true,
                textColor: ColorConstants.textColor,
              ),
              const SizedBox(
                height: 4,
              ),
              Indicator(
                color: const Color(0xfff24982),
                text: widget.days[1].name,
                isSquare: true,
                textColor: ColorConstants.textColor,
              ),
              const SizedBox(
                height: 4,
              ),
              Indicator(
                color: const Color(0xfff98617),
                text: widget.days[2].name,
                isSquare: true,
                textColor: ColorConstants.textColor,
              ),
              const SizedBox(
                height: 4,
              ),
              Indicator(
                color: const Color(0xfff9c823),
                text: widget.days[3].name,
                isSquare: true,
                textColor: ColorConstants.textColor,
              ),
              const SizedBox(
                height: 4,
              ),
              Indicator(
                color: const Color(0xff2dc574),
                text: widget.days[4].name,
                isSquare: true,
                textColor: ColorConstants.textColor,
              ),
              const SizedBox(
                height: 4,
              ),
              Indicator(
                color: const Color(0xff006cdc),
                text: widget.days[5].name,
                isSquare: true,
                textColor: ColorConstants.textColor,
              ),
              const SizedBox(
                height: 4,
              ),
              Indicator(
                color: const Color(0xff00dbd7),
                text: widget.days[6].name,
                isSquare: true,
                textColor: ColorConstants.textColor,
              ),
              const SizedBox(
                height: 18,
              ),
            ],
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(7, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff8635d5),
            value: widget.days[0].count.toDouble(),
            title: widget.days[0].count.toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: ColorConstants.textColor),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff24982),
            value: widget.days[1].count.toDouble(),
            title: widget.days[1].count.toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: ColorConstants.textColor),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xfff98617),
            value: widget.days[2].count.toDouble(),
            title: widget.days[2].count.toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: ColorConstants.textColor),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xfff9c823),
            value: widget.days[3].count.toDouble(),
            title: widget.days[3].count.toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: ColorConstants.textColor),
          );
        case 4:
          return PieChartSectionData(
            color: const Color(0xff2dc574),
            value: widget.days[4].count.toDouble(),
            title: widget.days[4].count.toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: ColorConstants.textColor),
          );
        case 5:
          return PieChartSectionData(
            color: const Color(0xff006cdc),
            value: widget.days[5].count.toDouble(),
            title: widget.days[5].count.toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: ColorConstants.textColor),
          );
        case 6:
          return PieChartSectionData(
            color: const Color(0xff00dbd7),
            value: widget.days[6].count.toDouble(),
            title: widget.days[6].count.toString(),
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: ColorConstants.textColor),
          );
        default:
          throw Error();
      }
    });
  }
}
