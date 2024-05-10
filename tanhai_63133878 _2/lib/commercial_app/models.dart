Map<String, String> images = {
  "chuoi" : "https://suckhoedoisong.qltns.mediacdn.vn/324455921873985536/2022/12/26/chuoi-chin-16720695582281654655438.jpg",
  "le" : "https://static.tuoitre.vn/tto/i/s626/2016/08/30/hinh-11-1472550335.jpg",
  "buoi" : "https://trungxuong.com/wp-content/uploads/2021/06/buoi-da-xanh-1.jpg",
  "cam" : "https://suckhoedoisong.qltns.mediacdn.vn/2015/1-nhung-luu-y-can-biet-khi-an-cam-moi-ngay-1438330541447.jpg",
  "quyt" : "https://cafebiz.cafebizcdn.vn/2017/photo-0-1484301453673.png",
  "tao" : "https://trungtamtienghan.edu.vn/uploads/blog/2019_07/cach-noi-qua-tao-bang-tieng-han_1.jpg",
  "oi" : "https://www.nuibavi.com/nuibavi-images/news/img1/oi-chin-bavi.jpg",
  "me" : "https://npvbeverage.com.vn/wp-content/uploads/2020/12/ME.png",
  "luu" : "https://thanhnien.mediacdn.vn/Uploaded/minhnguyet/2016_02_04/quakuu_YUMP.jpg?width=500",
  "xoai" : "https://bazaarvietnam.vn/wp-content/uploads/2022/06/harper-bazaar-1-qua-xoai-bao-nhieu-calo-an-xoai-co-map-khong-fedor-BRiT_unsplash-e1656341238790.jpg",
  "bo" : "https://caygiongbo.com/datafiles/3/2018-08-03/77423435-Trai-Bo-Hass-Ngon-Dinh.jpg",
  "mangcut" : "https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2021/4/25/902078/Mang-Cut.jpeg"
};

class Fruit{
  String id, ten;
  double gia;
  String? url;
  String? mota;
  Fruit({required this.id, required this.ten, required this.gia, this.url, this.mota});
}

class AppData{
  final List<Fruit> _dssp = [
    Fruit(id: "01", ten: "Chuối vàng", gia: 39000, url: images["chuoi"], mota: "Chuối vàng Khánh Sơn"),
    Fruit(id: "02", ten: "Lê Hàn", gia: 49000, url: images["le"], mota: "Lê đỏ Hàn Quốc"),
    Fruit(id: "03", ten: "Bưởi năm roi", gia: 59000, url: images["buoi"], mota: "Bưởi Khánh Sơn"),
    Fruit(id: "04", ten: "Cam sành", gia: 39000, url: images["cam"], mota: "Cam Đà Lạt"),
    Fruit(id: "05", ten: "Quýt vàng", gia: 25000, url: images["quyt"], mota: "Quýt Ninh Hòa"),
    Fruit(id: "06", ten: "Táo Envi", gia: 70000, url: images["tao"], mota: "Táo nhập khẩu Mĩ"),
    Fruit(id: "07", ten: "Ổi ruột đỏ", gia: 30000, url: images["oi"], mota: "Ổi Khánh Sơn"),
    Fruit(id: "08", ten: "Me thái", gia: 65000, url: images["me"], mota: "Me nhập khẩu Thái Lan"),
    Fruit(id: "09", ten: "Lựu đỏ", gia: 80000, url: images["luu"], mota: "Lựu Hàn Quốc"),
    Fruit(id: "10", ten: "Xoài Úc", gia: 50000, url: images["xoai"], mota: "Xoài Úc Cam Lâm"),
    Fruit(id: "11", ten: "Bơ 901", gia: 40000, url: images["bo"], mota: "Bơ 901 Khánh Sơn"),
    Fruit(id: "12", ten: "Măng cụt", gia: 59000, url: images["mangcut"], mota: "Măng cụt Đồng Tháp")
  ];

  List<Fruit> get dssp => _dssp;
}

class GH_Item{
  String idSP;
  int sl;
  GH_Item({required this.idSP, required this.sl});
}