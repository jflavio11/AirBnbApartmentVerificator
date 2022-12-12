import 'package:flutter/cupertino.dart';

class FormData with ChangeNotifier {
  int _currentPage = 0;
  Map<VerificationZone, ZoneStateData> data = <VerificationZone, ZoneStateData>{
    VerificationZone.Kitchen: const ZoneStateData(
      data: {
        "kitchen_kitchenOkay": true,
        "kitchen_kitchenetTableOkay": true,
        "kitchen_homeAppliancesOkay": true,
        "kitchen_glassesOkay": true,
        "kitchen_wineGlassesOkay": true,
        "kitchen_dishesOkay": true,
        "kitchen_cupsOkay": true,
      },
    ),
    VerificationZone.Bedrooms: const ZoneStateData(
      data: {
        "bedroom_walls": true,
        "bedroom_bed": true,
        "bedroom_bedsideTable": true,
        "bedroom_lamps": true,
        "bedroom_tv": true,
        "bedroom_wardrobe": true,
        "bedroom_duvet": true,
      },
    ),
  };

  void nextPage() {
    _currentPage++;
    notifyListeners();
  }

  void previousPage() {
    if (_currentPage == 0) return;
    _currentPage--;
    notifyListeners();
  }

  void updateData(VerificationZone zone, int position, bool newValue) {
    ZoneStateData selectedZoneData = data[zone]!;
    ZoneStateData updatedData = selectedZoneData.copyWith(
      keyToUpdate: selectedZoneData.data.keys.toList()[position],
      newValue: newValue,
    );
    data[zone] = updatedData;
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
    return data[getVerificationZoneForPage()]?.extraComments ?? "";
  }

  void updateCommentsForCurrentPage(String? extraComments) {
    ZoneStateData selectedZoneData = data[getVerificationZoneForPage()]!;
    ZoneStateData updatedData = selectedZoneData.copyWith(extraComments: extraComments);
    data[getVerificationZoneForPage()] = updatedData;
    notifyListeners();
  }
}

enum VerificationZone { Kitchen, Bathrooms, Bedrooms, LivingRoom }

@immutable
class ZoneStateData {
  final String extraComments;
  final Map<String, bool> data;

  const ZoneStateData({this.extraComments = "", required this.data});

  ZoneStateData copyWith({String? keyToUpdate, bool? newValue, String? extraComments}) {
    Map<String, bool> updatedMap = data.map((key, value) {
      if (key == keyToUpdate && keyToUpdate != null) {
        return MapEntry(keyToUpdate, newValue ?? value);
      } else {
        return MapEntry(key, value);
      }
    });
    ZoneStateData updated = ZoneStateData(
      extraComments: extraComments ?? this.extraComments,
      data: updatedMap,
    );
    return updated;
  }
}
