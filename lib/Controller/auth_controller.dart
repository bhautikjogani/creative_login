import 'dart:async';

import 'package:creative_login/Bloc/Auth/auth_cubit.dart';
import 'package:creative_login/Model/credential.dart';
import 'package:creative_login/Service/Internet/internet.dart';
import 'package:creative_login/Utils/Text-Editing-Controller/text_editing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Model/branch.dart';
import '../Utils/Constants/app_api.dart';

class AuthController {
  final BuildContext context;

  AuthController(this.context);

  String get email {
    String email = TextEditingControllers.emailCtrl.text.trim();
    String emailSuffix = '@gmail.com';
    if (email.isNotEmpty &&
        email != emailSuffix &&
        !email.endsWith(emailSuffix)) {
      email += emailSuffix;
    }
    return email;
  }

  String get password => TextEditingControllers.passwordCtrl.text.trim();

  bool get _credentialIsVerified => email.isNotEmpty && password.isNotEmpty;

  Future<void> login(Branch branch) async {
    if (_credentialIsVerified /*&& AppApi.domain != null*/) {
      await InternetService.initialize().then((value) => _verify(value,branch),);
    } else {
      BlocProvider.of<AuthCubit>(context).emitEmptyCredential;
    }
  }

  FutureOr _verify(InternetService service, Branch branch) {
    if (service.hasConnection) {
      final credential = InputCredential(email: email, password: password);
      credential.domain = branch.domains;
      BlocProvider.of<AuthCubit>(context).login(credential);
    } else {
      BlocProvider.of<AuthCubit>(context).emitNoConnection;
    }
  }
}
