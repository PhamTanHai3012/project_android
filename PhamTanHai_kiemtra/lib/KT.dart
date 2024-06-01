import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemSP extends StatefulWidget {
  const ThemSP({super.key});

  @override
  State<ThemSP> createState() => _ThemSPState();
}

class _ThemSPState extends State<ThemSP> {
  DateTime? ngayNhap = DateTime(2024,1,1);
  TextEditingController matHang = TextEditingController();
  TextEditingController soLuong = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Phạm Tấn Hải"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Mặt hàng"),
            TextField(
              controller: matHang,

            ),
            SizedBox(height: 15),
            Text("Số lượng"),
            TextField(
              controller: soLuong,
              inputFormatters: ,
            ),
            SizedBox(height: 15),
            Text("Ngày nhập"),
            TextField(
              decoration: InputDecoration(
                  labelText: ,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    String tb = "Đã thêm mặt hàng: ${matHang.text} \n"
                        "Số lượng: ${soLuong.text} \n"
                        "Vao CSDL";
                    showMySnackBar(context, tb, 5);
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

showMySnackBar(BuildContext context, String thongBao, int giay){
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(thongBao),
      duration: Duration(seconds: giay),
    ),
  );
}
