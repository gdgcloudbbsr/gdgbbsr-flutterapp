import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
      ),
      body: SafeArea(
        bottom: false,
        child: WebView(
          initialUrl: 'https://gdg-test.netlify.app/',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
