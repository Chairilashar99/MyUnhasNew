import 'package:http/http.dart' as http;
import 'package:my_unhas_new/constants/oauth.dart';
import 'package:my_unhas_new/constants/path.dart';
import 'package:my_unhas_new/dtos/login_request.dart';

import 'basic_client.dart';

class AuthService {
  static final http.Client _client = BasicClient();

  Future<http.Response> login(LoginRequest loginRequest) async {
    var headers = {
      'Accept': '*/*',
      'ContentType': 'application/json',
    };

    var body = {
      'grant_type': OAuth.grantType,
      'client_id': OAuth.clientId,
      'client_secret': OAuth.clientSecret,
      'username': loginRequest.username,
      'password': loginRequest.password,
      'scope': OAuth.scope,
    };
    var url = Uri.parse(authPath);
    return await _client.post(
      url,
      headers: headers,
      body: body,
    );
  }
}
