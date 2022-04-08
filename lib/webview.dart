import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class MyWebView extends StatefulWidget {

  final String selectedUrl;


  final Completer<WebViewController> _controller = Completer<
      WebViewController>();


  MyWebView({Key? key,
    required this.selectedUrl,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
        Text('Winter Sport News', style: TextStyle(fontSize: 28.0)),
    Text('Your news feed for winter',
    style: TextStyle(fontSize: 12.0))
    ]),
    actions: [Image.asset('images/snowflake.png')],
    ),
    body: Stack(children: <Widget>[
        WebView(
          initialUrl: widget.selectedUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (webViewController) {
          widget._controller.complete(webViewController);
          },
          onPageStarted: (started){
            setState(() {
              isLoading = false;
            });
          },
        ),
        isLoading ? const Center( child: CircularProgressIndicator(),)
          : Stack(),
        ]
      )
    );
  }

}

