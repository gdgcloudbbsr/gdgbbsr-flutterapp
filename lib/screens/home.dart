import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  final String pageName;
  final String pageTitle;
  final String pageLink;
  const HomePage(
      {required this.pageName,
      required this.pageTitle,
      required this.pageLink,
      super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(widget.pageName),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        bottom: false,
        child: WebView(
          initialUrl: widget.pageLink,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
