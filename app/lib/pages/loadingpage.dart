import 'package:app/pages/datareportpage.dart';
import 'package:flutter/material.dart';
import 'package:app/models/dataset.dart';
import 'package:app/services/csv_parser.dart';


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

  Future.microtask(() async {
    try {
      final dataset = parseCsv(widget.fileContent);

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => DataReportPage(dataset: dataset),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid CSV file')),
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
