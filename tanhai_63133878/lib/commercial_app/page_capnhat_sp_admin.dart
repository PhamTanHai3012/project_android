import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tanhai_63133878/commercial_app/models.dart';
import 'package:tanhai_63133878/helper/storage_image_helper.dart';
import 'package:image_picker/image_picker.dart';

class PageCNSP_Admin extends StatefulWidget {
  FruitSnapshot fruitSnapShot;
  PageCNSP_Admin({super.key, required this.fruitSnapShot});

  @override
  State<PageCNSP_Admin> createState() => _PageCNSP_Admin();
}

class _PageCNSP_Admin extends State<PageCNSP_Admin> {
  XFile? _xFile;
  TextEditingController txtId= TextEditingController();
  TextEditingController txtGia= TextEditingController();
  TextEditingController txtMoTa= TextEditingController();
  TextEditingController txtTen= TextEditingController();

  String? imageurl;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text("Add product"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                width: w*0.8,
                height:w*0.8*2/3,
                  child: _xFile == null
                  ? Image.network(widget.fruitSnapShot.fruit.anh!)
                  : Image.file(File(_xFile!.path)),
                  ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () async{
                      _xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                      if(_xFile!=null){
                        setState(() {
                        });
                      }
                    },
                    child: Text("Chọn ảnh"),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: txtId,
                  decoration: InputDecoration(
                  labelText: "ID", hintText: "Nhập ID sản phẩm vào đây"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: txtTen,
                  decoration: InputDecoration(
                      labelText: "Tên", hintText: "Nhập tên sản phẩm vào đây"),

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: txtGia,
                  decoration: InputDecoration(
                      labelText: "Giá", hintText: "Nhập giá sản phẩm vào đây"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: txtMoTa,
                  decoration: InputDecoration(
                      labelText: "Mô tả", hintText: "Nhập mô tả sản phẩm vào đây"),

                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () async{
                      Fruit fruit = Fruit(
                          id: txtId.text,
                          ten: txtTen.text,
                          gia: int.parse(txtGia.text),
                          mota: txtMoTa.text);
                      if(_xFile!=null){
                        showMySnackBar(context, "Đang cập nhật sản phẩm...", 3);
                        imageurl = await uploadImage(
                            imagePath: _xFile!.path,
                            folder: ["fruit_app"],
                            fileName: "${txtId.text}.jpg"
                        );
                        if(imageurl!=null){
                          fruit.anh= imageurl;
                          _capNhatSP(fruit);
                        }
                        else{
                          showMySnackBar(context, "Cập nhật sản phẩm không thành công", 3);
                        }
                      }else{
                        showMySnackBar(context, "Đang cập nhật sản phẩm...", 10);
                        fruit.anh = widget.fruitSnapShot.fruit.anh;
                        _capNhatSP(fruit);
                      }

                    },
                    child: Text("Cập nhật"),
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  }

  @override
  void initState() {
    txtId.text = widget.fruitSnapShot.fruit.id;
    txtTen.text = widget.fruitSnapShot.fruit.ten;
    txtGia.text = widget.fruitSnapShot.fruit.gia.toString();
    txtMoTa.text = widget.fruitSnapShot.fruit.mota?? "";
  }
  _capNhatSP(Fruit fruit) async{
    widget.fruitSnapShot.capNhat(fruit).then(
          (value) => showMySnackBar(
          context,
          "Cập nhật thành công sản phẩm: ${txtTen.text}",
          3
      ),
    ).catchError(
            (error){
          showMySnackBar(
              context,
              "Cập nhật không thành công sản phẩm: ${txtTen.text}",
              3);
        }
    );
  }
}
showMySnackBar(BuildContext context, String thongBao, int giay){
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(thongBao),
      duration: Duration(seconds: giay),
    ),
  );
}