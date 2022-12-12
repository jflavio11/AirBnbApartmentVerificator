import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import 'FormData.dart';

class VerificatorListView extends StatelessWidget {
  FormData formData;
  VerificationZone verificationZone;

  VerificatorListView({super.key, required this.formData, required this.verificationZone});

  @override
  Widget build(BuildContext context) {
    ZoneStateData data = formData.data[verificationZone]!;
    List<String> keysList = data.data.keys.toList();
    List<bool> valuesList = data.data.values.toList();
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.data.length,
        itemBuilder: (context, position) {
          return Row(
            key: UniqueKey(),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(keysList[position].i18n()),
              Switch(
                value: valuesList[position],
                onChanged: (bool updatedValue) {
                  formData.updateData(verificationZone, position, updatedValue);
                },
              ),
            ],
          );
        });
  }
}
