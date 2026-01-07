import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../models/insight_bar.dart';
import 'package:app/constants/colors.dart';


class InsightBarChart extends StatelessWidget {
  final List<InsightBar> bars;

  const InsightBarChart({super.key, required this.bars});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: BarChart(
        BarChartData(
          maxY: 40,
          barGroups: List.generate(bars.length, (i) {
            return BarChartGroupData(
              x: i,
              barRods: [
                BarChartRodData(
                  toY: bars[i].percent,
                  width: 18,
                  borderRadius: BorderRadius.circular(6),
                  color:
                      factorColors[bars[i].factor] ?? Colors.blueGrey,
                ),
              ],
            );
          }),

          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 10,
                getTitlesWidget: (v, _) => Text("${v.toInt()}%"),
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (v, _) {
                  final i = v.toInt();
                  if (i < 0 || i >= bars.length) return const SizedBox();
                  return Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      bars[i].factor,
                      style: const TextStyle(fontSize: 10),
                    ),
                  );
                },
              ),
            ),
            topTitles:
                AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles:
                AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),

          gridData: FlGridData(show: true),
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }
}
