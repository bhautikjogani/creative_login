import 'dart:convert';

import 'package:creative_login/Model/faculty.dart';
import 'package:creative_login/Utils/Constants/app_api.dart';
import 'package:creative_login/Utils/Constants/app_exception.dart';
import 'package:http/http.dart' as http;

import '../../Model/credential.dart';

mixin LoginService {
  Future<Credential> verifyUser(InputCredential credential,String domain) async {
    //if (AppApi.domain != null) {
      try {
        var url = Uri.parse(domain + AppApi().loginApi);
        var response = await http.post(url, body: credential.toJson());
        var data = jsonDecode(response.body);
        if (data['error'] == null) {
          return Credential.fromJson(data);
        } else {
          throw AuthException.invalidCredential;
        }
      } catch (_) {
        rethrow;
      }

    // } else {
    //   throw AuthException.invalidApi;
    // }
  }
}
