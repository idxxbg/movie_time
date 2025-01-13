import 'package:film_time/core/injection/injection.dart';
import 'package:film_time/feature/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // runApp(const HomePage2());
  runApp(const MyApp());
  getItsetup();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Color(0x00000000));
}
