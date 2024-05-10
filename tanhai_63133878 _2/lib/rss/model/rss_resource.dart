class RssResource{
 String id, name;
 String startDescriptionRegrex, endDescriptionRegrex;
 String startImageRegrex, endImageRegrex;
 Map<String, String> resourceHeaders;

 RssResource({
    required this.id,
    required this.name,
    required this.startDescriptionRegrex,
    required this.endDescriptionRegrex,
    required this.startImageRegrex,
    required this.endImageRegrex,
    required this.resourceHeaders,
  });
}

List<RssResource> rssResource = [
  RssResource(
    id: "vnexpress", name: "VN Express",
    startDescriptionRegrex: "</a></br>", endDescriptionRegrex: "", startImageRegrex: '<img src="', endImageRegrex: '"',
    resourceHeaders: {
      "Trang chủ" : "https://vnexpress.net/rss/tin-moi-nhat.rss",
      "Thế giới" : "https://vnexpress.net/rss/the-gioi.rss",
      "Thời sự" : "https://vnexpress.net/rss/thoi-su.rss",
      "Kinh doanh" : "https://vnexpress.net/rss/thoi-su.rss",
      "Sức khỏe" : "https://vnexpress.net/rss/suc-khoe.rss",
      "Đời sống" : "https://vnexpress.net/rss/gia-dinh.rss",
      "Du lịch" : "https://vnexpress.net/rss/du-lich.rss",
      "Khoa học" : "https://vnexpress.net/rss/khoa-hoc.rss",
      "Giải trí" : "https://vnexpress.net/rss/giai-tri.rss",
      "Thể thao" : "https://vnexpress.net/rss/the-thao.rss"
    }
  ),// VN Express
  RssResource(
      id: "dantri", name: "Dân trí",
      startDescriptionRegrex: "</a></br>", endDescriptionRegrex: "", startImageRegrex: "<img src='", endImageRegrex: "'",
      resourceHeaders: {
        "Trang chủ" : "https://dantri.com.vn/rss/home.rss",
        "Thế giới" : "https://dantri.com.vn/rss/the-gioi.rss",
        "Kinh doanh" : "https://dantri.com.vn/rss/kinh-doanh.rss",
        "Đời sống" : "https://dantri.com.vn/rss/doi-song.rss",
        "Du lịch" : "https://dantri.com.vn/rss/du-lich.rss",
        "Giải trí" : "https://dantri.com.vn/rss/giai-tri.rss",
        "Pháp luật" : "https://dantri.com.vn/rss/phap-luat.rss",
        "Văn hóa" : "https://dantri.com.vn/rss/phap-luat.rss",
        "An sinh" : "https://dantri.com.vn/rss/an-sinh.rss",
        "Nhân tài Đất Việt" : "https://dantri.com.vn/rss/nhan-tai-dat-viet.rss"
      }
  ),// Dân trí
];