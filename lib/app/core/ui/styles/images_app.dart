import 'package:flutter/material.dart';

class ImagesApp {

  static ImagesApp? _instance;

  ImagesApp._();

  static ImagesApp get instance{
    _instance??= ImagesApp._();
    return _instance!;
  }

  String get backgroundSplash => 'assets/images/background_splash.png';
  String get fifaLogo         => 'assets/images/fifa_logo.png';
  String get bandeiras        => 'assets/images/bandeiras.png';
  String get backgroundLogin  => 'assets/images/background_login.png';
  String get bola             => 'assets/images/bola.png';

}

extension ImagesAppExtensions on BuildContext{
  ImagesApp get images => ImagesApp.instance;
}