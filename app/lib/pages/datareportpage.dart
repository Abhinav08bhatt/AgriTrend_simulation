// import 'dart:js_interop';
import 'package:app/pages/simulatepage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class DataReportPage extends StatefulWidget {
    const DataReportPage({super.key});

    @override
    State<DataReportPage> createState() => _DataReportPageState();
}

class _DataReportPageState extends State<DataReportPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                
                automaticallyImplyLeading: false,

                title: Padding(
                    padding: const EdgeInsets.fromLTRB(6,4,0,0),
                    child: const Text(
                        'Data Report',
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
                                        "Below is the report of how the factors behaved in the past and how much they affect yield.",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,  
                                        ),
                                    ),
                            ),

                            _FactorsSection(),
                            _YieldSection(),
                            _InsightSection(),
                            _SimulationSection(),

                        ],
                    )
                ],
            ),
        );
    }
}


class _FactorsSection extends StatelessWidget {
    const _FactorsSection();

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                    Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Text(
                                "Factors :",
                                style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF282828),

                                ),
                            )
                    ),

                SizedBox(
                    height: 400,
                    child: PageView(
                        controller: PageController(viewportFraction: 0.92),
                        children: [
                
                            Padding(
                                padding: EdgeInsetsGeometry.fromLTRB(4,12,4,12), 
                                child : Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(24),
                                        boxShadow: [
                                            BoxShadow(
                                                color: const Color(0xFF70C2F8).withValues(alpha: 0.25),
                                                blurRadius: 8,
                                                spreadRadius: 4,
                                            ),
                                        ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                                
                                                Text(
                                                    "Rainfall",
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        color: Color(0xFF282828)
                                                    ),
                                                ),
                
                                                SizedBox(height: 8),
                
                                                Expanded(
                                                    child: Container(
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(12),
                                                            color: Colors.black12,
                                                        ),
                
                                                        // child: Text("graph",style: TextStyle(fontSize: 50,color: Colors.white),),
                                                    
                                                    ),
                                                )
                                            ],
                                        ),
                                    ),
                                ),
                            ),
                
                            Padding(
                                padding: EdgeInsetsGeometry.fromLTRB(4,12,4,12), 
                                child : Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(24),
                                        boxShadow: [
                                            BoxShadow(
                                                color: const Color(0xFF70C2F8).withValues(alpha: 0.25),
                                                blurRadius: 8,
                                                spreadRadius: 4,
                                            ),
                                        ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                                
                                                Text(
                                                    "Temperature",
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        color: Color(0xFF282828)
                                                    ),
                                                ),
                
                                                SizedBox(height: 8),
                
                                                Expanded(
                                                    child: Container(
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(12),
                                                            color: Colors.black12,
                                                        ),
                
                                                        // child: Text("graph",style: TextStyle(fontSize: 50,color: Colors.white),),
                                                    
                                                    ),
                                                )
                                            ],
                                        ),
                                    ),
                                ),
                            ),
                
                            Padding(
                                padding: EdgeInsetsGeometry.fromLTRB(4,12,4,12), 
                                child : Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(24),
                                        boxShadow: [
                                            BoxShadow(
                                                color: const Color(0xFF70C2F8).withValues(alpha: 0.25),
                                                blurRadius: 8,
                                                spreadRadius: 4,
                                            ),
                                        ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                                
                                                Text(
                                                    "Soil Index",
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        color: Color(0xFF282828)
                                                    ),
                                                ),
                
                                                SizedBox(height: 8),
                
                                                Expanded(
                                                    child: Container(
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(12),
                                                            color: Colors.black12,
                                                        ),
                
                                                        // child: Text("graph",style: TextStyle(fontSize: 50,color: Colors.white),),
                                                    
                                                    ),
                                                )
                                            ],
                                        ),
                                    ),
                                ),
                            ),
                
                            Padding(
                                padding: EdgeInsetsGeometry.fromLTRB(4,12,4,12), 
                                child : Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(24),
                                        boxShadow: [
                                            BoxShadow(
                                                color: const Color(0xFF70C2F8).withValues(alpha: 0.25),
                                                blurRadius: 8,
                                                spreadRadius: 4,
                                            ),
                                        ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                                
                                                Text(
                                                    "Irrigation",
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        color: Color(0xFF282828)
                                                    ),
                                                ),
                
                                                SizedBox(height: 8),
                
                                                Expanded(
                                                    child: Container(
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(12),
                                                            color: Colors.black12,
                                                        ),
                
                                                        // child: Text("graph",style: TextStyle(fontSize: 50,color: Colors.white),),
                                                    
                                                    ),
                                                )
                                            ],
                                        ),
                                    ),
                                ),
                            ),
                
                            Padding(
                                padding: EdgeInsetsGeometry.fromLTRB(4,12,4,12), 
                                child : Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(24),
                                        boxShadow: [
                                            BoxShadow(
                                                color: const Color(0xFF70C2F8).withValues(alpha: 0.25),
                                                blurRadius: 8,
                                                spreadRadius: 4,
                                            ),
                                        ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                                
                                                Text(
                                                    "Fertilizer",
                                                    style: TextStyle(
                                                        fontSize: 24,
                                                        color: Color(0xFF282828)
                                                    ),
                                                ),
                
                                                SizedBox(height: 8),
                
                                                Expanded(
                                                    child: Container(
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(12),
                                                            color: Colors.black12,
                                                        ),
                                                        
                                                        // child: Text("graph",style: TextStyle(fontSize: 50,color: Colors.white),),
                                                    
                                                    ),
                                                )
                                            ],
                                        ),
                                    ),
                                ),
                            ),
                
                        ],
                    ),
                ),
              ],
            ),
        );
    }
}


