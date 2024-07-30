import 'package:creative_login/Model/faculty.dart';
import 'package:creative_login/Service/Api/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Model/credential.dart';
import '../../Model/faculty.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> with LoginService {
  AuthCubit() : super(InitialState());

  get emitInvalidCredential => emit(InvalidCredentialState());

  get emitNoConnection => emit(NoConnectionState());

  get emitEmptyCredential => emit(EmptyCredentialState());

  Future<void> login(InputCredential inputCredential) async {
    print("===>login*login*login  Startttttttt  -=-=-=>  ${inputCredential.domain}");
    emit(ProcessingState());
    List<Credential> creadentialList = [];
    for (var e in inputCredential.domain) {
      try {
        final credential = await verifyUser(inputCredential, e);
        credential.domain = e;
        creadentialList.add(credential);
        print("===>login*login*login ${e}");
        print("_JB_===>login*login*login token ===> ${credential.token}");
      } on String catch (error) {
        if (error == 'Invalid Credential') {
          emit(InvalidCredentialState());
        } else {
          emit(InvalidApiState());
        }
      } catch (_) {
        emit(UnknownState());
      }
    }
    if (creadentialList.isNotEmpty) {
      emit(SuccessState(creadentialList));
    } else {
      emit(InvalidApiState());
    }
  }
}
