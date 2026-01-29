import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/workout_provider.dart';
import '../home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    // Esperamos a que el provider termine de cargar los datos
    final provider = Provider.of<WorkoutProvider>(context, listen: false);

    // Mientras isLoading sea true, esperamos un poco
    while (provider.isLoading) {
      await Future.delayed(const Duration(milliseconds: 500));
    }

    // Una vez listo, vamos a la HomeScreen sin vuelta atrás
    if (mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // La imagen que generamos de fondo
          Image.asset(
            'assets/splash_bg.png',
            fit: BoxFit.cover,
          ),
          // Capa oscura para que el texto se lea bien
          Container(color: Colors.black45),
          // Elementos de carga
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Indicador de carga animado de Flutter
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                strokeWidth: 6,
              ),
              SizedBox(height: 30),
              Text(
                "CARGANDO RUTINA...",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 50), // Espacio al fondo
            ],
          ),
        ],
      ),
    );
  }
}
