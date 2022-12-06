import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/localization.dart';

import 'form/FormPager.dart';

void main() {
  runApp(const AirBnbApartmentVerificatorApp());
}

class AirBnbApartmentVerificatorApp extends StatelessWidget {
  const AirBnbApartmentVerificatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    LocalJsonLocalization.delegate.directories = ['assets/strings'];
    return MaterialApp(
      title: 'AirBnb Apartment Verificator',
      localizationsDelegates: [
        LocalJsonLocalization.delegate,
      ],
      supportedLocales: const [Locale('es', 'ES')],
      localeResolutionCallback: (locale, supportedLocales) {
        if (supportedLocales.contains(locale)) {
          return locale;
        }
        return const Locale('es', 'ES');
      },
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
      initialRoute: FormPagerScreen.route,
      routes: {
        FormPagerScreen.route: (context) => SafeArea(top: true, bottom: true, child: FormPagerScreen())
      },
    );
  }
}
