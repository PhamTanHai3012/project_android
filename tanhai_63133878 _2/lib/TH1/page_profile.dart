import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tanhai_63133878/widgets/dropdown_button.dart';
import 'package:tanhai_63133878/widgets/radio_button.dart';
import 'package:tanhai_63133878/widgets/wrapper_data.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  int index = 0;
  DateTime? ngaySinh = DateTime(2003,1,1);
  StringWrapper gioiTinh = StringWrapper(value: "Nam");
  StringWrapper phepTinh = StringWrapper(value: "Cộng");
  StringWrapper buoiHoc = StringWrapper(value: "Một");
  StringWrapper monAn = StringWrapper(value: "Đào");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Page Profile"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("asset/images/sky.jpg"),
                ),
                accountName: Text("Tấn Hải"),
                accountEmail: Text("hai.pt.63cntt@ntu.edu.vn"),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => InboxPage())
                );
              },
              leading: Icon(Icons.inbox),
              title: Text("Inbox"),
              trailing: Text("0"),
            )
          ],
        )
      ),
      body: _buildBody(context, index),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.home, color: Colors.blue),
                icon: Icon(Icons.home, color: Colors.grey),
                label: "Home",
            ),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.home, color: Colors.blue),
                icon: Icon(Icons.home, color: Colors.grey),
                label: "SMS",
            ),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.home, color: Colors.blue),
                icon: Icon(Icons.home, color: Colors.grey),
                label: "Phone",
            ),
          ],
          onTap: (value){
            setState(() {
              index = value;
            });
          },
        ),
    );
  }

  _buildBody(BuildContext context, int index){
    switch(index){
      case 0: return _buildHome(context);
      case 1: return _build_SMS(context);
      case 2: return _buildPhone(context);
    }
  }

  _buildHome(BuildContext context){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 300,
                height: 200,
                child: Image.asset("asset/images/sky.jpg"),
              ),
            ),
            SizedBox(height: 15,),
            Text("Họ Tên: "),
            Text("Phạm Tấn Hải", style: TextStyle(fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold)),
            SizedBox(height: 15,),
            Text("Ngày sinh: "),
            // Text("30/12/2003", style: TextStyle(fontSize: 20),),
            Row(
              children: [
                Expanded(child: Text("${ngaySinh?.day ?? 1}/${ngaySinh?.month ?? 1}/${ngaySinh?.year ?? 2023}")),
                IconButton(
                    onPressed: () async{
                      var d = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1990),
                        lastDate: DateTime(2050),
                      );
                      if(d != null){
                        setState(() {
                          ngaySinh = d;
                        });
                      }
                    },
                    icon: Icon(Icons.calendar_month))
              ],
            ),
            SizedBox(height: 15,),
            Text("Giới tính"),
            // Row(
            //   children: [
            //     Expanded(
            //       child: ListTile(
            //         title: Text("Nam"),
            //         leading: Radio(
            //           value: "nam",
            //           groupValue: gioiTinh,
            //           onChanged: (value){
            //             setState(() {
            //               gioiTinh = value as String?;
            //             });
            //           },
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       child: ListTile(
            //         title: Text("Nữ"),
            //         leading: Radio(
            //           value: "nữ",
            //           groupValue: gioiTinh,
            //           onChanged: (value){
            //             setState(() {
            //               gioiTinh = value as String?;
            //             });
            //           },
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            MyGroupRadio(labels: ["Nam", "Nữ", "Giới tính thứ 3"], groupValue: gioiTinh),
            SizedBox(height: 15),
            Text("Phép tính giỏi nhất của bạn"),
            // DropdownButton<String>(
            //   isExpanded: true,
            //     value: phepTinh,
            //     items: phepTinhs.map(
            //             (phepTinh) => DropdownMenuItem(child: Text(phepTinh),value: phepTinh)
            //     ).toList(),
            //     onChanged: (value){
            //       setState((){
            //         phepTinh = value;
            //       });
            //     },
            // ),
            MyDropdownButton(labels: ["Cộng","Trừ","Nhân","Chia","Tích Phân","Đạo Hàm"], value: phepTinh, itemBuilder: null),
            SizedBox(height: 15),
            Text("Món ăn yêu thích của bạn"),
            MyDropdownButton(
              labels: ["Đào","Phở","Piano","Mai"],
              value: monAn,
              itemBuilder:(label) => Row(
                children: [
                  Icon(Icons.emoji_food_beverage_outlined),
                  SizedBox(height: 30),
                  Text(label)
                ],
              ),
            ),
            SizedBox(height: 15),
            Text("Bạn thực hành mấy buổi rồi"),
            MyGroupRadio(labels: ["Một", "Hai", "Chưa có buổi nào"], groupValue: buoiHoc)
          ],
        ),
      ),
    );
  }

  _build_SMS(BuildContext context){}

  _buildPhone(BuildContext context){}
}

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inbox"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary
      ),
    );
  }
}
