import 'package:airbnb_apartment_verificator/form/verificator_list_view.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:provider/provider.dart';

import 'FormData.dart';

class FormPageOne extends StatelessWidget {
  static const String route = "FormPageOne";

  const FormPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FormData>(builder: (context, formData, child) {
      String title =
          "${formData.data.keys.firstWhere((i) => i == formData.getVerificationZoneForPage()).name}_title"
              .toLowerCase()
              .i18n();
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                formData.previousPage();
              },
              icon: const Icon(Icons.arrow_back),
            );
          }),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                VerificatorListView(
                  formData: formData,
                  verificationZone: formData.getVerificationZoneForPage(),
                ),
                const Divider(height: 20.0),
                TextField(
                  controller: TextEditingController(text: formData.getCurrentComments()),
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
                    formData.updateCommentsForCurrentPage(updatedText);
                  },
                ),
                OutlinedButton(
                  onPressed: () {
                    formData.nextPage();
                  },
                  child: const Text("Siguiente"),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
