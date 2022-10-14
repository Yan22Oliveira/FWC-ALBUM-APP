import 'package:flutter/material.dart';

import './pages/splash/splash_page.dart';
import './core/ui/theme/theme_config.dart';

class FwcAlbumApp extends StatelessWidget {

  const FwcAlbumApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fifa World Cup Album',
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.theme,
      routes: {
        '/': (_)=> const SplashPage(),
      },
    );
  }
}
