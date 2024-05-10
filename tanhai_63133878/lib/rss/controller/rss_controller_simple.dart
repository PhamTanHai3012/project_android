import 'package:get/get.dart';
import 'package:tanhai_63133878/rss/model/rss_item_template.dart';
import 'package:tanhai_63133878/rss/model/rss_resource.dart';
import 'dart:convert';
import 'package:xml2json/xml2json.dart';
import 'package:http/http.dart' as http;

class SimpleControllerRss extends GetxController{
  List<RssResource> _resource = rssResource;
  RssResource _current = rssResource[0];
  String? rssUrl;
  String? _resourceHeader;
  var _rssList = <RSSItem>[];

  List<RSSItem> get rssList => _rssList;
  String get resourceName => _current.name;
  String? get resourceHeader => _resourceHeader;
  List<String> get headerResources => _current.resourceHeaders.keys.toList();

  static SimpleControllerRss get instance => Get.find<SimpleControllerRss>();

  @override
  void onInit(){
    // TODO: implement onInit
    super.onInit();
    if(rssUrl == null) rssUrl = _current.resourceHeaders.values.toList()[0];
    if(_resourceHeader == null) _resourceHeader = _current.resourceHeaders.keys.toList()[0];
    _setRegrex();
  }

  @override
  void onReady(){
    super.onReady();
    readRss();
  }

  Future<void> readRss() async{
    _fetchRSS(rssUrl!).then((value){
      _rssList = value?.map((rssMap) => RSSItem.empty().getFromJson(rssMap)).toList()?? [];
      print(rssList[0].link);
      update(["listRss"]);
    }).catchError((error){
      print(error);
    });
  }

  void _setRegrex(){
    RSSItem.startDescriptionRegrex = _current.startDescriptionRegrex;
    RSSItem.endDescriptionRegrex = _current.endDescriptionRegrex;
    RSSItem.startImageRegrex = _current.startImageRegrex;
    RSSItem.endImageRegrex = _current.endImageRegrex;
  }

  Future<List<dynamic>?> _fetchRSS(String rssURL) async{
    final response = await http.get(Uri.parse(rssURL));
    if(response.statusCode == 200){
      final xml2Json = Xml2Json();
      xml2Json.parse(utf8.decode(response.bodyBytes));
      String rssJson = xml2Json.toParker();
      //
      Map<String, dynamic> jsonData = jsonDecode(rssJson);
      return (jsonData["rss"]["channel"]["item"]);
    }
    return Future.error("Lỗi đọc Rss");
  }
}

class RssBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(SimpleControllerRss());
  }
}

