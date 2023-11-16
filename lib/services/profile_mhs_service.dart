import 'package:http/http.dart' as http;
import 'package:my_unhas_new/constants/path.dart';
import 'package:my_unhas_new/services/basic_client.dart';

class ProfileMahasiswaSevice {
  static final http.Client _client = BasicClient();

  Future<http.Response> getProfile() async {
    var url = getProfilePath;
    var uri = Uri.parse(url);
    return await _client.get(uri);
  }
}
