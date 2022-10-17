import 'dart:developer';

import '../view/login_view.dart';
import './login_presenter.dart';
import '../../../../core/core.dart';
import '../../../../services/login/login_service.dart';

class LoginPresenterImpl implements LoginPresenter {

  final LoginService loginService;
  LoginPresenterImpl({required this.loginService});

  late final LoginView _view;

  @override
  Future<void> login({required String email,required String password}) async{
    try{
      await loginService.execute(email: email, password: password,);
      _view.success();
    }on UnauthorizedException{
      _view.error('Usuário ou senha inválidos');
    }catch(e,s){
      log('Erro ao realizar login', error: e, stackTrace: s,);
      _view.error('Erro ao realizar login');
    }
  }

  @override
  set view(LoginView view) => _view = view;

}