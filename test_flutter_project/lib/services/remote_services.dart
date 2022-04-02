import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/image_remote_response.dart';

class RemoteServices {
  static const _authority = "api.pexels.com";
  static const _path = "/v1/curated";

  static const _apiKey =
      "563492ad6f917000010000012d67058e04814ab886a1540c59a18c2a";

  static const _params = {
    HttpHeaders.authorizationHeader: _apiKey,
  };

  static var client = http.Client();

  static Future<ImageRemoteResponse?> fetchProducts(String page) async {
    Map<String, String> _qParams = {
      'page':  page,
      'per_page': "16"
    };

    var uri = Uri(
      scheme: 'https',
      host: _authority,
      path: _path ,
      fragment: 'baz',
      queryParameters: _qParams,
    );
    print("link query -> " + _qParams.toString() ) ;
    var response =
        await client.get(uri, headers: _params);
    if (response.statusCode == 200) {
      var jsonString = response.body;

      return imageRemoteResponseFromJson(jsonString);
    } else {
      return null;
    }
  }
}
