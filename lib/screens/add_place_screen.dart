import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/image_input.dart';
import '../widgets/location_input.dart';
import '../providers/great_places.dart';

class AddPlacescreen extends StatefulWidget {
  static const routeName = '/add-place';

  const AddPlacescreen({Key? key}) : super(key: key);

  @override
  State<AddPlacescreen> createState() => _AddPlacescreenState();
}

class _AddPlacescreenState extends State<AddPlacescreen> {
  final _titleController = TextEditingController();

  File? _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      showDialog(
          context: context,
          builder: (context) => const Scaffold(
                  body: Center(
                      child: Text(
                'Sorry cant save Image',
                style: TextStyle(fontSize: 20),
              )))); //Needs restructuring
      return;
    }
    Provider.of<GreatPlaces>(context, listen: false).addPlace(
      _titleController.text,
      _pickedImage as File,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a New Place'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(labelText: 'Title'),
                    controller: _titleController,
                  ),
                  const SizedBox(height: 10),
                  ImageInput(_selectImage),
                  const SizedBox(height: 10),
                  const LocationInput(),
                ],
              ),
            ),
          )),
          ElevatedButton.icon(
            onPressed: _savePlace,
            icon: const Icon(Icons.add),
            label: const Text('Add Place'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).colorScheme.secondary),
              elevation: MaterialStateProperty.all(0),
              tapTargetSize: MaterialTapTargetSize
                  .shrinkWrap, // to get rid or the extra margin around tht button
            ),
          )
        ],
      ),
    );
  }
}
