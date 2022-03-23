import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Winter Sport News',
        home: Scaffold(
            appBar: AppBar(
              title: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:const [
                    Text('Winter Sport News', style: TextStyle(fontSize: 28.0)),
                    Text('Your news feed for winter', style: TextStyle(fontSize: 12.0))
                  ]
              ),
              actions: [
                Image.asset('images/snowflake.png')
              ],
            ),
            body: MyGridView(//TO DO IMPLEMENT GRID WITH PARSING DATA)
          )
        )
    );
  }
}

class MyGridView extends StatelessWidget {
  const MyGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
