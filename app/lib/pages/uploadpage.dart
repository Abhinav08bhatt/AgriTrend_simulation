// ignore_for_file: unused_import
import 'dart:typed_data';
import 'package:app/main.dart';
import 'package:flutter/material.dart';
import 'package:file_selector/file_selector.dart';
import 'package:url_launcher/url_launcher.dart';

class UploadPage extends StatefulWidget {
    const UploadPage({super.key});

    @override
    State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
    String? fileName;
    String? fileContent;

    final Map<String, String> sampleFiles = {
        'Universal synthetic data': 'sample_data/universal-synthetic.csv',
        'Rice synthetic data': 'sample_data/rice-synthetic.csv',
        'Wheat synthetic data': 'sample_data/wheat-synthetic.csv',
        'Maize synthetic data': 'sample_data/maize-synthetic.csv',
    };

    Future<void> loadSampleCsv(String label, String path) async {
        final bytes = await DefaultAssetBundle.of(context).load(path);
        final content = String.fromCharCodes(bytes.buffer.asUint8List());
    
        setState(() {
            fileName = path.split('/').last;
            fileContent = content;
        });
    }

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
                title: Padding(
                    padding: const EdgeInsets.fromLTRB(8,4,0,0),
                    child: const Text(
                        'Upload Data',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                        ),
                    ),
                ),
                actions: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 4, 8, 0),
                        child: IconButton(
                        onPressed: () async {
                            final Uri uri = Uri.parse(
                                'https://github.com/Abhinav08bhatt/AgriTrend_simulation',
                            );
                            await launchUrl(
                                uri,
                                mode: LaunchMode.externalApplication,
                            );
                        },
                            icon: Image.asset(
                                'images/github.png',
                                width: 28,
                                height: 28,
                            ),
                        ),
                    ),
                ],
            ),

            body: ListView(
                children: [
                    Column(
                        children: [
                    
                            Container(
                                height: 10,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(50),
                                        bottomRight: Radius.circular(50),
                                    ),
                                    boxShadow: [
                                        BoxShadow(
                                            color: const Color.fromARGB(36, 59, 163, 248),
                                            blurRadius: 12,
                                            spreadRadius: 6,
                                        ),
                                    ],
                                ),
                            ),   
                    
                            const SizedBox(height: 0),
                    
                            Padding(
                                padding: const EdgeInsets.fromLTRB(24,24,24,8),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                    
                                        const Text(
                                            'Sample Data',
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: Colors.black87,
                                                fontWeight: FontWeight.w500,
                                            ),
                                        ),
                    
                                        Text(
                                            "Choose sample data from below to continue with : ",
                                            style: TextStyle(
                                                fontSize: 18,
                                            ),
                                        ),
                    
                                        const SizedBox(height: 20),
                    
                                        Container(
                                            // padding: const EdgeInsets.all(20),
                                            height: 60,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(18),
                                                boxShadow: [
                                                    BoxShadow(
                                                        color: const Color.fromARGB(36, 59, 163, 248), 
                                                        blurRadius: 20,
                                                        spreadRadius: 2,
                                                    ),
                                                ],
                                            ),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                    loadSampleCsv(
                                                        'Universal synthetic data',
                                                        sampleFiles['Universal synthetic data']!,
                                                    );
                                                }, 
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.white,
                                                ),
                                                child: Row(
                                                    children: [
                                                        
                                                        Icon(
                                                            Icons.file_present,
                                                            color: Color(0xFF282828),
                                                            size: 24,
                                                        ),
                    
                                                        Padding(
                                                            padding: const EdgeInsets.fromLTRB(12,0,0,0),
                                                            child: Text(
                                                                "Universal synthetic data",
                                                                style: TextStyle(
                                                                    fontSize: 18,  
                                                                    color: Color(0xFF282828),
                                                                ),
                                                            ),
                                                        ),
                                                    ],
                                                )
                                            ),
                                        ),
                    
                                        const SizedBox(height: 12),
                    
                                        Container(
                                            // padding: const EdgeInsets.all(20),
                                            height: 60,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(18),
                                                boxShadow: [
                                                    BoxShadow(
                                                        color: const Color.fromARGB(36, 59, 163, 248), 
                                                        blurRadius: 20,
                                                        spreadRadius: 2,
                                                    ),
                                                ],
                                            ),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                    loadSampleCsv(
                                                        'Rice synthetic data',
                                                        sampleFiles['Rice synthetic data']!,
                                                    );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.white,
                                                ),
                                                child: Row(
                                                    children: [
                                                        
                                                        Icon(
                                                            Icons.file_present,
                                                            color: Color(0xFF282828),
                                                            size: 24,
                                                        ),
                    
                                                        Padding(
                                                            padding: const EdgeInsets.fromLTRB(12,0,0,0),
                                                            child: Text(
                                                                "Rice synthetic data",
                                                                style: TextStyle(
                                                                    fontSize: 18,  
                                                                    color: Color(0xFF282828),
                                                                ),
                                                            ),
                                                        ),
                                                    ],
                                                )
                                            ),
                                        ),
                    
                                        const SizedBox(height: 12),
                    
                                        Container(
                                            // padding: const EdgeInsets.all(20),
                                            height: 60,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(18),
                                                boxShadow: [
                                                    BoxShadow(
                                                        color: const Color.fromARGB(36, 59, 163, 248), 
                                                        blurRadius: 20,
                                                        spreadRadius: 2,
                                                    ),
                                                ],
                                            ),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                    loadSampleCsv(
                                                        'Wheat synthetic data',
                                                        sampleFiles['Wheat synthetic data']!,
                                                    );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.white,
                                                ),
                                                child: Row(
                                                    children: [
                                                        
                                                        Icon(
                                                            Icons.file_present,
                                                            color: Color(0xFF282828),
                                                            size: 24,
                                                        ),
                    
                                                        Padding(
                                                            padding: const EdgeInsets.fromLTRB(12,0,0,0),
                                                            child: Text(
                                                                "Wheat synthetic data",
                                                                style: TextStyle(
                                                                    fontSize: 18,  
                                                                    color: Color(0xFF282828),
                                                                ),
                                                            ),
                                                        ),
                                                    ],
                                                )
                                            ),
                                        ),
                    
                                        const SizedBox(height: 12),
                    
                                        Container(
                                            // padding: const EdgeInsets.all(20),
                                            height: 60,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(18),
                                                boxShadow: [
                                                    BoxShadow(
                                                        color: const Color.fromARGB(36, 59, 163, 248), 
                                                        blurRadius: 20,
                                                        spreadRadius: 2,
                                                    ),
                                                ],
                                            ),
                                            child: ElevatedButton(
                                                onPressed: () { 
                                                    loadSampleCsv(
                                                        'Maize synthetic data',
                                                        sampleFiles['Maize synthetic data']!,
                                                    );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.white,
                                                ),
                                                child: Row(
                                                    children: [
                                                        
                                                        Icon(
                                                            Icons.file_present,
                                                            color: Color(0xFF282828),
                                                            size: 24,
                                                        ),
                    
                                                        Padding(
                                                            padding: const EdgeInsets.fromLTRB(12,0,0,0),
                                                            child: Text(
                                                                "Maize synthetic data",
                                                                style: TextStyle(
                                                                    fontSize: 18,  
                                                                    color: Color(0xFF282828),
                                                                ),
                                                            ),
                                                        ),
                                                    ],
                                                )
                                            ),
                                        ),
                    
                                    ],
                                ),
                            ),
                    
                            Padding(
                                padding: const EdgeInsets.fromLTRB(24,12,24,12),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                    
                                        const Text(
                                            'Upload your own file',
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: Colors.black87,
                                                fontWeight: FontWeight.w500,
                                            ),
                                        ),
                    
                                        const SizedBox(height: 10),

                                        SizedBox(
                                        height: 56,
                                        width: double.infinity,
                                        child: ElevatedButton(
                                            onPressed: pickCsvFile,
                                            style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.blueAccent,
                                            padding: const EdgeInsets.symmetric(vertical: 18),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(18),
                                            ),
                                            ),
                                            child: const Text(
                                            'Upload CSV',
                                            style: TextStyle(fontSize: 18),
                                            ),
                                        ),
                                        ),
                    
                                        const SizedBox(height: 30),
                    
                                        Container(
                                            padding: const EdgeInsets.all(20),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(24),
                                                boxShadow: [
                                                    BoxShadow(
                                                        color: const Color.fromARGB(36, 59, 163, 248), 
                                                        blurRadius: 20,
                                                        spreadRadius: 2,
                                                    ),
                                                ],
                                            ),
                    
                    
                                            child: Column(
                                                children: [                                  
                    
                                                    Padding(
                                                        padding: const EdgeInsets.fromLTRB(0,0,0,18),
                                                        child: const Text(
                                                            'Confirm Data',
                                                            style: TextStyle(
                                                                fontSize: 22,
                                                                color: Colors.black87,
                                                                fontWeight: FontWeight.w500,
                                                            ),
                                                        ),
                                                    ),
                    
                                                    Container(
                                                        height: 60,
                                                        padding: const EdgeInsets.fromLTRB(20, 10, 10, 12),
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(18),
                                                            border: Border.all(
                                                                color: const Color.fromARGB(77, 33, 150, 243), 
                                                            ),
                                                        ),
                                                        child: Row(
                                                            children: [
                                                                Expanded(
                                                                    child: Text(
                                                                        fileName ?? 'csv file',
                                                                        style: TextStyle(
                                                                            fontSize: 16,
                                                                            color: fileName == null ? Colors.grey : Colors.black,
                                                                        ),
                                                                    ),
                                                                ),
                    
                                                                IconButton(
                                                                    icon: Icon(
                                                                        fileName == null ? Icons.attach_file : Icons.remove,
                                                                        color: fileName == null ? Colors.grey : Colors.redAccent,
                                                                    ),
                                                                    onPressed: fileName == null? null: () {setState(() {
                                                                        fileName = null;
                                                                        fileContent = null;
                                                                    });},
                                                                ),
                                                            ],
                                                        ),
                                                    ),
                            
                                                    const SizedBox(height: 20),
                            
                                    // Confirm button
                                                    Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: SizedBox(
                                                            width: double.infinity,
                                                            child: Expanded(
                                                                child: ElevatedButton(
                                                                    onPressed: fileName == null ? null : () {
                                                                // navigation will go here later
                                                                    },
                                                                    style: ElevatedButton.styleFrom(
                                                                        padding: const EdgeInsets.symmetric(vertical: 18),
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(18),
                                                                        ),
                                                                    ),
                                                                    child: const Text(
                                                                        'Confirm',
                                                                        style: TextStyle(fontSize: 18),
                                                                    ),
                                                                ),
                                                            ),
                                                        ),
                                                    ),
                                                ],
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                        ],
                    ),
                ],
            ),
        );
    }
}


