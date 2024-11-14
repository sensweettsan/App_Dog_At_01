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
    await Future.delayed(const Duration(seconds: 4));

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
      body: Center(),
    );
  }
}
