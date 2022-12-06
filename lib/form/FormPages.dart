import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
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
    return Scaffold(body: Consumer<FormData>(builder: (context, formData, child) {
      return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(children: [
            const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text("Revisión de cocina",
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500))),
            Expanded(
                child: ListView.builder(
                    key: UniqueKey(),
                    itemCount: formData.kitchenData.kitchenStateData.length,
                    itemBuilder: (context, position) {
                      return Row(
                          key: UniqueKey(),
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(KitchenData.stateDataStringMapper[position].toString().i18n()),
                            Switch(
                                value: formData.kitchenData.kitchenStateData[position] ?? false,
                                onChanged: (bool updatedValue) {
                                  KitchenData updated = formData.kitchenData.copyWith(position, updatedValue);
                                  formData.updateKitchenData(updated);
                                }),
                          ]);
                    })),
            const Divider(height: 20.0),
            OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, FormPageTwo.route);
                },
                child: const Text("Siguiente"))
          ]));
    }));
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
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Siguiente"),
        )
      ],
    );
  }
}
