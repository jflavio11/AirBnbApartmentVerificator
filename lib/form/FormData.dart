import 'package:flutter/cupertino.dart';

class FormData extends ChangeNotifier {
  KitchenData kitchenData = KitchenData();

  void updateKitchenData(KitchenData kitchenData) {
    this.kitchenData = kitchenData;
    notifyListeners();
  }
}

class KitchenData {
  bool kitchenOkay;
  bool kitchenetTableOkay;
  bool homeAppliancesOkay;

  KitchenData(
      {this.kitchenOkay = true,
      this.kitchenetTableOkay = true,
      this.homeAppliancesOkay = true});

  KitchenData copyWith(
          {bool? kitchenOkay,
          bool? kitchenetTableOkay,
          bool? homeAppliancesOkay}) =>
      KitchenData(
          kitchenOkay: kitchenOkay ?? this.kitchenOkay,
          kitchenetTableOkay: kitchenetTableOkay ?? this.kitchenetTableOkay,
          homeAppliancesOkay: homeAppliancesOkay ?? this.homeAppliancesOkay);
}
