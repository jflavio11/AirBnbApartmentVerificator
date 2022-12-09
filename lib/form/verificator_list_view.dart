import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import 'FormData.dart';

class VerificatorListView extends StatelessWidget {
  FormData formData;
  VerificationZone verificationZone;

  VerificatorListView({super.key, required this.formData, required this.verificationZone});

  @override
  Widget build(BuildContext context) {
    int length = 0;
    switch (verificationZone) {
      case VerificationZone.Kitchen:
        length = formData.kitchenData.kitchenStateData.length;
        break;
      case VerificationZone.Bedrooms:
        length = formData.bedroomData.bedroomStateData.length;
        break;
      case VerificationZone.Bathrooms:
        length = formData.kitchenData.kitchenStateData.length;
        break;
      case VerificationZone.LivingRoom:
        length = formData.kitchenData.kitchenStateData.length;
        break;
      default:
        0;
    }

    return ListView.builder(
        shrinkWrap: true,
        itemCount: length,
        itemBuilder: (context, position) {
          String text = "";
          bool switchValue = true;
          switch (verificationZone) {
            case VerificationZone.Kitchen:
              text = KitchenData.stateDataStringMapper[position].toString().i18n();
              switchValue = formData.kitchenData.kitchenStateData[position] ?? false;
              break;
            case VerificationZone.Bedrooms:
              text = BedroomData.stateDataStringMapper[position].toString().i18n();
              switchValue = formData.bedroomData.bedroomStateData[position] ?? false;
              break;
            case VerificationZone.Bathrooms:
              length = formData.kitchenData.kitchenStateData.length;
              break;
            case VerificationZone.LivingRoom:
              length = formData.kitchenData.kitchenStateData.length;
              break;
            default:
              0;
          }
          return Row(
            key: UniqueKey(),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text),
              Switch(
                value: switchValue,
                onChanged: (bool updatedValue) {
                  switch (verificationZone) {
                    case VerificationZone.Kitchen:
                      KitchenData updated = formData.kitchenData.copyWith(
                        key: position,
                        newValue: updatedValue,
                      );
                      formData.updateKitchenData(updated);
                      break;
                    case VerificationZone.Bedrooms:
                      formData.updateBedroomData(
                        formData.bedroomData.copyWith(
                          key: position,
                          newValue: updatedValue,
                        ),
                      );
                      break;
                    case VerificationZone.Bathrooms:
                      length = formData.kitchenData.kitchenStateData.length;
                      break;
                    case VerificationZone.LivingRoom:
                      length = formData.kitchenData.kitchenStateData.length;
                      break;
                    default:
                      0;
                  }
                },
              ),
            ],
          );
        });
  }
}
