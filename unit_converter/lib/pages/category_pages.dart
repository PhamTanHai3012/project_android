import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:unit_converter/models/unit.dart';
import 'package:unit_converter/models/ApiService.dart';
import 'package:unit_converter/controller/category.dart';

final _backgroundColor = Colors.deepOrange[100];

class CategoryScreen extends StatefulWidget {
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int index = 0;
  List<Category> categories = [];
  static const _icons = {
    'Độ dài': 'assets/icons/length.png',
    'Diện tích': 'assets/icons/area.png',
    'Thể tích': 'assets/icons/volume.png',
    'Khối lượng': 'assets/icons/mass.png',
    'Thời gian': 'assets/icons/time.png',
    'Lưu trữ kỹ thuật số': 'assets/icons/digital_storage.png',
    'Năng lượng': 'assets/icons/power.png',
    'Âm thanh': 'assets/icons/sound.png',
    'Tiền tệ': 'assets/icons/currency.png',
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    if (categories.isEmpty) {
      await _retrieveLocalCategories();
      await _retrieveApiCategory();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        backgroundColor: _backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Chuyển đổi đơn vị",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
      body: _buildBody(context, index),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.grey),
              activeIcon: Icon(Icons.home, color: Colors.deepOrange[200]),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.heart_broken, color: Colors.grey),
              activeIcon: Icon(Icons.heart_broken, color: Colors.deepOrange[200]),
              label: "Yêu thích",
            ),
          ],
          onTap:(value) {
            setState(() {
              index = value;
            });
          },
      ),
    );
  }

  _buildBody(BuildContext context, int index){
    switch (index){
      case 0: return pageHome(context);
      case 1: return pageLike(context);
    }
  }

  pageHome(BuildContext context){
    return categories.isEmpty ?
    Center(child: CircularProgressIndicator()) : _buildCategoryWidgets(categories);
  }

  pageLike(BuildContext context){
    List<Category> cate = categories;
    cate.sort((a, b) => b.Used.compareTo(a.Used));
    List<Category> top5 = [];
    for (var i = 0; i < 3; i++) {
      top5.add(cate[i]);
    }
    for (var category in top5) {
      print('${category.name}: ${category.Used}');
    }
    return cate.isEmpty ?
    Center(child: CircularProgressIndicator()) : _buildCategoryWidgets(cate);
  }

  Future<void> _retrieveLocalCategories() async {
    final json = DefaultAssetBundle.of(context).loadString('assets/data/regular_units.json');
    final data = JsonDecoder().convert(await json);
    if (data is! Map) {
      throw ('Data lấy từ API không phải Map');
    }
    data.keys.forEach((key) {
      final List<Unit> units =
      data[key].map<Unit>((dynamic data) => Unit.fromJson(data)).toList();

      var category = Category(
        name: key,
        icon: _icons[key]!,
        units: units,
        Used: 0,
      );
      setState(() {
        categories.add(category);
      });
    });
  }

  // Lấy đơn vị tiền tệ (Category) từ web và các kiểu tiền tệ (Unit) chuyển đổi
  Future<void> _retrieveApiCategory() async {
    setState(() {
      categories.add(Category(
        name: apiCategory['name']!,
        icon: _icons['Tiền tệ']!,
        units: [],
        Used: 0,
      ));
    });
    final api = ApiService();
    final jsonUnits = await api.getUnits();
    if (jsonUnits != null) {
      final units = <Unit>[];
      for (var unit in jsonUnits) {
        units.add(Unit.fromJson(unit));
      }
      setState(() {
        categories.removeLast();
        categories.add(Category(
          name: apiCategory['name']!,
          icon: _icons['Tiền tệ']!,
          units: units,
          Used: 0,
        ));
      });
    }
  }

  Widget _buildCategoryWidgets(List<Category> categories) {
    return ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return categories[index];
        }
    );
  }
}