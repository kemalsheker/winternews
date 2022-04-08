
import 'package:winternews/newsItem.dart';
import 'package:intl/intl.dart';


Future<void> sort_pubDate(List<NewsItem> data) async{
  data.sort((a, b) => dateSortComparison(a, b));
}


int dateSortComparison(NewsItem a, NewsItem b) {
  final propertyA = DateFormat('dd MMM yyyy').parse(a.pubDate);
  final propertyB = DateFormat('dd MMM yyyy').parse(b.pubDate);
  return -propertyA.compareTo(propertyB);
}
