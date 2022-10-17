import 'dart:developer';

import 'package:fwc_album_app/app/models/models.dart';

import './register_presenter.dart';
import '../view/register_view.dart';
import '../../../../repository/repository.dart';

class RegisterPresenterImpl implements RegisterPresenter {

  final AuthRepository authRepository;
  RegisterPresenterImpl({required this.authRepository});

  late final RegisterView _view;

  @override
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final registerUserModel = RegisterUserModel(
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );

    try{
      await authRepository.register(registerUserModel);
      _view.registerSuccess();
    }catch(e,s){
      log('Erro ao cadastrar usuário', error: e, stackTrace: s);
      _view.registerError();
    }

  }

  @override
  set view(RegisterView view) => _view = view;

}