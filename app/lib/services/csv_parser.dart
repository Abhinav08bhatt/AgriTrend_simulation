import 'package:csv/csv.dart';
import '../models/dataset.dart';

Dataset parseCsv(String csvContent) {
  try {
    final rows = const CsvToListConverter(
      eol: '\n',
      shouldParseNumbers: false,
    ).convert(csvContent);

    if (rows.isEmpty) {
      throw Exception('CSV is empty');
    }

    // Normalize headers
    final headers = rows.first
        .map((e) => e.toString().trim().toLowerCase())
        .toList();

    final dataRows = rows.skip(1);

    // Required columns
    final yearIndex = headers.indexOf('year');
    final yieldIndex = headers.indexOf('yield_kg_ha');

    if (yearIndex == -1 || yieldIndex == -1) {
      throw Exception('CSV must contain year and yield_kg_ha columns');
    }

    final years = <int>[];
    final yieldValues = <double>[];
    final factors = <String, List<double>>{};

    // All other columns are factors
    for (int i = 0; i < headers.length; i++) {
      final h = headers[i];
      if (i != yearIndex && i != yieldIndex) {
        factors[h] = [];
      }
    }

    for (final row in dataRows) {
      if (row.length != headers.length) continue;

      years.add(int.parse(row[yearIndex].toString()));
      yieldValues.add(double.parse(row[yieldIndex].toString()));

      factors.forEach((key, list) {
        final idx = headers.indexOf(key);
        list.add(double.parse(row[idx].toString()));
      });
    }

    return Dataset(
      years: years,
      factors: factors,
      yieldValues: yieldValues,
    );
  } catch (e, s) {
    print('CSV PARSE ERROR: $e');
    print('$s');
    rethrow;
  }
}
