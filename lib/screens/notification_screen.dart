import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/api_calls.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.grey[900],
        foregroundColor: Colors.white,
        title: const Text("Notifications"),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: FutureBuilder(
            future: GdgApi.getAllNotifications(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.grey[900],
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  ),
                );
              } else {
                return Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.grey[900],
                  child: ListView.builder(
                    itemCount: snapshot.data?['data'].length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(
                          Icons.event,
                          color: Colors.white,
                        ),
                        title: Text(
                          snapshot.data?["data"][index]["title"],
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data?["data"][index]["description"],
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                          maxLines: 2,
                        ),
                        onTap: () {},
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
