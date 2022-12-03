import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const AirBnbApartmentVerificatorApp());
}

class AirBnbApartmentVerificatorApp extends StatelessWidget {
  const AirBnbApartmentVerificatorApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      title: 'AirBnb Apartment Verificator',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          colorScheme: const ColorScheme(
              brightness: Brightness.dark,
              primary: Colors.white,
              onPrimary: Colors.white,
              secondary: Colors.red,
              onSecondary: Colors.blue,
              error: Colors.red,
              onError: Colors.yellow,
              background: Colors.black,
              onBackground: Colors.grey,
              surface: Colors.blueGrey,
              onSurface: Colors.white)),
      home: const Scaffold(
        body: SafeArea(top: true, bottom: true, child: FormPagerScreen()),
      ),
    );
  }
}

class FormPagerScreen extends StatefulWidget {
  const FormPagerScreen({super.key});

  @override
  State<StatefulWidget> createState() => _FormPagerScreenState();
}

class _FormPagerScreenState extends State<FormPagerScreen> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "Test",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
