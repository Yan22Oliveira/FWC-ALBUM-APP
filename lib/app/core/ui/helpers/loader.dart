import 'package:flutter/material.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../styles/colors_app.dart';

mixin Loader<T extends StatefulWidget> on State<T> {

  var isOpen = false;

  void showLoader(){
    if(!isOpen){
      isOpen = true;
      showDialog(
        context: context,
        builder: (_){
          return LoadingAnimationWidget.threeArchedCircle(
            color: context.colors.white,
            size: 60,
          );
        },
      );
    }
  }

  void hideLoader(){
    if(isOpen){
      isOpen = false;
      Navigator.of(context).pop();
    }
  }

}