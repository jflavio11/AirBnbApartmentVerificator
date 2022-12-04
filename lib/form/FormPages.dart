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
    return Scaffold(
        body: Consumer<FormData>(
          builder: (context, formData, child) {
            return Padding(
                padding: const EdgeInsets.all(24.0),
                child: SingleChildScrollView(
                  child: Column(children: [
                    const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Text("Revisión de cocina",
                            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500))),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
                      Text("Item", style: TextStyle(fontSize: 18.0)),
                      Text("Está okay?", style: TextStyle(fontSize: 18.0))
                    ]),
                    const Divider(height: 20.0),
                    const Divider(height: 2.0, color: Colors.grey),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Cocina"),
                        Switch(
                            value: formData.kitchenData.kitchenOkay,
                            onChanged: (bool newValue) {
                              formData.updateKitchenData(
                                  formData.kitchenData.copyWith(kitchenOkay: newValue));
                            }),
                      ],
                    ),
                    const Divider(height: 2.0, color: Colors.grey),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Tablero de cuarzo"),
                        Switch(
                            value: formData.kitchenData.kitchenetTableOkay,
                            onChanged: (bool newValue) {
                              formData.updateKitchenData(
                                  formData.kitchenData.copyWith(kitchenetTableOkay: newValue));
                            }),
                      ],
                    ),
                    const Divider(height: 2.0, color: Colors.grey),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Electrodomésticos"),
                        Switch(
                            value: formData.kitchenData.homeAppliancesOkay,
                            onChanged: (bool newValue) {
                              formData.updateKitchenData(
                                  formData.kitchenData.copyWith(homeAppliancesOkay: newValue));
                            }),
                      ],
                    ),
                    const Divider(height: 2.0, color: Colors.grey),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Vasos"),
                        Switch(
                            value: formData.kitchenData.glassesOkay,
                            onChanged: (bool newValue) {
                              formData.updateKitchenData(
                                  formData.kitchenData.copyWith(glassesOkay: newValue));
                            }),
                      ],
                    ),
                    const Divider(height: 2.0, color: Colors.grey),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Copas de vino"),
                        Switch(
                            value: formData.kitchenData.wineGlassesOkay,
                            onChanged: (bool newValue) {
                              formData.updateKitchenData(
                                  formData.kitchenData.copyWith(wineGlassesOkay: newValue));
                            }),
                      ],
                    ),
                    const Divider(height: 2.0, color: Colors.grey),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Platos y menaje"),
                        Switch(
                            value: formData.kitchenData.dishesOkay,
                            onChanged: (bool newValue) {
                              formData
                                  .updateKitchenData(formData.kitchenData.copyWith(dishesOkay: newValue));
                            }),
                      ],
                    ),
                    const Divider(height: 2.0, color: Colors.grey),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Tazas"),
                        Switch(
                            value: formData.kitchenData.cupsOkay,
                            onChanged: (bool newValue) {
                              formData
                                  .updateKitchenData(formData.kitchenData.copyWith(cupsOkay: newValue));
                            }),
                      ],
                    ),
                    const Divider(height: 2.0, color: Colors.grey),
                    const Divider(height: 20.0),
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
                          formData.updateKitchenData(
                              formData.kitchenData.copyWith(extraComments: updatedText));
                        }),
                    const Divider(height: 20.0),
                    OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, FormPageTwo.route);
                        },
                        child: const Text("Siguiente"))
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
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Siguiente"),
        )
      ],
    );
  }
}
