class Dataset {
  final List<int> years;
  final Map<String, List<double>> factors;
  final List<double> yieldValues;

  Dataset({
    required this.years,
    required this.factors,
    required this.yieldValues,
  });
}
