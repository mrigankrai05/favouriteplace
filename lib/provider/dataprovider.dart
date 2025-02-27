import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/models/favouritemodel.dart';

class DataNotifier extends StateNotifier<List<Place>> {
  DataNotifier() : super([]);

  void addPlace(String title) {
    final newplace = Place(name: title.toUpperCase());

    state = [newplace, ...state];
  }

}

final DataProvider = StateNotifierProvider<DataNotifier,List<Place>>(
  (ref) => DataNotifier(),
);
