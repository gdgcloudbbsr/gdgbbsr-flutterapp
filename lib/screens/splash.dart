import 'package:flutter/material.dart';
import 'package:gdgbbsr/screens/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //make a function that will wait for 2 seconds and then navigate to home page
  void _navigateToHome(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      },
    );
  }

  @override
  void initState() {
    _navigateToHome(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text(
          'GDG Bhubaneswar',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
