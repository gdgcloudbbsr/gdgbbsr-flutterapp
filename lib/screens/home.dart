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
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
