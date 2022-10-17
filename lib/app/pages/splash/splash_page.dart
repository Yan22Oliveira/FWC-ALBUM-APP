import 'package:flutter/material.dart';

import './presenter/splash_presenter.dart';
import './view/splash_view_impl.dart';
import '../../core/core.dart';

class SplashPage extends StatefulWidget {

  final SplashPresenter presenter;
  const SplashPage({required this.presenter, Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends SplashViewImpl {

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: context.colors.primary,
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(context.images.backgroundSplash),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: size.height * .08),
                child: Image.asset(
                  context.images.fifaLogo,
                  height: size.height * .25,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: size.height * .19),
                child: Button(
                  onPressed: (){
                    widget.presenter.checkLogin();
                  },
                  width: size.width * .9,
                  buttonStyle: context.buttonStyles.yellowButton,
                  labelStyle: context.textStyles.textSecondaryFontExtraBoldPrimaryColor,
                  label: 'Acessar',
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20,),
                child: Image.asset(context.images.bandeiras),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
