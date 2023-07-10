import 'package:flutter/material.dart';
import 'configs/lang_config.dart';
import 'screens/register.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Locale currentLang = const Locale('en_US');
    return GetMaterialApp(
      title: 'Assigment 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Register(),
      translations: LanguageConfig(),
      locale: currentLang,
      fallbackLocale: const Locale('en_US'),
    );
  }
}
