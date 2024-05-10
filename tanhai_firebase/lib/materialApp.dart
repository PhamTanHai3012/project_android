import 'package:flutter/material.dart';

class Material1 extends StatelessWidget {
  const Material1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thông báo", style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.inverseSurface,
      ),
      body: Center(
        child: Text("Kết nối Firebase thành công", style: TextStyle(fontSize: 25))
      ),
    );
  }
}
