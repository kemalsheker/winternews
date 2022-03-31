import 'package:flutter/material.dart';
import 'package:xml/xml.dart';


class NewsItem{
  late final String title;
  late final String link;
  late final String pubDate;
  late final String pubName;


  NewsItem(this.title, this.link, this.pubDate, this.pubName);

  String get getTitle {
    return title;
  }

  String get getLink{
    return link;
  }

  String get getPubDate{
    return pubDate;
  }

  String get getPubName{
    return pubName;
  }


}