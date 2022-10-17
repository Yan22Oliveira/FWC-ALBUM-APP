import 'package:flutter/material.dart';

import './app/fwc_album_app.dart';
import './app/core/core.dart';

Future<void> main() async {
  await Env.instance.load();
  runApp(const FwcAlbumApp());
}