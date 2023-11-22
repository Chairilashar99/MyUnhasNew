import 'package:http/http.dart' as http;
import 'package:my_unhas_new/constants/path.dart';
import 'package:my_unhas_new/services/basic_client.dart';

class TranskripService {
  static final http.Client _client = BasicClient();

  Future<http.Response> getTranskrip() async {
    var url = getTranskripPath;
    var uri = Uri.parse(url);
    return await _client.get(uri);
  }
}
