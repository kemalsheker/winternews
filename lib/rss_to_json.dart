
import 'dart:convert';

import 'package:xml2json/xml2json.dart';
import 'package:http/http.dart' as http;


Future<List> rssToJson(String newsUrl) async{

  var client = http.Client();
  final myTransformer = Xml2Json();
  var response = await client.get(Uri.parse(newsUrl));
  myTransformer.parse(response.body);
  var json = myTransformer.toGData();
  var result = jsonDecode(json)['rss']['channel']['item'];
  client.close();
  if (result is! List<dynamic>) {
    return [result];
  }
  return result;

}