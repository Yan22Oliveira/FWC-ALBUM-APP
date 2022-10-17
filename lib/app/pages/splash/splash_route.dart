import 'package:flutter/material.dart';

import 'package:flutter_getit/flutter_getit.dart';

import './splash_page.dart';
import './presenter/splash_presenter.dart';
import './presenter/splash_presenter_impl.dart';

class SplashRoute extends FlutterGetItPageRoute {

  const SplashRoute({super.key});

  @override
  List<Bind> get bindings => [
    Bind.lazySingleton<SplashPresenter>((i) => SplashPresenterImpl()),
  ];

  @override
  WidgetBuilder get page => (context) => SplashPage(presenter: context.get(),);

}