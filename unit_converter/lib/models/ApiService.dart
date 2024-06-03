import 'dart:async';
import 'dart:convert' show json, utf8;
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:unit_converter/models/unit.dart';

/// For this app, the only [Category] endpoint we retrieve from an API is Currency.
///
/// If we had more, we could keep a list of [Categories] here.
const apiCategory = {
  'name': 'Tiền tệ',
};

class ApiService {
  final HttpClient _httpClient = HttpClient();

  final String _url = 'api.exchangerate-api.com';

  // Chuyển đổi tỷ giá thành danh sách các đơn vị với tên và tỷ giá
  Future<List?> getUnits() async {
    final uri = Uri.https(_url, '/v4/latest/USD');
    final jsonResponse = await _getJson(uri);
    if (jsonResponse == null || jsonResponse.isEmpty == true || jsonResponse['rates'] == null) {
      print('Lỗi nhận dữ liệu');
      return null;
    }

    final rates = jsonResponse['rates'] as Map<String, dynamic>;
    final units = rates.entries.map((entry) {
      return {
        'name': entry.key,
        'conversion': entry.value,
      };
    }).toList();
    return units;
  }

  //Lấy các kiểu dữ liệu tiền tệ và tỷ giá trên api.exchangerate-api.com
  Future<Map<String, dynamic>?> _getJson(Uri uri) async {
    try {
      final request = await _httpClient.getUrl(uri);
      final httpResponse = await request.close();

      if (httpResponse.statusCode != HttpStatus.ok) {
        return null;
      }
      final responseBody = await httpResponse.transform(utf8.decoder).join();
      return json.decode(responseBody);
    } on Exception catch (e) {
        print('$e');
        return null;
      }
  }
}
