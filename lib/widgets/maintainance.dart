import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Maintainance extends StatefulWidget {
  const Maintainance({super.key});

  @override
  State<Maintainance> createState() => _MaintainanceState();
}

class _MaintainanceState extends State<Maintainance> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
              bottom: false,
              child: Container(
                color: Colors.grey[900],
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Lottie.asset(
                        "lib/assets/gdg_logo.json",
                        height: 200,
                        width: double.infinity,
                      ),
                      Text.rich(
                        TextSpan(
                          text: "GDG",
                          style: GoogleFonts.poppins(
                            color: Colors.yellow,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                          children: [
                            TextSpan(
                              text: " Bhubaneswar",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "App is under maintainance",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          text: "We will be back",
                          style: GoogleFonts.poppins(
                            color: Colors.blue[300],
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                          children: [
                            TextSpan(
                              text: " Soon!!",
                              style: GoogleFonts.poppins(
                                color: Colors.green,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
  }
}