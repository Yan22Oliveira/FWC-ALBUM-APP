import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: ()async{
            final sharedPreferences = await SharedPreferences.getInstance();
            sharedPreferences.clear();
            Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
          },
          child: const Text('Sair'),
        ),
      ),
    );
  }
}
