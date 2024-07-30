import 'package:creative_login/Bloc/Auth/auth_cubit.dart';
import 'package:creative_login/Utils/Constants/app_color.dart';

mixin SnackBarText implements PackageColor {
  get snackBarText => <Authentication, Map>{
        Authentication.emptyCredential: {
          'title': 'Login Error!',
          'message': 'Please fill the blank',
          'color': error
        },
        Authentication.noConnection: {
          'title': 'Connection Error!',
          'message': 'You are not connected with internet',
          'color': error
        },
        Authentication.invalidApi: {
          'title': 'Api Error!',
          'message': 'Invalid Api, contact Developer',
          'color': error
        },
        Authentication.invalidCredential: {
          'title': 'Login Error!',
          'message': 'Invalid email or password',
          'color': error
        },
        Authentication.success: {
          'title': 'Congratulations',
          'message': 'You are now logged in',
          'color': phoneCall
        },
        Authentication.unknown: {
          'title': 'Unknown Error!',
          'message': 'Try after sometime',
          'color': error
        },
      };
}
