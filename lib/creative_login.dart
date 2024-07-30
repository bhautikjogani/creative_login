library creative_login;

import 'package:creative_login/Bloc/Auth/auth_cubit.dart';
import 'package:creative_login/Controller/auth_controller.dart';
import 'package:creative_login/Model/faculty.dart';
import 'package:creative_login/Utils/Constants/app_api.dart';
import 'package:creative_login/Utils/Constants/app_color.dart';
import 'package:creative_login/Utils/Constants/snack_bar_text.dart';
import 'package:creative_login/Utils/Text-Editing-Controller/text_editing_controller.dart';
import 'package:creative_login/Utils/Theme/package_theme.dart';
import 'package:creative_login/Utils/Widget/Snack-Bar/custom_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Model/branch.dart';
import 'Utils/Text-Builder/large_title.dart';
import 'Utils/Text-Builder/medium_title.dart';
import 'Utils/Widget/Button/custom_dropdown.dart';
import 'Utils/Widget/Button/text_button.dart';
import 'Utils/Widget/Input/custom_input.dart';

class CreativeLogin extends StatelessWidget {
  const CreativeLogin({
    super.key,
    required this.branch,
    required this.onLogin,
    this.loginTitle,
    this.theme,
    this.listen,
    this.disableSnacks = false,
  });

  final List<Branch> branch;
  final String? loginTitle;
  final Theme? theme;
  final bool disableSnacks;
  final void Function(Authentication authState)? listen;
  final void Function(List<Credential> credential) onLogin;

  void _setGlobalData() {
    packageTheme = theme;
  }

  @override
  Widget build(BuildContext context) {
    _setGlobalData();
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: _CreativeLoginPackage(
        loginTitle: loginTitle,
        listen: listen,
        onLogin: onLogin,
        branch: branch,
        disableSnacks: disableSnacks,
      ),
    );
  }
}

class _CreativeLoginPackage extends StatelessWidget
    with PackageColor, SnackBarText {
  _CreativeLoginPackage(
      {this.loginTitle,
      this.listen,
      required this.onLogin,
      required this.branch,
      this.disableSnacks = false});

  final String? loginTitle;
  final bool disableSnacks;
  final List<Branch> branch;
  final void Function(Authentication authState)? listen;
  final void Function(List<Credential> faculty) onLogin;

  Branch? currentBranch;

  @override
  Widget build(BuildContext context) {
    String loginTitle = this.loginTitle ?? 'Staff Login';
    var passwordIsSecure = true;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: packageTheme?.data.scaffoldBackgroundColor ?? themeColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 200),
            BuildLargeTitle(text: loginTitle),
            const SizedBox(height: 18),
            CustomInput(
                placeholder: 'Email',
                controller: TextEditingControllers.emailCtrl,
                prefixIcon: CupertinoIcons.person),
            const SizedBox(height: 8),
            StatefulBuilder(
              builder: (context, setState) => CustomInput(
                placeholder: 'Password',
                controller: TextEditingControllers.passwordCtrl,
                obscureText: passwordIsSecure,
                prefixIcon: CupertinoIcons.lock,
                onSubmitted: (_) => AuthController(context).login,
                suffix: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () =>
                        setState(() => passwordIsSecure = !passwordIsSecure),
                    child: Icon(
                      passwordIsSecure
                          ? CupertinoIcons.eye
                          : CupertinoIcons.eye_slash,
                      color: themeColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            StatefulBuilder(
              builder: (context, setState) => CustomDropDown(
                value: currentBranch?.name,
                hint: 'Select Branch',
                branch: branch,
                onChanged: (selectedBranch) {
                  setState(() {
                    currentBranch = selectedBranch;
                  },);
                  //AppApi.domain = selectedBranch.domains;
                },
              ),
            ),
            const SizedBox(height: 18),
            BlocConsumer<AuthCubit, AuthState>(
              builder: (context, state) =>
                  _builder(context, state),
              listener: _listener,
            )
          ],
        ),
      ),
    );
  }

  void _listener(BuildContext context, AuthState state) {
    if (listen != null) {
      listen!(state.authentication);
    }
    if (!disableSnacks && state.authentication != Authentication.processing) {
      CustomSnackBar(
        context,
        title: snackBarText[state.authentication]['title'],
        message: snackBarText[state.authentication]['message'],
        backgroundColor: snackBarText[state.authentication]['color'],
      );
    }
    if (state is SuccessState) {
      onLogin(state.credential);
    }
  }

  Widget _builder(BuildContext context, AuthState state) {
    final authCtrl = AuthController(context);
    return BuildTextButton(
        isProcessing: state is ProcessingState,
        onPressed: state is! ProcessingState ? ()=> authCtrl.login(currentBranch!) : null,
        child: BuildMediumTitle(text: 'Login'));
  }
}
