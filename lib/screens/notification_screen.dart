import 'package:flutter/material.dart';

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
      body: const Center(
        child: Text(
          'Notifications',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
