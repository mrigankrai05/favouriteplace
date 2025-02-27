import 'package:flutter/material.dart';
import '/widgets/placeslist.dart';
import '/screens/addscreen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/provider/dataprovider.dart';
import '/provider/favouriteprovider.dart';

class Places extends ConsumerStatefulWidget {
  const Places({super.key});

  @override
  _PlacesState createState() => _PlacesState();
}

class _PlacesState extends ConsumerState<Places> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(DataProvider);
    final favouritedata = ref.watch(FavouriteData);
    String title = 'Places';
    Widget content = Placeslist(places: data);

    if (selectedIndex == 1) {
      content = Placeslist(places: favouritedata);
      title = 'Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(fontSize: 30)),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const Addscreen(),
                ),
              );
            },
          ),
        ],
      ),
      
      body: content,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
