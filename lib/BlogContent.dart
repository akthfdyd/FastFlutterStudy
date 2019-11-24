import 'package:fast_flutter_study/common/Global.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BlogContent extends StatefulWidget {
  @override
  _BlogContentState createState() => _BlogContentState();
}

class _BlogContentState extends State<BlogContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WebView(
        initialUrl: Global.postUrl,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
