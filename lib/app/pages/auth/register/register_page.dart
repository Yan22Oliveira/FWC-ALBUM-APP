import 'package:flutter/material.dart';

import 'package:validatorless/validatorless.dart';

import './presenter/register_presenter.dart';
import './view/register_view_impl.dart';
import '../../../core/core.dart';

class RegisterPage extends StatefulWidget {

  final RegisterPresenter presenter;
  const RegisterPage({required this.presenter, Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends RegisterViewImpl {

  final _formKey = GlobalKey<FormState>();

  final nameEC            = TextEditingController();
  final emailEC           = TextEditingController();
  final passwordEC        = TextEditingController();
  final confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    nameEC.dispose();
    emailEC.dispose();
    passwordEC.dispose();
    confirmPasswordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              Container(
                height: 106.82,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      context.images.bola,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 50,),
              Text(
                'Cadastrar Usuário',
                style: context.textStyles.titleBlack,
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Nome Completo *:'),
                      ),
                      controller: nameEC,
                      validator: Validatorless.required('Obrigatório'),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('E-mail *:'),
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
                        label: Text('Senha *:'),
                      ),
                      obscureText: true,
                      controller: passwordEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('Obrigatório'),
                        Validatorless.min(6,'Senha deve conter pelo menos 6 caracteres'),
                      ]),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Confirmar Senha *:'),
                      ),
                      obscureText: true,
                      controller: confirmPasswordEC,
                      validator: Validatorless.multiple([
                        Validatorless.required('Obrigatório'),
                        Validatorless.min(6,'Senha deve conter pelo menos 6 caracteres'),
                        Validatorless.compare(passwordEC,'Senha diferente de confirmar senha'),
                      ]),
                    ),
                    const SizedBox(height: 20,),
                    Button.primary(
                      label: 'Cadastrar',
                      width: size.width * .9,
                      onPressed: () async {

                        final formValid = _formKey.currentState?.validate() ?? false;

                        if(formValid){
                          showLoader();
                          await widget.presenter.register(
                            name: nameEC.text,
                            email: emailEC.text,
                            password: passwordEC.text,
                            confirmPassword: confirmPasswordEC.text,
                          );
                        }
                      },
                    ),
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
