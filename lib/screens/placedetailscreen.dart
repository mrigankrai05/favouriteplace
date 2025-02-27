import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '/models/favouritemodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/provider/favouriteprovider.dart';

class PlaceDetail extends ConsumerWidget {
  const PlaceDetail({super.key, required this.place});

  final Place place;

  void addFavourite(WidgetRef ref) {
    final favouritedata = ref.watch(FavouriteData);
    if (favouritedata.contains(place)) {
      ref.read(FavouriteData.notifier).removePlace(place);
      return;
    }
    ref.read(FavouriteData.notifier).addPlace(place);
  }

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    bool isfavourite =ref.watch(FavouriteData).contains(place);
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
        actions: [
          ElevatedButton(
            onPressed: () => addFavourite(ref),
            child: !isfavourite ? Icon(Icons.favorite_outline) : Icon(Icons.favorite),
          ),
        ],
      ),
      body: Center(
        child: Text(place.name),
      ),
    );
  }
}
