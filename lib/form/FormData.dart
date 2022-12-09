import 'package:flutter/cupertino.dart';

class FormData with ChangeNotifier {
  int _currentPage = 0;
  KitchenData kitchenData = KitchenData();
  BedroomData bedroomData = BedroomData();

  void nextPage() {
    _currentPage++;
    notifyListeners();
  }

  void previousPage() {
    if (_currentPage == 0) return;
    _currentPage--;
    notifyListeners();
  }

  VerificationZone getVerificationZoneForPage() {
    VerificationZone zone = VerificationZone.Kitchen;
    switch (_currentPage) {
      case 0:
        zone = VerificationZone.Kitchen;
        break;
      case 1:
        zone = VerificationZone.Bedrooms;
        break;
      default:
        zone = VerificationZone.Kitchen;
    }
    return zone;
  }

  String getCurrentComments() {
    String comments = "";
    switch (getVerificationZoneForPage()) {
      case VerificationZone.Kitchen:
        comments = kitchenData.extraComments;
        break;
      case VerificationZone.Bedrooms:
        comments = bedroomData.extraComments;
        break;
      case VerificationZone.Bathrooms:
        // TODO: Handle this case.
        break;
      case VerificationZone.LivingRoom:
        // TODO: Handle this case.
        break;
    }
    return comments;
  }

  void updateKitchenData(KitchenData kitchenData) {
    this.kitchenData = kitchenData;
    notifyListeners();
  }

  void updateBedroomData(BedroomData bedroomData) {
    this.bedroomData = bedroomData;
    notifyListeners();
  }

  void updateCommentsForCurrentPage(String extraComments) {
    switch (getVerificationZoneForPage()) {
      case VerificationZone.Kitchen:
        updateKitchenData(
          kitchenData.copyWith(extraComments: extraComments),
        );
        break;
      case VerificationZone.Bedrooms:
        updateBedroomData(
          bedroomData.copyWith(extraComments: extraComments),
        );
        break;
      case VerificationZone.Bathrooms:
        // TODO: Handle this case.
        break;
      case VerificationZone.LivingRoom:
        // TODO: Handle this case.
        break;
    }
  }
}

enum VerificationZone { Kitchen, Bathrooms, Bedrooms, LivingRoom }

class KitchenData {
  String extraComments;
  Map<int, bool> kitchenStateData;

  KitchenData({this.extraComments = ""})
      : kitchenStateData = <int, bool>{0: true, 1: true, 2: true, 3: true, 4: true, 5: true, 6: true};

  KitchenData copyWith({int? key, bool? newValue, String? extraComments}) {
    if (key != null && newValue != null) {
      kitchenStateData.update(key, (value) => newValue);
    }
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

class BedroomData {
  String extraComments;
  Map<int, bool> bedroomStateData;

  BedroomData({this.extraComments = ""})
      : bedroomStateData = <int, bool>{0: true, 1: true, 2: true, 3: true, 4: true, 5: true, 6: true};

  BedroomData copyWith({int? key, bool? newValue, String? extraComments}) {
    if (key != null && newValue != null) {
      bedroomStateData.update(key, (value) => newValue);
    }
    BedroomData updated = BedroomData(extraComments: extraComments ?? this.extraComments);
    updated.bedroomStateData = bedroomStateData;
    return updated;
  }

  static const Map<int, String> stateDataStringMapper = <int, String>{
    0: "bedroom_walls",
    1: "bedroom_bed",
    2: "bedroom_bedsideTable",
    3: "bedroom_lamps",
    4: "bedroom_tv",
    5: "bedroom_wardrobe",
    6: "bedroom_duvet"
  };
}
