import 'package:flutter/material.dart';
import 'package:gdgbbsr/screens/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //make a function that will wait for 2 seconds and then navigate to home page
  void _navigateToHome(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(
              pageLink: "https://gdg-test.netlify.app",
              pageName: "GDG Home",
              pageTitle: "GDG Bhubaneswar",
            ),
          ),
        );
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
      body: Container(
        color: Colors.grey[900],
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                'lib/assets/gdg_logo.json',
                height: 200,
              ),
              Text.rich(
                TextSpan(
                    text: "G",
                    style: GoogleFonts.poppins(
                      color: Colors.green,
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: "D",
                        style: GoogleFonts.poppins(
                          color: Colors.yellow,
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: "G",
                        style: GoogleFonts.poppins(
                          color: Colors.red,
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: " Bhubaneswar",
                        style: GoogleFonts.poppins(
                          color: Colors.blue[400],
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
