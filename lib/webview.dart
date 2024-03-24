import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class MyWebView extends StatefulWidget {
  const MyWebView({super.key});

  @override
  State<MyWebView> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  final cotroller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse("https://souqusham.com/"));
  @override
  Widget build(BuildContext context) {
    return Container(child: WebViewWidget(
      controller: cotroller,
    ));
  }
}
