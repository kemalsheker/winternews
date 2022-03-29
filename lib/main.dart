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
    return GridView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300, childAspectRatio: 1 , crossAxisSpacing: 20, mainAxisSpacing: 20),
        itemBuilder: (BuildContext ctx, index) {
                      return InkWell(
                          child: Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                const Text('News Title with gfbhgbndifferent word that contains', style: TextStyle(fontSize: 24.0)),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const <Widget>[
                                    Text('News Source'),
                                    Text('News Date')
                                  ],
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Colors.cyanAccent,
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ),
                          onTap: () {
                            print('This is tapped: $index');
                          },
                      );
        }
    );
  }
}
