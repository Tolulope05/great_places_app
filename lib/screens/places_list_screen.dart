import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/add_place_screen.dart';
import '../providers/great_places.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('You Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlacescreen.routeName);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Got no places yet, you can start adding some!',
                  style: TextStyle(fontSize: 18),
                ),
                TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AddPlacescreen.routeName);
                  },
                  icon: const Icon(Icons.add_home),
                  label: const Text('Add Place'),
                ),
              ],
            ),
          ),
        ),
        builder: (ctx, greatPlaces, ch) => greatPlaces.items.isEmpty
            ? ch as Widget
            : ListView.builder(
                itemCount: greatPlaces.items.length,
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(
                      greatPlaces.items[i].image,
                    ),
                  ),
                  title: Text(
                    greatPlaces.items[i].title,
                  ),
                  onTap: () {
                    // Go to detail Page ........
                  },
                ),
              ),
      ),
    );
  }
}
