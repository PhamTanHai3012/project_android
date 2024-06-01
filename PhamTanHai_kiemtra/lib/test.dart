import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Hello extends StatefulWidget {
  const Hello({super.key});

  @override
  State<Hello> createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chuyển trang"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: _buildBody(context, index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey),
            activeIcon: Icon(Icons.home, color: Colors.blue),
            label: "Hone",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dehaze, color: Colors.grey),
            activeIcon: Icon(Icons.dehaze, color: Colors.blue),
            label: "Chức năng",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.brightness_high, color: Colors.grey),
            activeIcon: Icon(Icons.brightness_high, color: Colors.blue),
            label: "Setting",
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
  
    pageHome(BuildContext context){
      return Container(
        child: Center(
          child: Text("Đây là PageHome"),
        ),
      );
    }

    pageList(BuildContext context){
      return Container(
        child: Center(
          child: Text("Đây là PageList"),
        ),
      );
    }

    pageSetting(BuildContext context){
      return Container(
        child: Center(
          child: Text("Đây là PageSetting"),
        ),
      );
    }

  _buildBody(BuildContext context, int index){
    switch (index){
      case 0: return pageHome(context);
      case 1: return pageList(context);
      case 2: return pageSetting(context);
    }  
  }
}

