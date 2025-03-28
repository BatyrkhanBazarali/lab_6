import 'package:flutter/material.dart';
import 'pages/registration_page.dart'; // Импортируем страницу регистрации

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 6 Registration',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegistrationPage(), // Указываем начальный экран
    );
  }
}
