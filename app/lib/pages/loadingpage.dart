import 'package:app/pages/datareportpage.dart';
import 'package:flutter/material.dart';
import 'package:app/models/dataset.dart';
import 'package:app/services/csv_parser.dart';
import 'package:app/constants/colors.dart';


class LoadingPage extends StatefulWidget {
  final String fileContent;

  const LoadingPage({
    super.key,
    required this.fileContent,
  });


  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
@override
void initState() {
  super.initState();

  Future.microtask(() {
    try {
final dataset = parseCsv(widget.fileContent);
// final insights = computeInsights(dataset);
// final insight = computeInsights(dataset);


      if (!mounted) return;


Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => DataReportPage(
      dataset: dataset,
    ),
  ),
);




    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid CSV file')),
      );

      Navigator.pop(context);
    }
  });
}





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 24),
            Text(
              'Analyzing dataset…',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
