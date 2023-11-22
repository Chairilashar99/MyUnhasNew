import 'package:http/http.dart' as http;
import 'package:my_unhas_new/constants/path.dart';
import 'package:my_unhas_new/services/basic_client.dart';

class KrsService {
  static final http.Client _client = BasicClient();

  Future<http.Response> getKrs(Map<String, String> params) async {
    var url = '$getKrsPath?id_semester=${params['id_semester']}';
    print('URL for KRS request: $url');
    var uri = Uri.parse(url);
    return await _client.get(uri);
  }
}
