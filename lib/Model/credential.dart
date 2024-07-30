import 'package:creative_login/Utils/Constants/app_api.dart';

class InputCredential {
  String email;
  String password;
  //List<String> domain = AppApi.domain!;
  List<String> domain = [];

  InputCredential(
      {required this.email, required this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