class _YieldSection extends StatelessWidget {
    const _YieldSection();

    @override
    Widget build(BuildContext context) {
        return  SizedBox(
            // height: 380,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                    Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 4),
                        child: Text(
                            "Yield :",
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF282828),
                            ),
                        )
                    ),

                    Container(
                        padding: EdgeInsetsGeometry.fromLTRB(20,4,20,0),
                        child: Container(
                            height: 324,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                                    boxShadow: [
                                        BoxShadow(
                                            color: const Color(0xFF70C2F8).withValues(alpha: 0.25),
                                            blurRadius: 8,
                                            spreadRadius: 4,
                                        ),
                                    ],
                                ),
                            ),
                        ),

                ],
            ),

        );
    }
}


class _InsightSection extends StatelessWidget {
    const _InsightSection();

    @override
    Widget build(BuildContext context) {
        return SizedBox(
            // height: 380,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                    Padding(
                        padding: const EdgeInsets.fromLTRB(20, 28, 20, 4),
                        child: Text(
                            "Insights :",
                                style: TextStyle(
                                    fontSize: 28,
                                    height: 1,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF282828),
                                ),
                        )
                    ),

                    Padding(
                        padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
                        child: Text(
                                "In past the factors change with time due to multiple environmental reasons. Which affect the yield of the crop. Each factor has its own impact on the yield.\nHere is a distribution of how much each factor affected the yield.",
                                style: TextStyle(
                                    fontSize: 18,
                                    height: 1.2,
                                    fontWeight: FontWeight.w400,  
                                ),
                            ),
                    ),

                    Container(
                        padding: EdgeInsetsGeometry.fromLTRB(20,4,20,0),
                        child: Container(
                            height: 324,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                                    boxShadow: [
                                        BoxShadow(
                                            color: const Color(0xFF70C2F8).withValues(alpha: 0.25),
                                            blurRadius: 8,
                                            spreadRadius: 4,
                                        ),
                                    ],
                                ),
                            ),
                        ),

                ],
            ),

        );
    }
}


class _SimulationSection extends StatelessWidget {
    const _SimulationSection();

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: const EdgeInsets.fromLTRB(0,20,0,0),
            child: Container(
                // height: 180,

                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                    ),
                    boxShadow: [
                        BoxShadow(
                            color: const Color(0xFF70C2F8).withValues(alpha: 0.25),
                            blurRadius: 8,
                            spreadRadius: 8,
                        ),
                    ],
                ),

                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                        Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
                            child: Text(
                                "Simulate :",
                                    style: TextStyle(
                                        fontSize: 28,
                                        height: 1,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF282828),
                                    ),
                            )
                        ),

                        Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Text(
                                    "Studying the past we can assume the future trends if the factors stay same or differ with time.",
                                    style: TextStyle(
                                        fontSize: 16,
                                        // height: 1.2,
                                        fontWeight: FontWeight.w400,  
                                    ),
                                ),
                        ),

                        Padding(
                            padding: const EdgeInsets.fromLTRB(16,12,16,16),
                            child: ElevatedButton(onPressed: () {
                                HapticFeedback.selectionClick();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SimulatePage(),
                                    ),
                                );
                            }, 

                                style: ElevatedButton.styleFrom(
                                    shadowColor: const Color(0xFF70C2F8).withValues(alpha: 0.5), 
                                ),
                                child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        boxShadow: [
                                            BoxShadow(
                                                color: const Color(0xFF70C2F8).withValues(alpha: 0.5),
                                                blurRadius: 8,
                                                spreadRadius: 8,
                                            ),
                                        ],
                                    ),
                                    child: Center(
                                        child: Padding(
                                            padding: const EdgeInsets.fromLTRB(10,4,10,4),
                                            child: Text(
                                                "Simulate",
                                                style: TextStyle(fontSize: 18),
                                            ),
                                        ),
                                    ),          
                                ),
                            )
                        ),
                    ],
                ),

            ),
        );
    }
}