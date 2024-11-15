import 'package:app_dogs/presentation/pages/PessoaPages/homePage.dart';
import 'package:flutter/material.dart';

class SprashScreen extends StatefulWidget {
  const SprashScreen({super.key});

  @override
  State<SprashScreen> createState() => _SprashScreenState();
}

class _SprashScreenState extends State<SprashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.pets,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'Gestão de Pets e Clientes',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
