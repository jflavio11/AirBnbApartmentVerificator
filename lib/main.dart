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

class FormPagerScreen extends StatelessWidget {
  const FormPagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: "PageOne",
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case "PageOne":
            builder = (BuildContext context) => const FormPageOne();
            break;

          case "PageTwo":
            builder = (BuildContext context) => FormPageTwo(onNextPage: () {});
            break;

          default:
            throw Exception("Invalid Route...");
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}

class FormPageOne extends StatefulWidget {
  const FormPageOne({super.key});

  @override
  State<StatefulWidget> createState() => _PageOneState();
}

class _PageOneState extends State<FormPageOne> {
  void _onNextPage() {
    Navigator.pushNamed(context, "PageTwo");
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text("1"),
          MaterialButton(
            onPressed: _onNextPage,
            child: const Text("Siguiente"),
          )
        ],
      ),
    );
  }
}

class FormPageTwo extends StatelessWidget {
  const FormPageTwo({super.key, required this.onNextPage});

  final VoidCallback onNextPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("2"),
        MaterialButton(
          onPressed: onNextPage,
          child: const Text("Siguiente"),
        )
      ],
    );
  }
}
