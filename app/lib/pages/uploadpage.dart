// ignore_for_file: unused_import
import 'dart:typed_data';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:file_selector/file_selector.dart';

class UploadPage extends StatefulWidget {
    const UploadPage({super.key});

    @override
    State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
    String? fileName;
    String? fileContent;

    Future<void> pickCsvFile() async {
        final typeGroup = XTypeGroup(
            label: 'CSV',
            extensions: ['csv'],
        );
        final file = await openFile(acceptedTypeGroups: [typeGroup]);
        if (file == null) return;
        final Uint8List bytes = await file.readAsBytes();
        final String content = String.fromCharCodes(bytes);
        setState(() {
            fileName = file.name;
            fileContent = content;
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text(
                    'Upload Dataset',
                )
            ),
            body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        ElevatedButton(
                            onPressed: pickCsvFile,
                            child: const Text('Upload CSV'),
                        ),
                        const SizedBox(height: 16),
                        if (fileName != null) ...[
                            Text('File: $fileName'),
                            const SizedBox(height: 12),
                            Expanded(
                                child: Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                    ),
                                    child: SingleChildScrollView(
                                        child: Text(
                                            fileContent!,
                                            style: const TextStyle(fontFamily: 'monospace'),
                                        ),
                                    ),
                                ),
                            ),
                        ],
                    ],
                ),
            ),
        );
    }
}


