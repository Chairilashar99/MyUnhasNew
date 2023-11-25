import 'package:http/http.dart' as http;
import 'package:my_unhas_new/constants/path.dart';
import 'package:my_unhas_new/services/basic_client.dart';

class PembayaranService {
  static final http.Client _client = BasicClient();

  Future<http.Response> getPembayaran() async {
    var url = getPembayaranPath;
    var uri = Uri.parse(url);
    return await _client.get(uri);
  }
}
