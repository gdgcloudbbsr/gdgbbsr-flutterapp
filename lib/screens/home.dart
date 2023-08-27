import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:gdgbbsr/providers/api_calls.dart';
import 'package:gdgbbsr/screens/app_drawer.dart';
import 'package:gdgbbsr/widgets/maintainance.dart';
import 'package:google_fonts/google_fonts.dart';
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
            return const Maintainance();
          } else {
            return SafeArea(
              bottom: false,
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse(widget.pageLink),
                  headers: {
                    'User-Agent':
                        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36',
                    'Accept-Language': 'en-US,en;q=0.9,fr;q=0.8,de;q=0.7',
                    'Referer': 'https://www.example.com/page1.html',
                    'Cookie': 'session_id=abc123; user_pref=dark_mode',
                    'Cache-Control': 'max-age=3600, private, must-revalidate',
                    'Origin': 'https://www.swoyam.enginner',
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
