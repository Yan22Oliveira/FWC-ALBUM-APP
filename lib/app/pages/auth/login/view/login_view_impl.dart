import 'package:flutter/widgets.dart';

import '../login_page.dart';
import './login_view.dart';
import '../../../../core/core.dart';

abstract class LoginViewImpl extends State<LoginPage> with Messages<LoginPage>, Loader<LoginPage> implements LoginView {

  @override
  void initState() {
    widget.presenter.view = this;
    super.initState();
  }

  @override
  void error(String message) {
    hideLoader();
    showErro(message);
  }

  @override
  void success() {
    hideLoader();
    Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
  }

}
