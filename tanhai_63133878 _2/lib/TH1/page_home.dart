import 'package:flutter/material.dart';
import 'package:tanhai_63133878/TH1/page_profile.dart';
import 'package:tanhai_63133878/app_state/page_counter.dart';
import 'package:tanhai_63133878/commercial_app/page_home_fruit_store.dart';
import 'package:tanhai_63133878/getx/get_counter.dart';
import 'package:tanhai_63133878/layout/page_list_view.dart';
import 'package:tanhai_63133878/layout/my_route.dart';
import 'package:tanhai_63133878/list_provider/gio_hang_app.dart';
import 'package:tanhai_63133878/json_list/page_list_photo.dart';
import 'package:tanhai_63133878/rss/pages/page_rss_simple.dart';

class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Page Home")
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10),
              _buildButton(context, lable: "My Profile", destination: MyProfile()),
              SizedBox(height: 10),
              _buildButton(context, lable: "Page List View", destination: PageListView()),
              SizedBox(height: 10),
              _buildButton(context, lable: "First Page", destination: FirstPage()),
              SizedBox(height: 10),
              _buildButton(context, lable: "Counter Provider", destination: CounterProvider()),
              SizedBox(height: 10),
              _buildButton(context, lable: "GetX Counter", destination: PageGetxCounter()),
              SizedBox(height: 10),
              _buildButton(context, lable: "Fruit Store", destination: AppStore()),
              SizedBox(height: 10),
              _buildButton(context, lable: "Fruit App", destination: FruitStoreApp()),
              SizedBox(height: 10),
              _buildButton(context, lable: "Page List Photo", destination: PageListPhotos()),
              SizedBox(height: 10),
              _buildButton(context, lable: "Simple Controller RSS", destination: RssAPP()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, {required String lable, required Widget destination}) { // sửa container thành widget
    return Container(
      width: 200,
      child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => destination
            )
            );
          },
          child: Text(lable)
      ),
    );
  }
}