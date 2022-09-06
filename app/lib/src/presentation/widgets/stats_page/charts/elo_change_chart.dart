import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/constants.dart';
import '../../../../../utils/mixins/format_date_mixin.dart';
import 'elo_chart_data.dart';

class EloChangeChart extends StatefulWidget {
  final EloChartData data;
  const EloChangeChart({Key? key, required this.data}) : super(key: key);

  @override
  State<EloChangeChart> createState() => _EloChangeChartState();
}

class _EloChangeChartState extends State<EloChangeChart> with FormatDateMixin {
  List<Color> gradientColors = [
    const Color(0xff006cdc),
    const Color(0xff2dc574),
  ];

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
                color: Colors.transparent),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: ColorConstants.textColor,
      fontSize: 11,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text(
            formatDateEloChart(
              DateTime.now().subtract(
                const Duration(days: 30),
              ),
            ),
            style: style);
        break;
      case 7:
        text = Text(
            formatDateEloChart(
              DateTime.now().subtract(
                const Duration(days: 23),
              ),
            ),
            style: style);
        break;
      case 15:
        text = Text(
            formatDateEloChart(
              DateTime.now().subtract(
                const Duration(days: 14),
              ),
            ),
            style: style);
        break;
      case 22:
        text = Text(
            formatDateEloChart(
              DateTime.now().subtract(
                const Duration(days: 7),
              ),
            ),
            style: style);
        break;
      case 29:
        text = Text(formatDateEloChart(DateTime.now()), style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: ColorConstants.textColor,
      fontSize: 11,
    );
    String text;

    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 1000:
        text = '1000';
        break;
      case 2000:
        text = '2000';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.transparent,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.transparent,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border:
              Border.all(color: ColorConstants.secondaryTextColor, width: 1)),
      minX: 0,
      maxX: 29,
      minY: (widget.data.getLowest() - 20),
      maxY: (widget.data.getHighest() + 20),
      lineBarsData: [
        LineChartBarData(
          spots: _generateFlSpots(),
          isCurved: false,
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          barWidth: 2,
          preventCurveOverShooting: false,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }

  List<FlSpot> _generateFlSpots() {
    List<FlSpot> spots = [];
    double counter = 0;
    for (var rating in widget.data.ratings) {
      final spot = FlSpot(counter, rating.toDouble());
      spots.add(spot);
      counter++;
    }

    return spots;
  }
}
