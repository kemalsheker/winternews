import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:winternews/newsItem.dart';
import 'package:winternews/rss_to_json.dart';
import 'package:winternews/sort_pubDate.dart';
import 'package:winternews/webview.dart';
import 'package:xml/xml.dart';
import 'package:shimmer/shimmer.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
            backgroundColor: Colors.cyanAccent,
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
            body: const MyGridView()
        )
    );
  }
}

class MyGridView extends StatefulWidget {
  const MyGridView({Key? key}) : super(key: key);



  @override
  State<StatefulWidget> createState() => _MyGridViewState();

}

class _MyGridViewState extends State<MyGridView> {

  List<NewsItem> newsData = [];
  bool isLoading = true;


  void _addNewsToList(List news){
    for(NewsItem i in news){
      newsData.add(i);
    }
  }


  getData() async{
    Future.wait([
      rssToJson('https://thesnowmag.com/feed/', 'The Snow Mag'),
      rssToJson('https://www.inthesnow.com/feed/', 'InTheSnow'),
      rssToJson('http://freeskier.com/feed', 'Freeskier'),
      rssToJson('https://www.foxsports.com.au/content-feeds/winter-olympics/', 'Fox Sports'),
      rssToJson('https://www.fis-ski.com/api/rss/all/tag/Newsflash/en', 'FIS Ski'),
      rssToJson('https://etusuora.com/rss/en/rss_winter_sports.xml', 'ETUSUORA'),
      rssToJson('https://www.snowboarder.com/feed/', 'Snowboarder'),
      rssToJson('http://www.agnarchy.com/feed/', 'Agnarchy'),
      rssToJson('https://planetski.eu/feed/', 'PlanetSKI')
    ]).then((value) {
      _addNewsToList(value[0]);
      _addNewsToList(value[1]);
      _addNewsToList(value[2]);
      _addNewsToList(value[3]);
      _addNewsToList(value[4]);
      _addNewsToList(value[5]);
      _addNewsToList(value[6]);
      _addNewsToList(value[7]);
      _addNewsToList(value[8]);

      sort_pubDate(newsData);
      setState(() {
        isLoading = false;
      });
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    if(isLoading){
      return  Container(
        alignment: Alignment.center,
        width: 600.0,
        height: 600.0,
        child: Shimmer.fromColors(
          baseColor: Colors.indigo,
          highlightColor: Colors.white,
          child: Image.asset('images/snowflake.png', fit: BoxFit.fill)
        ),
      );
    }
    else{
      return GridView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: newsData.length,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemBuilder: (BuildContext ctx, index) {
            return Ink(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          AutoSizeText(
                              newsData[index].getTitle,
                              style:  const TextStyle(fontSize: 24.0),
                              maxLines: 5 ,),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(newsData[index].pubName),
                              Text(newsData[index].pubDate)
                            ],
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  MyWebView(
                                    selectedUrl: newsData[index].link,
                                  )
                          )
                      );
                    }
                )
            );
          });
    }

  }
}




