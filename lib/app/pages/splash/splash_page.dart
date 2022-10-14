import 'package:flutter/material.dart';

import '../../core/core.dart';

class SplashPage extends StatefulWidget {

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with Loader<SplashPage>, Messages<SplashPage>{

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: context.colors.primary,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_splash.png'),
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
                  'assets/images/fifa_logo.png',
                  height: size.height * .25,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: size.height * .19),
                child: Button(
                  onPressed: (){},
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
                child: Image.asset('assets/images/bandeiras.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}