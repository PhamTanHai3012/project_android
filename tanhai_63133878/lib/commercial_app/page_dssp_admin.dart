import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tanhai_63133878/commercial_app/models.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tanhai_63133878/commercial_app/page_capnhat_sp_admin.dart';
import 'package:tanhai_63133878/commercial_app/page_them_sp_admin.dart';
import 'package:tanhai_63133878/helper/widget_connect_firebase.dart';
import 'package:tanhai_63133878/helper/storage_image_helper.dart';

class FruitStoreAdmin extends StatelessWidget {
  const FruitStoreAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return MyFirebaseConnect(
        errorMessage: "Lỗi nữa rồi!!!",
        connectingMessage: "Đang kết nối...",
        builder: (context) => GetMaterialApp(
          home: PageDSSP_Admin(),
          debugShowCheckedModeBanner: false,
        )
    );
  }
}

class PageDSSP_Admin extends StatelessWidget {
  const PageDSSP_Admin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("DSSP"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<List<FruitSnapshot>>(
          stream: FruitSnapshot.getAll(),
          builder: (context, snapshot){
            if(snapshot.hasError)
              return Center(child: Text("Lỗi nữa rồi!!!", style: TextStyle(color: Colors.red)));
            if(snapshot.hasData == false)
              return Center(child: CircularProgressIndicator());
            var list = snapshot.data!;
            return ListView.separated(
                itemBuilder: (context, index) {
                  var fruitSnap = list[index];
                  return Slidable(
                    endActionPane: ActionPane(
                        motion: ScrollMotion(),
                        children: [
                          SlidableAction(
                            icon: Icons.remove_red_eye_rounded,
                            label: "Xem",
                            foregroundColor: Colors.green,
                            onPressed: (context) {

                            },
                          ),
                          SlidableAction(
                            icon: Icons.edit,
                            label: "Cập nhật",
                            foregroundColor: Colors.blue,
                            onPressed: (context) {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) =>
                                      PageCNSP_Admin(fruitSnapShot: fruitSnap),
                                  ));
                            },
                          ),
                          SlidableAction(
                            icon: Icons.delete,
                            label: "Xóa",
                            foregroundColor: Colors.red,
                            onPressed: (context) async {
                              await deleteImage(folder: ["Fruit_app"], fileName: "${fruitSnap.fruit.id}.jpg");
                              await fruitSnap.xoa();
                            },
                          )
                        ]
                    ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                              child: Image.network(fruitSnap.fruit.anh!)
                          ),
                          Expanded(
                            flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("id: ${fruitSnap.fruit.id}"),
                                    Text("Tên: ${fruitSnap.fruit.ten}"),
                                    Text("Giá: ${fruitSnap.fruit.gia}"),
                                    Text("Mô tả: ${fruitSnap.fruit.mota}")
                                  ],
                                ),
                              )
                          )
                        ],
                      )
                  );
                },
                separatorBuilder: (context, index) => Divider(thickness: 1.5),
                itemCount: list.length
                );
          }

        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) =>
                  PageTSP_Admin(),
              ));
        },
      ),
    );
  }
}