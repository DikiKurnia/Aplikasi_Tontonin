import 'package:flutter/material.dart';
import 'data.dart';
import 'home_screen.dart';

void main() => runApp(const TonToninApp());

class TonToninApp extends StatelessWidget {
  const TonToninApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TonTonin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: kBg,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kMag,
          brightness: Brightness.dark,
        ).copyWith(primary: kMag),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: kMag,
            foregroundColor: Colors.white,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
