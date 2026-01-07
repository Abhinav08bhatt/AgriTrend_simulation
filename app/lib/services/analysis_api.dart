import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class RegressionResult {
  final List<String> factors;
  final List<double> standardizedImpact;
  final List<double> relativeContribution;

  RegressionResult({
    required this.factors,
    required this.standardizedImpact,
    required this.relativeContribution,
  });

  factory RegressionResult.fromJson(Map<String, dynamic> json) {
    return RegressionResult(
      factors: List<String>.from(json['factors']),
      standardizedImpact:
          List<double>.from(json['standardized_impact']),
      relativeContribution:
          List<double>.from(json['relative_contribution']),
    );
  }
}

Future<RegressionResult> fetchRegressionInsights(String csvText) async {
  debugPrint("📡 Sending regression request...");
  debugPrint(csvText.substring(0, 50));

  final response = await http.post(
    Uri.parse("http://172.31.136.162:8000/analysis/regression"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({"csv": csvText}),
  );

  debugPrint("📥 Status code: ${response.statusCode}");
  debugPrint("📥 Body: ${response.body}");

  if (response.statusCode != 200) {
    throw Exception("Backend error: ${response.body}");
  }

  return RegressionResult.fromJson(jsonDecode(response.body));
}
