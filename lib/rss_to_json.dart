
import 'dart:convert';

import 'package:winternews/newsItem.dart';
import 'package:xml2json/xml2json.dart';
import 'package:http/http.dart' as http;


Future<List<NewsItem>> rssToJson(String newsUrl, String publisher) async{

  var client = http.Client();
  final myTransformer = Xml2Json();
  var response = await client.get(Uri.parse(newsUrl));
  myTransformer.parse(response.body);
  var json = myTransformer.toParker();
  var  result = jsonDecode(json)['rss']['channel']['item'] as List;
  List<NewsItem> newItemList = result.map((e) => NewsItem.fromJson(e, publisher)).toList();
  client.close();
  return newItemList;

}