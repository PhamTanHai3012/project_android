import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'models.dart';
import 'package:tanhai_63133878/commercial_app/controllers.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:badges/badges.dart' as badges;


class FruitStoreApp extends StatelessWidget {
  const FruitStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: FruitStoreBindings(),
      home: PageHome(),
    );
  }
}

class PageHome extends StatelessWidget {
  const PageHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fruit Store", style: TextStyle(fontSize: 25, color: Colors.white)),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary
      ),
      body: GetBuilder<SimpleControllerSP>(
        id: "listSP",
        builder: (controller) {
          return GridView.extent(
              maxCrossAxisExtent: 300,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              children: controller.dssp.map(
                      (sp) => GestureDetector(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => PageDetail(sp))
                        ),
                        child: Card(
                          elevation: 0.5,
                          color: Colors.red[100],
                          child: Column(
                            children: [
                              Expanded(
                                  child: sp.url != null ?
                                      AspectRatio(
                                          aspectRatio: 1,
                                          child:  Image.network(sp.url!)
                                      )
                                      :Icon(Icons.image_not_supported)
                              ),
                              Text(sp.ten, style: TextStyle(fontSize: 17)),
                              Text("${sp.gia} vnd", style: TextStyle(color: Colors.red),)
                            ],
                          )            ,
                        ),
                      )
              ).toList(),
          );
        },
      ),
    );
  }
}

class PageDetail extends StatelessWidget {
  Fruit sp;
  PageDetail(this.sp, {super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width*0.9;
    double rating = Random().nextInt(21)/10.0 + 3;

    return Scaffold(
      appBar: AppBar(
        title: Text(sp.ten),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          GetBuilder<SimpleControllerSP>(
            id: "gioHang",
            builder: (controller) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: badges.Badge(
                  showBadge: SimpleControllerSP.controller.slMHGH > 0,
                  child: Icon(Icons.shopping_cart_outlined),
                  badgeContent: Text("${SimpleControllerSP.controller.slMHGH}", style: TextStyle(color: Colors.white)),
                ),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: w,
              child: sp.url != null ? Image.network(sp.url!) : Icon(Icons.hide_image_rounded),
            ),
            Text(sp.ten, style: TextStyle(fontSize: 20)),
            Row(
              children: [
                Text("${sp.gia} vnđ", style: TextStyle(fontSize: 20, color: Colors.red)),
                SizedBox(width: 50),
                Text("${sp.gia} vnđ", style: TextStyle(fontSize: 20, decoration: TextDecoration.lineThrough)),
              ],
            ),
            Text(sp.mota!, style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
            SizedBox(height: 15),
            Row(
              children: [
                RatingBarIndicator(
                    rating: rating,
                  itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 30.0,
                  direction: Axis.horizontal,
                ),
                SizedBox(width: 10),
                Text("${rating}", style: TextStyle(color: Colors.red, fontSize: 23)),
                SizedBox(width: 15),
                Text("${Random().nextInt(100)} đánh giá", style: TextStyle(fontSize: 20))
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          SimpleControllerSP.controller.themVaoGH(sp, updateWidgetIds: ["gioHang"]);
          Icon(Icons.shopping_cart_outlined);
        },
      ),
    );
  }
}


