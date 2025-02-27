import 'package:flutter/material.dart';
import '/models/favouritemodel.dart';
import '/screens/placedetailscreen.dart';

class Placeslist extends StatelessWidget {
  const Placeslist({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'No places added yet!',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      );
    }

    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (ctx, index) => Card(
        child: ListTile(
          title: Text(
            places[index].name,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 25,
            ),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => PlaceDetail(
                  place: places[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
