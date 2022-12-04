import 'package:airbnb_apartment_verificator/form/FormData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'FormPages.dart';

class FormPagerScreen extends StatelessWidget {
  static const String route = "FormScreenFlow";

  FormPagerScreen({super.key});

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: ChangeNotifierProvider(
            create: (context) => FormData(),
            child: Navigator(
              initialRoute: FormPageOne.route,
              key: _navigatorKey,
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
              onPopPage: (route, result) {
                return route.didPop(result);
              },
            )),
        onWillPop: () async {
          _navigatorKey.currentState?.pop("");
          return false;
        });
  }
}
