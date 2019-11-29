import 'dart:convert';

import 'package:fast_flutter_study/common/Global.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BlogContent extends StatefulWidget {
  @override
  _BlogContentState createState() => _BlogContentState();
}

class _BlogContentState extends State<BlogContent> {
  WebViewController _controller;
  WebView webView;

  @override
  Widget build(BuildContext context) {
    if (webView == null) {
      webView = WebView(
        debuggingEnabled: true,
//        initialUrl: Global.postUrl,
        initialUrl: "about:blank",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
          _loadHtmlData();
        },
        onPageFinished: (String url) => {},
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: webView),
    );
  }

  _loadHtmlData() {
    _controller.loadUrl(Uri.dataFromString(Global.postContent,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
//    setState(() {});
  }
}
