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
      case 500:
        text = '500';
        break;
      case 550:
        text = '550';
        break;
      case 600:
        text = '600';
        break;
      case 650:
        text = '650';
        break;
      case 700:
        text = '700';
        break;
      case 750:
        text = '750';
        break;
      case 800:
        text = '800';
        break;
      case 850:
        text = '850';
        break;
      case 900:
        text = '900';
        break;
      case 950:
        text = '950';
        break;
      case 1000:
        text = '1000';
        break;
      case 1050:
        text = '1050';
        break;
      case 1100:
        text = '1100';
        break;
      case 1150:
        text = '1150';
        break;
      case 1200:
        text = '1200';
        break;
      case 1250:
        text = '1250';
        break;
      case 1300:
        text = '1300';
        break;
      case 1350:
        text = '1350';
        break;
      case 1400:
        text = '1400';
        break;
      case 1450:
        text = '1450';
        break;
      case 1500:
        text = '1500';
        break;
      case 1550:
        text = '1550';
        break;
      case 1600:
        text = '1600';
        break;
      case 1650:
        text = '1650';
        break;
      case 1700:
        text = '1700';
        break;
      case 1750:
        text = '1750';
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
        horizontalInterval: 50,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: ColorConstants.dividerColor,
            strokeWidth: 0.3,
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
              Border.all(color: ColorConstants.secondaryTextColor, width: 1.2)),
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
