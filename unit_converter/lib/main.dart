import 'package:flutter/material.dart';
import 'package:unit_converter/pages/category_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: CategoryScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


