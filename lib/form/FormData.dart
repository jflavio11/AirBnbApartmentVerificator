import 'package:flutter/cupertino.dart';

class FormData with ChangeNotifier {
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
  String extraComments;
  Map<int, bool> kitchenStateData;

  KitchenData({this.extraComments = ""})
      : kitchenStateData = <int, bool>{0: true, 1: true, 2: true, 3: true, 4: true, 5: true, 6: true};

  KitchenData copyWith(int key, bool newValue, {String? extraComments}) {
    kitchenStateData.update(key, (value) => newValue);
    KitchenData updated = KitchenData(extraComments: extraComments ?? this.extraComments);
    updated.kitchenStateData = kitchenStateData;
    return updated;
  }

  static const Map<int, String> stateDataStringMapper = <int, String>{
    0: "kitchen_kitchenOkay",
    1: "kitchen_kitchenetTableOkay",
    2: "kitchen_homeAppliancesOkay",
    3: "kitchen_glassesOkay",
    4: "kitchen_wineGlassesOkay",
    5: "kitchen_dishesOkay",
    6: "kitchen_cupsOkay"
  };
}
