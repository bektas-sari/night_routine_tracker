import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const NightRoutineApp());
}

class NightRoutineApp extends StatelessWidget {
  const NightRoutineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Night Routine Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        // remove toggleableActiveColor
        // add SwitchTheme for your SwitchListTile:
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all(Colors.tealAccent),
          trackColor: MaterialStateProperty.all(Colors.tealAccent.withOpacity(0.5)),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1F1F1F),
          elevation: 2,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
