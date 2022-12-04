import 'package:flutter/cupertino.dart';

class FormData extends ChangeNotifier {
  int _currentPage = 0;
  KitchenData kitchenData = KitchenData();

  void nextPage() {
    _currentPage++;
    notifyListeners();
  }

  void previousPage() {
    _currentPage--;
    notifyListeners();
  }

  void updateKitchenData(KitchenData kitchenData) {
    this.kitchenData = kitchenData;
    notifyListeners();
  }
}

class KitchenData {
  bool kitchenOkay;
  bool kitchenetTableOkay;
  bool homeAppliancesOkay;
  bool glassesOkay;
  bool wineGlassesOkay;
  bool dishesOkay;
  bool cupsOkay;
  String extraComments;

  KitchenData(
      {this.kitchenOkay = true,
      this.kitchenetTableOkay = true,
      this.homeAppliancesOkay = true,
      this.glassesOkay = true,
      this.wineGlassesOkay = true,
      this.dishesOkay = true,
      this.cupsOkay = true,
      this.extraComments = ""});

  KitchenData copyWith(
          {bool? kitchenOkay,
          bool? kitchenetTableOkay,
          bool? homeAppliancesOkay,
          bool? glassesOkay,
          bool? wineGlassesOkay,
          bool? dishesOkay,
          bool? cupsOkay,
          String? extraComments}) =>
      KitchenData(
          kitchenOkay: kitchenOkay ?? this.kitchenOkay,
          kitchenetTableOkay: kitchenetTableOkay ?? this.kitchenetTableOkay,
          homeAppliancesOkay: homeAppliancesOkay ?? this.homeAppliancesOkay,
          glassesOkay: glassesOkay ?? this.glassesOkay,
          wineGlassesOkay: wineGlassesOkay ?? this.wineGlassesOkay,
          dishesOkay: dishesOkay ?? this.dishesOkay,
          cupsOkay: cupsOkay ?? this.cupsOkay,
          extraComments: extraComments ?? this.extraComments);
}
