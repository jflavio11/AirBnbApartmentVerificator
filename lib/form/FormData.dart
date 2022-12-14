import 'package:flutter/cupertino.dart';

class FormData with ChangeNotifier {
  int _currentPage = 0;
  Map<VerificationZone, ZoneStateData> data = <VerificationZone, ZoneStateData>{
    VerificationZone.Kitchen: const ZoneStateData(data: {
      "kitchen_kitchenOkay": true,
      "kitchen_kitchenetTableOkay": true,
      "kitchen_homeAppliancesOkay": true,
      "kitchen_glassesOkay": true,
      "kitchen_wineGlassesOkay": true,
      "kitchen_dishesOkay": true,
      "kitchen_cupsOkay": true,
      "kitchen_ceiling": true,
    }),
    VerificationZone.Bedrooms: const ZoneStateData(data: {
      "bedroom_walls": true,
      "bedroom_bed": true,
      "bedroom_bedsideTable": true,
      "bedroom_lamps": true,
      "bedroom_tv": true,
      "bedroom_wardrobe": true,
      "bedroom_duvet": true,
      "bedroom_ceiling": true,
    }),
    VerificationZone.LivingRoom: const ZoneStateData(data: {
      "livingroom_walls": true,
      "livingroom_sofas": true,
      "livingroom_ceiling": true,
      "livingroom_furniture": true,
      "livingroom_tv": true,
    }),
    VerificationZone.Bathrooms: const ZoneStateData(data: {
      "bathrooms_mirror": true,
      "bathrooms_glass_door": true,
      "bathrooms_toilet": true,
    }),
  };

  void nextPage() {
    if (_currentPage == data.length - 1) return;
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
    int index = 0;
    for (var element in data.keys) {
      if (index == _currentPage) {
        zone = element;
      }
      index++;
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
