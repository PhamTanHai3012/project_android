import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tanhai_63133878/commercial_app/models.dart';
import 'package:tanhai_63133878/helper/storage_image_helper.dart';


class PageTSP_Admin extends StatefulWidget {
  const PageTSP_Admin({super.key});

  @override
  State<PageTSP_Admin> createState() => _PageTSP_AdminState();
}

class _PageTSP_AdminState extends State<PageTSP_Admin> {
  XFile? _xFile;
  TextEditingController txtId =  TextEditingController();
  TextEditingController txtTen =  TextEditingController();
  TextEditingController txtGia =  TextEditingController();
  TextEditingController txtMoTa =  TextEditingController();
  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Thêm sản phẩm"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  width: w*0.8,
                  height: w*0.8*2/3,
                  child: _xFile == null ? Icon(Icons.image_not_supported) : Image.file(File(_xFile!.path)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      _xFile = await ImagePicker().pickImage
                        (source: ImageSource.gallery);
                      if(_xFile!=null)
                        setState(() {

                        });
                    },
                    child: Text("Chọn ảnh"),
                  ),
                ],
              ),
              TextField(
                controller: txtId,
                decoration: InputDecoration(
                    labelText: "Id"
                ),
              ),
              TextField(
                controller: txtTen,
                decoration: InputDecoration(
                    labelText: "Tên"
                ),
              ),
              TextField(
                controller: txtGia,
                decoration: InputDecoration(
                    labelText: "Giá"
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: txtMoTa,
                decoration: InputDecoration(
                    labelText: "Mô tả"
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // 1. Thêm ảnh và lấy đường dẫn
                      // 2. Thêm dữ liệu vào FireStore
                      if(_xFile!=null){
                        uploadImage(imagePath: _xFile!.path, folder: ["Fruit_app"],
                          fileName: "${txtId.text}.jpg").then(
                            (url) {
                              Fruit fruit = Fruit(
                                id: txtId.text,
                                ten: txtTen.text,
                                gia: int.parse(txtGia.text),
                                mota: txtMoTa.text,
                                anh: url,
                              );
                              FruitSnapshot.themMoi(fruit);
                            }
                          ).catchError((error){
                            print("Lỗi!!!: ${error.toString()}");
                          });
                      }
                    },
                    child: Text("Thêm"),
                  )
                ],
              )
            ],
          ),
        ),
    );
  }
}