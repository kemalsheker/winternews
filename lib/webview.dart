import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';



class WebView extends StatelessWidget {
  const WebView({Key? key}) : super(key: key);

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
      body: const Center(
        child: Text('WebView Page!')
      ),
    );
  }


}