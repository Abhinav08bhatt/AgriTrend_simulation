import 'package:app/models/dataset.dart';

Dataset parseCsv(String csvText) {
  final lines = csvText.trim().split('\n');

  if (lines.length < 2) {
    throw Exception("CSV has no data rows");
  }

  final headers = lines.first.split(',');

  // Map column name → index
  final colIndex = <String, int>{};
  for (int i = 0; i < headers.length; i++) {
    colIndex[headers[i]] = i;
  }

  // Required columns
  final required = [
    'year',
    'rainfall_mm',
    'temperature_c',
    'soil_index',
    'irrigation_pct',
    'fertilizer_kg_ha',
    'yield_kg_ha',
  ];

  for (final col in required) {
    if (!colIndex.containsKey(col)) {
      throw Exception("Missing column: $col");
    }
  }

  // Storage
  final years = <int>[];
  final yieldValues = <double>[];
  final factors = <String, List<double>>{
    'rainfall_mm': [],
    'temperature_c': [],
    'soil_index': [],
    'irrigation_pct': [],
    'fertilizer_kg_ha': [],
  };

  // Parse rows
  for (int i = 1; i < lines.length; i++) {
    final cells = lines[i].split(',');

    if (cells.length != headers.length) continue;

    years.add(int.parse(cells[colIndex['year']!]));
    yieldValues.add(double.parse(cells[colIndex['yield_kg_ha']!]));

    factors['rainfall_mm']!
        .add(double.parse(cells[colIndex['rainfall_mm']!]));
    factors['temperature_c']!
        .add(double.parse(cells[colIndex['temperature_c']!]));
    factors['soil_index']!
        .add(double.parse(cells[colIndex['soil_index']!]));
    factors['irrigation_pct']!
        .add(double.parse(cells[colIndex['irrigation_pct']!]));
    factors['fertilizer_kg_ha']!
        .add(double.parse(cells[colIndex['fertilizer_kg_ha']!]));
  }

  return Dataset(
    years: years,
    factors: factors,
    yieldValues: yieldValues,
    rawCsv: csvText,
  );
}
