import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/models/favouritemodel.dart';

class Favouriteprovider extends StateNotifier<List<Place>> {
  Favouriteprovider() : super([]);

  void addPlace(Place title) {

    state = [title, ...state];
  }
  void removePlace(Place place) {
    state = state.where((p) => p != place).toList();
  }
}

final FavouriteData = StateNotifierProvider<Favouriteprovider, List<Place>>(
  (ref) => Favouriteprovider(),
);
