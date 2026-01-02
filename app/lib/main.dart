import 'package:app/pages/uploadpage.dart';
import 'package:flutter/material.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                useMaterial3: true,
                brightness: Brightness.light,
/// ---- CORE COLORS ----
                scaffoldBackgroundColor: const Color(0xFFFFFFFF),
                primaryColor: const Color(0xFF4CB7FF),

                colorScheme: const ColorScheme.light(
                    primary: Color(0xFF4CB7FF),
                    secondary: Color(0xFF4CB7FF),
                    surface: Color(0xFFFFFFFF),
                    // background: Color(0xFFFFFFFF),
                    onPrimary: Colors.white,
                    onSecondary: Colors.white,
                    onSurface: Color(0xFF1C1C1C),
                ),

/// ---- APP BAR ----
                appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    centerTitle: false,
                    surfaceTintColor: Colors.transparent,
                    titleTextStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1C1C1C),
                    ),
                    iconTheme: IconThemeData(
                        color: Color(0xFF4CB7FF),
                        size: 22,
                    ),
                ),

/// ---- TEXT ----
                textTheme: const TextTheme(
                    titleLarge: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1C1C1C),
                    ),
                    titleMedium: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1C1C1C),
                    ),
                    bodyLarge: TextStyle(
                        fontSize: 15,
                        height: 1.5,
                        color: Color(0xFF2E2E2E),
                    ),
                    bodyMedium: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF6E6E6E),
                    ),
                    labelLarge: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF4CB7FF),
                    ),
                ),
                

/// ---- ICONS ----
                iconTheme: const IconThemeData(
                    color: Color(0xFF4CB7FF),
                    size: 22,
                ),

/// ---- CARDS (graphs, factor boxes) ----
                cardTheme: const CardThemeData(
                    color: Colors.white,
                    elevation: 6,

                    // 15% opacity of #4CB7FF
                    shadowColor: Color(0x264CB7FF),

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                ),

/// ---- BUTTONS ----
                elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4CB7FF),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                        ),
                    ),
                ),

/// ---- TEXT BUTTONS (links like GitHub / Notebook) ----
                textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFF4CB7FF),
                        textStyle: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                        ),
                    ),
                ),

/// ---- INPUT FIELDS ----
                inputDecorationTheme: InputDecorationTheme(
                    filled: true,
                    fillColor: const Color(0xFFF4F7FA),
                    contentPadding : const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                    ),
                    hintStyle: const TextStyle(
                        color: Color(0xFF9AA3AD),
                        fontSize: 13,
                    ),
                ),

/// ---- SLIDERS (Simulation page) ----
                sliderTheme: const SliderThemeData(
                    activeTrackColor: Color(0xFF4CB7FF),
                    inactiveTrackColor: Color(0x404CB7FF),
                    thumbColor: Color(0xFF4CB7FF),
                    overlayColor: Color(0x1F4CB7FF),
                    trackHeight: 4,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
                ),

/// ---- PAGE TRANSITIONS ----
                pageTransitionsTheme: const PageTransitionsTheme(
                    builders: {
                        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                    },
                ),

                visualDensity: VisualDensity.standard,
            ),

            home: const UploadPage(),

        );
    }
}