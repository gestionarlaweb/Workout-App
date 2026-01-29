import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_app/presentation/screens/splash_screen.dart';
import 'providers/workout_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WorkoutProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blueGrey, useMaterial3: true),
        // CAMBIO AQUÍ:
        home: const SplashScreen(),
      ),
    ),
  );
}
