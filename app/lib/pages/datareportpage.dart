// import 'dart:js_interop';
import 'package:app/pages/simulatepage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:app/models/dataset.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:app/models/insight_bar.dart';
import 'package:app/services/analysis_api.dart';
import 'package:app/widgets/insight_bar_chart.dart';
import 'package:app/constants/colors.dart';
import 'package:app/services/analysis_api.dart';
import 'package:app/models/insight_bar.dart';
import 'package:app/widgets/insight_bar_chart.dart';
import 'package:app/models/insight_bar.dart';
import 'package:app/services/analysis_api.dart';
import 'package:app/widgets/insight_bar_chart.dart';



import 'package:app/models/insight_bar.dart';
import 'package:app/services/analysis_api.dart';



import 'package:app/models/insight_bar.dart';
import 'package:app/services/analysis_api.dart';

Future<List<InsightBar>> loadInsightBars(String csvText) async {
  final result = await fetchRegressionInsights(csvText);

  final bars = List.generate(
    result.factors.length,
    (i) => InsightBar(
      factor: result.factors[i],
      percent: result.relativeContribution[i],
    ),
  );

  // Sort ascending like matplotlib barh
  bars.sort((a, b) => a.percent.compareTo(b.percent));

  return bars;
}



const Map<String, Color> factorColors = {
  'rainfall_mm': Color(0xFF1E3A8A),
  'temperature_c': Color(0xFFF59E0B),
  'soil_index': Color(0xFF8D6E63),
  'irrigation_pct': Color(0xFF4FC3F7),
  'fertilizer_kg_ha': Color(0xFF7E57C2),
  'pest_pressure_index': Color(0xFFE53935),
};
const Color yieldGreen = Color(0xFF43A047);


class _DatasetSummary extends StatelessWidget {
  final Dataset dataset;

  const _DatasetSummary({required this.dataset});

  @override
  Widget build(BuildContext context) {
    final yearsCount = dataset.years.length;
    final factorCount = dataset.factors.length;

    final minYield = dataset.yieldValues.reduce((a, b) => a < b ? a : b);
    final maxYield = dataset.yieldValues.reduce((a, b) => a > b ? a : b);
    final avgYield = dataset.yieldValues.reduce((a, b) => a + b) / yearsCount;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withValues(alpha: 0.15),
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Dataset Summary",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text("Years: $yearsCount"),
            Text("Factors: $factorCount"),
            const SizedBox(height: 8),
            Text("Yield min: ${minYield.toStringAsFixed(1)}"),
            Text("Yield max: ${maxYield.toStringAsFixed(1)}"),
            Text("Yield avg: ${avgYield.toStringAsFixed(1)}"),
          ],
        ),
      ),
    );
  }
}

class DataReportPage extends StatefulWidget {
  final Dataset dataset;

  const DataReportPage({
    super.key,
    required this.dataset,
  });

  @override
  State<DataReportPage> createState() => _DataReportPageState();
}


class _DataReportPageState extends State<DataReportPage> {
  late Future<List<InsightBar>> _insightBars;

  @override
  void initState() {
    super.initState();
    _insightBars = _loadInsightBars();
  }

  Future<List<InsightBar>> _loadInsightBars() async {
    final result =
        await fetchRegressionInsights(widget.dataset.rawCsv);

    final bars = List.generate(result.factors.length, (i) {
      return InsightBar(
        factor: result.factors[i],
        percent: result.relativeContribution[i],
      );
    });

    // MUST match Python (ascending order)
    bars.sort((a, b) => a.percent.compareTo(b.percent));
    return bars;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _DatasetSummary(dataset: widget.dataset),
          _FactorsSection(dataset: widget.dataset),
          _YieldSection(dataset: widget.dataset),
          InsightSection(csvText: widget.dataset.rawCsv),

          // 🔹 INSIGHTS SECTION
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 28, 20, 8),
            child: const Text(
              "Insights :",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
            child: const Text(
              "Relative influence of environmental factors on crop yield.",
            ),
          ),

Padding(
  padding: const EdgeInsets.symmetric(horizontal: 12),
  child: FutureBuilder<List<InsightBar>>(
    future: _insightBars,
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return const Padding(
          padding: EdgeInsets.all(24),
          child: Center(child: CircularProgressIndicator()),
        );
      }
      return InsightBarChart(bars: snapshot.data!);
    },
  ),

          ),

          _SimulationSection(),
        ],
      ),
    );
  }
}


class _FactorsSection extends StatelessWidget {
  final Dataset dataset;

