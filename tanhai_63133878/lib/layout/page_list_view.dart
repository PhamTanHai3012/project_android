import 'dart:math';

import 'package:flutter/material.dart';

List<String> sps = [
  "Chuối", "Lê", "Bưởi", "Cam", "Quýt", "Táo", "Ổi", "Me",
  "Lựu", "Xoài", "Bơ", "Đu đủ", "Măng cụt", "Dừa", "Sầu riêng"
];

class PageListView extends StatelessWidget {
  const PageListView ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My List View"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
            leading: Icon(Icons.add_shopping_cart_outlined, color: Colors.red,),
            title: Text("${sps[index]}",style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
            subtitle: Text("Trái cây Việt Gap"),
            trailing: Text("${Random().nextInt(100)}.000 VND"),
          ),
          separatorBuilder: (context, index) => Divider(thickness: 1.5,),
          itemCount: sps.length,
      ),
    );
  }
}


