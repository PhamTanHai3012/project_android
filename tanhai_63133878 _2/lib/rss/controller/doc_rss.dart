import 'dart:convert';
import 'package:xml2json/xml2json.dart';
import 'package:http/http.dart' as http;

void main() async{
  String _rssURLVNExpress = "https://dantri.com.vn/rss/home.rss";
  final response = await http.get(Uri.parse(_rssURLVNExpress));
  if(response.statusCode == 200){
    //print(response.body);
    final xml2Json = Xml2Json();
    xml2Json.parse(utf8.decode(response.bodyBytes));
    String rssJson = xml2Json.toParker();
    //print(rssJson);
    Map<String, dynamic> jsonData = jsonDecode(rssJson);
    var testData = jsonData["rss"]["channel"]["item"][0];
    //print(testData)
    print(testData['title']);
    print(testData['link']);
    print(testData['description']);
    print(testData['pubdate']);
  }
}