  const _FactorsSection({required this.dataset});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Text(
              "Factors :",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Color(0xFF282828),
              ),
            ),
          ),

          SizedBox(
            height: 320,
            child: PageView(
              controller: PageController(viewportFraction: 0.92),
              children: dataset.factors.keys.map((factorName) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(4, 12, 4, 12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(
                            0xFF70C2F8,
                          ).withValues(alpha: 0.25),
                          blurRadius: 8,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            factorName,
                            style: const TextStyle(
                              fontSize: 24,
                              color: Color(0xFF282828),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: FactorLineChart(
                                years: dataset.years,
                                values: dataset.factors[factorName]!,
                                color:
                                    factorColors[factorName] ?? Colors.blueGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class _YieldSection extends StatelessWidget {
  final Dataset dataset;

  const _YieldSection({required this.dataset});

  @override
  Widget build(BuildContext context) {
    final spots = <FlSpot>[];
    final minY = dataset.yieldValues.reduce((a, b) => a < b ? a : b);
    final maxY = dataset.yieldValues.reduce((a, b) => a > b ? a : b);
    final range = maxY - minY;
    final padding = range * 0.3;

    for (int i = 0; i < dataset.years.length; i++) {
      spots.add(FlSpot(dataset.years[i].toDouble(), dataset.yieldValues[i]));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
          child: Text(
            "Yield Trend (kg/ha)",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w400,
              color: Color(0xFF282828),
            ),
          ),
        ),

        Card(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: LineChart(
                LineChartData(
                  minY: minY - padding,
                  maxY: maxY + padding,

                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 500,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.grey.withValues(alpha: 0.2),
                        strokeWidth: 1,
                      );
                    },
                  ),

                  borderData: FlBorderData(show: false),

                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 44,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF4A4A4A),
                            ),
                          );
                        },
                      ),
                    ),

                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 5,
                        reservedSize: 36,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              color: Color(0xFF4A4A4A),
                            ),
                          );
                        },
                      ),
                    ),

                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),

                  lineBarsData: [
                    LineChartBarData(
                      spots: spots,
                      isCurved: true,
                      barWidth: 3.5,
                      color: yieldGreen,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: yieldGreen.withValues(alpha: 0.12),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FactorLineChart extends StatelessWidget {
  final List<int> years;
  final List<double> values;
  final Color color;

  const FactorLineChart({
    super.key,
    required this.years,
    required this.values,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final spots = <FlSpot>[];

    for (int i = 0; i < years.length; i++) {
      spots.add(FlSpot(years[i].toDouble(), values[i]));
    }
    final minVal = values.reduce((a, b) => a < b ? a : b);
    final maxVal = values.reduce((a, b) => a > b ? a : b);
    final range = maxVal - minVal;
    final padding = range == 0 ? 1 : range * 0.3;

    return AspectRatio(
      aspectRatio: 16 / 8,
      child: LineChart(
        LineChartData(
          minY: minVal - padding,
          maxY: maxVal + padding,

          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) => FlLine(
              color: Colors.grey.withValues(alpha: 0.15),
              strokeWidth: 1,
            ),
          ),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 42,
                getTitlesWidget: (value, _) => Text(
                  value.toStringAsFixed(1),
                  style: const TextStyle(fontSize: 11),
                ),
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 5,
                reservedSize: 32,
                getTitlesWidget: (value, _) => Text(
                  value.toInt().toString(),
                  style: const TextStyle(fontSize: 11),
                ),
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              barWidth: 3,
              color: color,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                color: color.withValues(alpha: 0.08),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SimulationSection extends StatelessWidget {
  const _SimulationSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Container(
        // height: 180,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF70C2F8).withValues(alpha: 0.25),
              blurRadius: 8,
              spreadRadius: 8,
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
              child: Text(
                "Simulate :",
                style: TextStyle(
                  fontSize: 28,
                  height: 1,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF282828),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Text(
                "Studying the past we can assume the future trends if the factors stay same or differ with time.",
                style: TextStyle(
                  fontSize: 16,
                  // height: 1.2,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              child: ElevatedButton(
                onPressed: () {
                  HapticFeedback.selectionClick();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SimulatePage(),
                    ),
                  );
                },

                style: ElevatedButton.styleFrom(
                  shadowColor: const Color(0xFF70C2F8).withValues(alpha: 0.5),
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF70C2F8).withValues(alpha: 0.5),
                        blurRadius: 8,
                        spreadRadius: 8,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                      child: Text("Simulate", style: TextStyle(fontSize: 18)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class InsightSection extends StatefulWidget {
  final String csvText;

  const InsightSection({
    super.key,
    required this.csvText,
  });

  @override
  State<InsightSection> createState() => _InsightSectionState();
}

class _InsightSectionState extends State<InsightSection> {
  late Future<List<InsightBar>> _futureBars;

  @override
  void initState() {
    super.initState();
    _futureBars = loadInsightBars(widget.csvText);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Insights",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 12),

FutureBuilder<List<InsightBar>>(
  future: _futureBars,
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Padding(
        padding: EdgeInsets.all(24),
        child: CircularProgressIndicator(),
      );
    }

    if (snapshot.hasError) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          "ERROR:\n${snapshot.error}",
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    return InsightBarChart(bars: snapshot.data!);
  },
),

        ],
      ),
    );
  }
}


