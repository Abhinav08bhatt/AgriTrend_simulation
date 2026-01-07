class Dataset {
  final List<int> years;
  final Map<String, List<double>> factors;
  final List<double> yieldValues;
  final String rawCsv; // 👈 REQUIRED for backend calls

  Dataset({
    required this.years,
    required this.factors,
    required this.yieldValues,
    required this.rawCsv,
  });
}
