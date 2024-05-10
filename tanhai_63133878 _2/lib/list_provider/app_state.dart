import 'package:flutter/foundation.dart';
import 'dart:core';

class AppState extends ChangeNotifier{
  List<String> _dssp = [
    "Chuối", "Lê", "Bưởi", "Cam", "Quýt", "Táo", "Ổi", "Me",
    "Lựu", "Xoài", "Bơ", "Đu đủ", "Măng cụt", "Dừa", "Sầu riêng"
  ];

  List<int> _gioHang = [];
  List<String> get dssp => _dssp;
  List<int> get gioHang => _gioHang;
  int get slMH_GioHang => _gioHang.length;

  void them(int index){
    if(mhCoTrongGioHang(index) == false){
      _gioHang.add(index);
      notifyListeners();
    }
  }

  void xoa(int index){
    _gioHang.removeAt(index);
    notifyListeners();
  }

  bool mhCoTrongGioHang(int index){
    for(int i in _gioHang)
      if(i == index) return true;
      return false;
  }
}
