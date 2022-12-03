import 'package:airbnb_apartment_verificator/form/FormData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'FormPages.dart';

class FormPagerScreen extends StatelessWidget {
  static const String route = "FormScreenFlow";

  const FormPagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => FormData(),
        child: Navigator(
          initialRoute: FormPageOne.route,
          onGenerateRoute: (RouteSettings settings) {
            WidgetBuilder builder;
            switch (settings.name) {
              case FormPageOne.route:
                builder = (BuildContext context) => const FormPageOne();
                break;

              case FormPageTwo.route:
                builder = (BuildContext context) => const FormPageTwo();
                break;

              default:
                throw Exception("Invalid Route...");
            }
            return MaterialPageRoute(builder: builder, settings: settings);
          },
        ));
  }
}
