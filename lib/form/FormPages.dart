import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'FormData.dart';

class FormPageOne extends StatefulWidget {
  static const String route = "FormPageOne";

  const FormPageOne({super.key});

  @override
  State<StatefulWidget> createState() => _PageOneState();
}

class _PageOneState extends State<FormPageOne> {
  @override
  Widget build(BuildContext context) {
    return Center(
        widthFactor: 1.0,
        heightFactor: 1.0,
        child: Consumer<FormData>(
          builder: (context, formData, child) {
            debugPrint("Form data ${formData.kitchenData.kitchenOkay}");
            return Scaffold(
                body: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(children: [
                const Text("Revisión de cocina"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Cocina okay?"),
                    Switch(
                        value: formData.kitchenData.kitchenOkay,
                        onChanged: (bool newValue) {
                          formData.updateKitchenData(formData.kitchenData
                              .copyWith(kitchenOkay: newValue));
                        }),
                  ],
                )
              ]),
            ));
          },
        ));
  }
}

class FormPageTwo extends StatefulWidget {
  static const String route = "FormPageTwo";

  const FormPageTwo({super.key});

  @override
  State<StatefulWidget> createState() => _FormPageTwoState();
}

class _FormPageTwoState extends State<FormPageTwo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("2"),
        MaterialButton(
          onPressed: () {},
          child: const Text("Siguiente"),
        )
      ],
    );
  }
}
