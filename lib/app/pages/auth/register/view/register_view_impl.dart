import 'package:flutter/widgets.dart';

import './register_view.dart';
import '../register_page.dart';
import '../../../../core/core.dart';

abstract class RegisterViewImpl extends State<RegisterPage> with Messages<RegisterPage>, Loader<RegisterPage> implements RegisterView {

  @override
  void initState() {
   widget.presenter.view = this;
    super.initState();
  }

  @override
  void registerError([String? message]) {
    hideLoader();
    showErro(message?? 'Erro ao registrar usuário');
  }

  @override
  void registerSuccess() {
    hideLoader();
    showSuccess('Usuário cadastrado com sucesso!');
    Navigator.of(context).pop();
  }

}