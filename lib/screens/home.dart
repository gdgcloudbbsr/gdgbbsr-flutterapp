import 'package:flutter/material.dart';
import 'package:gdgbbsr/providers/api_calls.dart';
import 'package:gdgbbsr/screens/app_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'notification_screen.dart';

class HomePage extends StatefulWidget {
  final String pageName;
  final String pageTitle;
  final String pageLink;
  const HomePage({
    required this.pageName,
    required this.pageTitle,
    required this.pageLink,
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          widget.pageTitle,
          style: GoogleFonts.poppins(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationScreen(),
                ),
              );
            },
            icon: const Icon(
              Icons.notifications_active_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: GdgApi.checkBackendStatus(),
        builder: (context, snapshot) {
          if (snapshot.data?["backend_status"] != "working") {
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
          } else {
            return SafeArea(
              bottom: false,
              child: WebView(
                initialUrl: widget.pageLink,
                javascriptMode: JavascriptMode.unrestricted,
              ),
            );
          }
        },
      ),
    );
  }
}
