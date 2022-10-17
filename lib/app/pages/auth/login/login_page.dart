import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import './presenter/login_presenter.dart';
import './view/login_view_impl.dart';
import '../../../core/core.dart';

class LoginPage extends StatefulWidget {

  final LoginPresenter presenter;
  const LoginPage({required this.presenter, Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends LoginViewImpl {

  final _formKey = GlobalKey<FormState>();

  final emailEC           = TextEditingController();
  final passwordEC        = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    double widthPercentage = (size.width> 350? .30:.25 );

    return Scaffold(
     backgroundColor: context.colors.primary,
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                context.images.backgroundLogin,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  SizedBox(
                    height: size.height * widthPercentage,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Center(
                      child: Text(
                        'Login',
                        style: context.textStyles.titleWhite,
                      ),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      label: Text('E-mail'),
                    ),
                    controller: emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Obrigatório'),
                      Validatorless.email('E-mail inválido'),
                    ]),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    decoration: const InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      label: Text('Senha'),
                    ),
                    obscureText: true,
                    controller: passwordEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Obrigatório'),
                      Validatorless.min(6,'Senha deve conter pelo menos 6 caracteres'),
                    ]),
                  ),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Text(
                      'Esqueceu a senha?',
                      style: context.textStyles.textSecondaryFontMedium.copyWith(
                        color: context.colors.yellow,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Button(
                    width: size.width * .9,
                    buttonStyle: context.buttonStyles.yellowButton,
                    labelStyle: context.textStyles.textSecondaryFontExtraBoldPrimaryColor,
                    label: 'Entrar',
                    onPressed: () async {
                      final formValid = _formKey.currentState?.validate() ?? false;

                      if(formValid){
                        showLoader();
                        await widget.presenter.login(
                          email: emailEC.text,
                          password: passwordEC.text,
                        );
                      }
                    },
                  ),
                ]),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    const Spacer(),
                    Text.rich(
                      style: context.textStyles.textSecondaryFontMedium.copyWith(
                        color: context.colors.white,
                      ),
                      TextSpan(
                        text: 'Não possui uma conta?',
                        children: [
                          TextSpan(
                            text: ' Cadastre-se',
                            style: context.textStyles.textSecondaryFontMedium.copyWith(
                              color: context.colors.yellow,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = ()=> Navigator.of(context).pushNamed('/auth/register'),
                          ),
                        ]
                      ),
                    ),
                    const SizedBox(height: 40,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
