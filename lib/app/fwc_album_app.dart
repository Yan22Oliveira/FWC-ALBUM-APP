import 'package:flutter/material.dart';

import 'package:flutter_getit/flutter_getit.dart';

import './core/core.dart';
import './repository/repository.dart';
import './pages/splash/splash_route.dart';
import './pages/auth/register/register_route.dart';
import './pages/auth/login/login_route.dart';
import './pages/home/home_page.dart';


class FwcAlbumApp extends StatelessWidget {

  const FwcAlbumApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterGetItApplicationBinding(
      bindingsBuilder: ()=>[
        Bind.lazySingleton<CustomDio>((i) => CustomDio()),
        Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl(dio: i()))
      ],
      child: MaterialApp(
        title: 'Fifa World Cup Album',
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.theme,
        routes: {
          '/': (_)=> const SplashRoute(),
          '/auth/login': (_)=> const LoginRoute(),
          '/auth/register': (_)=> const RegisterRoute(),
          '/home': (_)=> const HomePage(),
        },
      ),
    );
  }
}
