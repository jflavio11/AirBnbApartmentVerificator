import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';

import 'FormData.dart';

class FormPageOne extends StatelessWidget {
  static const String route = "FormPageOne";

  const FormPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FormData>(builder: (context, formData, child) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(12.0),
                child:
                    Text("Revisión de cocina", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500)),
              ),
              ListView.builder(
                  key: UniqueKey(),
                  shrinkWrap: true,
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
                            KitchenData updated = formData.kitchenData.copyWith(
                              key: position,
                              newValue: updatedValue,
                            );
                            formData.updateKitchenData(updated);
                          },
                        ),
                      ],
                    );
                  }),
              const Divider(height: 20.0),
              const Spacer(),
              TextField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                maxLines: 7,
                maxLength: 500,
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                    labelText: "Comentarios extra",
                    hintText: "Detalles sobre algún incidente que se desee especificar",
                    floatingLabelBehavior: FloatingLabelBehavior.always),
                textAlign: TextAlign.justify,
                onSubmitted: (String? text) {
                  String updatedText = text ?? "";
                  formData.updateKitchenData(formData.kitchenData.copyWith(extraComments: updatedText));
                },
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, FormPageTwo.route);
                },
                child: const Text("Siguiente"),
              ),
            ],
          ),
        );
      }),
    );
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
