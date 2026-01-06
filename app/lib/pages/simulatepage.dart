import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';


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
                                        "From the Data Report we knows that Yield depends on the factors. \nAnd in future the Yield trend will depend on the trends of the factors and other environmental conditions.",
                                        style: TextStyle(
                                            fontSize: 15,
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
        return Padding(
            padding: EdgeInsets.all(20),
            child: Container(
                // height: ,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                        BoxShadow(
                            color: const Color.fromARGB(36, 59, 163, 248),
                            blurRadius: 12,
                            spreadRadius: 4
                        )
                    ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16,16,16,16),
                  child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Expanded(
                                
                                child: Text(
                                    "<file>",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFF282828).withValues(alpha: 0.75) ,
                                    ),
                                    maxLines: 1,
                                ),
                            ),
                            Icon(
                                Icons.attach_file_rounded,
                                color: Colors.black45,
                            )
                        ],
                    ),
                ),
            ),
        );
    }
}

class _BaselineSection extends StatelessWidget {
    const _BaselineSection();

    @override
    Widget build(BuildContext context) {
        return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(22, 8, 22, 4),
                        child: Text(
                            "Baseline Future :",
                                style: TextStyle(
                                    fontSize: 28,
                                    height: 1,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF282828),
                                ),
                        )
                    ),

                    Padding(
                        padding: const EdgeInsets.fromLTRB(22, 4, 22, 12),
                        child: Text(
                                "The future where no factor changes and the trends continues.",
                                style: TextStyle(
                                    fontSize: 18,
                                    height: 1.2,
                                    fontWeight: FontWeight.w400,  
                                ),
                            ),
                    ),

                    Container(
                        padding: EdgeInsets.fromLTRB(22,4,22,8),
                        child: Container(
                            height: 304,
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
            // ),
        );
    }
}

class _ScenarioSection extends StatefulWidget {
    const _ScenarioSection();

    @override
    State<_ScenarioSection> createState() => _ScenarioSectionState();
}

class _ScenarioSectionState extends State<_ScenarioSection> {
    double rainfall = 0;
    double temperature = 0;
    double soil = 0;
    double irrigation = 0;
    double fertilizer = 0;

    // const _ScenarioSection();

    @override
    Widget build(BuildContext context) {
        return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(22, 24, 22, 4),
                        child: Text(
                            "Scenario Based Future :",
                                style: TextStyle(
                                    fontSize: 28,
                                    height: 1,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF282828),
                                ),
                        )
                    ),

                    Padding(
                        padding: const EdgeInsets.fromLTRB(22, 4, 22, 12),
                        child: Text(
                                "The future where we can change the environmental factors. Potentially changing the Yield trend.",
                                style: TextStyle(
                                    fontSize: 18,
                                    height: 1.2,
                                    fontWeight: FontWeight.w400,  
                                ),
                            ),
                    ),

                    Container(
                        padding: EdgeInsetsGeometry.fromLTRB(22,4,22,16),
                        child: Container(
                            height: 304,
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

                    Column(
                      children: [

                                _factorSlider(
                                    label: "Rainfall",
                                    value: rainfall,
                                    min: -10,
                                    max: 10,
                                    onChanged: (v) => setState(() => rainfall = v),
                                ),

                                _factorSlider(
                                    label: "Temperature",
                                    value: temperature,
                                    min: -10,
                                    max: 10,
                                    unit: "%",
                                    onChanged: (v) => setState(() => temperature = v),
                                ),
                                
                            ],
                        ),
                                
                                _factorSlider(
                                    label: "Soil Index",
                                    value: soil,
                                    min: -10,
                                    max: 10,
                                    onChanged: (v) => setState(() => soil = v),
                                ),



                                _factorSlider(
                                    label: "Irrigation",
                                    value: irrigation,
                                    min: -10,
                                    max: 10,
                                    onChanged: (v) => setState(() => irrigation = v),
                                ),

                                _factorSlider(
                                    label: "Fertilizer",
                                    value: fertilizer,
                                    min: -10,
                                    max: 10,
                                    onChanged: (v) => setState(() => fertilizer = v),
                                ),

                    Padding(
                        padding: const EdgeInsets.fromLTRB(22, 14, 22, 12),
                        child: Text(
                                "The change in yield by changing the factors says that future is in our control. just if we can work to change these environmental factors.",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 20,
                                    height: 1.2,
                                    fontWeight: FontWeight.w400,  
                                ),
                            ),
                    ),

                ],
            // ),
        );
    }
}

Widget _factorSlider({
    required String label,
    required double value,
    required double min,
    required double max,
    required ValueChanged<double> onChanged,
    String unit = "%",}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20,0,10,0),
      child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Text(
                      "$label (${value.toStringAsFixed(1)}$unit)",
                      style: TextStyle(
                          height: 1,
                          fontSize: 18,
                          color: Colors.black87,
                      ),
                  ),
                  Slider(
                      value: value,
                      min: min,
                      max: max,
                      divisions: 10,
                      onChanged: onChanged,
                  ),
              ],
      ),
    );
}


class _FollowUpSection extends StatelessWidget {
    const _FollowUpSection();

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
                                "Follow Up Links :",
                                    style: TextStyle(
                                        fontSize: 20,
                                        height: 1,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF282828),
                                    ),
                            )
                        ),

                        Row(
                            children: [

                                Expanded(
                                    child: Padding(
                                        padding: const EdgeInsets.fromLTRB(12,8,6,12),
                                        child: ElevatedButton(onPressed: () async {
                                            HapticFeedback.selectionClick();
                                            final Uri uri = Uri.parse(
                                                'https://github.com/Abhinav08bhatt/AgriTrend_simulation',
                                            );
                                            await launchUrl(
                                                uri,
                                                mode: LaunchMode.externalApplication,
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
                                                            "Github Repo",
                                                            style: TextStyle(fontSize: 18),
                                                        ),
                                                    ),
                                                ),          
                                            ),
                                        )
                                    ),
                                ),

                                Expanded(
                                  child: Padding(
                                        padding: const EdgeInsets.fromLTRB(6,8,12,12),
                                        child: ElevatedButton(onPressed: () async {
                                            HapticFeedback.selectionClick();
                                            final Uri uri = Uri.parse(
                                                'https://github.com/Abhinav08bhatt/AgriTrend_simulation/blob/main/notebooks/documentation_code.ipynb',
                                            );
                                            await launchUrl(
                                                uri,
                                                mode: LaunchMode.externalApplication,
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
                                                            "Notebook",
                                                            style: TextStyle(fontSize: 18),
                                                        ),
                                                    ),
                                                ),          
                                            ),
                                        )
                                    ),
                                ),

                            ],
                        ),
                    ],
                ),

            ),
        );
    }
}
