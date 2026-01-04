
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class SimulatePage extends StatefulWidget {
    const SimulatePage({super.key});

    @override
    State<SimulatePage> createState() => _SimulatePageState();
}

class _SimulatePageState extends State<SimulatePage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                
                automaticallyImplyLeading: false,

                title: Padding(
                    padding: const EdgeInsets.fromLTRB(6,4,0,0),
                    child: const Text(
                        'Simulation',
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                        
                            Padding(
                                padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                                child: Text(
                                        "From the Data Report we knows that Yield depends on the factors. And in future the Yield trend will depend on the trends of the factors and other environmental conditions.",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,  
                                        ),
                                    ),
                            ),

                            _ReportPDFSection(),
                            _BaselineSection(),
                            _ScenarioSection(),
                            _FollowUpSection(),

                        ],
                    )
                ],
            ),
        );
    }
}


class _ReportPDFSection extends StatelessWidget {
    const _ReportPDFSection();

    @override
    Widget build(BuildContext context) {
        return Card(

        );
    }
}

class _BaselineSection extends StatelessWidget {
    const _BaselineSection();

    @override
    Widget build(BuildContext context) {
        return Card(
            
        );
    }
}

class _ScenarioSection extends StatelessWidget {
    const _ScenarioSection();

    @override
    Widget build(BuildContext context) {
        return Card(
            
        );
    }
}


class _FollowUpSection extends StatelessWidget {
    const _FollowUpSection();

    @override
    Widget build(BuildContext context) {
        return Card(
            
        );
    }
}
