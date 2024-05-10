void main() {
  List<String> list = [
    "Cam Lâm", "Cam Đức", "Cam Hòa", "Cam Ranh", "Cam Phước"
  ];
  List<int> cd = list.map((e) => e.length).toList();

  print(list);
  print(cd);

  cd.forEach((e) => print(e*e));
}