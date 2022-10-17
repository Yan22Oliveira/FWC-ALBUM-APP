import 'package:flutter/material.dart';

import 'package:flutter_getit/flutter_getit.dart';

import './login_page.dart';
import './presenter/login_presenter.dart';
import './presenter/login_presenter_impl.dart';
import '../../../services/login/login_service_impl.dart';
import '../../../services/login/login_service.dart';

class LoginRoute extends FlutterGetItPageRoute {

  const LoginRoute({super.key});

  @override
  List<Bind> get bindings => [
    Bind.lazySingleton<LoginService>((i) => LoginServiceImpl(authRepository: i(),),),
    Bind.lazySingleton<LoginPresenter>((i) => LoginPresenterImpl(loginService: i(),),),
  ];

  @override
  WidgetBuilder get page => (context) => LoginPage(
    presenter: context.get(),
  );

}