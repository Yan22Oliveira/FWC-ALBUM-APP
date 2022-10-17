import 'package:flutter/widgets.dart';

import './splash_view.dart';
import '../splash_page.dart';
import '../../../core/core.dart';

abstract class SplashViewImpl extends State<SplashPage> with Loader<SplashPage> implements SplashView {

  @override
  void initState() {
    widget.presenter.view = this;
    super.initState();
  }

  @override
  void logged(bool isLogged) {
    hideLoader();
    if(isLogged){
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
    }else{
      Navigator.of(context).pushNamedAndRemoveUntil('/auth/login', (route) => false);
    }
  }

}