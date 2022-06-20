import 'package:flutter/material.dart';

import '../widgets/image_input.dart';

class AddPlacescreen extends StatefulWidget {
  static const routeName = '/add-place';

  const AddPlacescreen({Key? key}) : super(key: key);

  @override
  State<AddPlacescreen> createState() => _AddPlacescreenState();
}

class _AddPlacescreenState extends State<AddPlacescreen> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new Place'),
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
                  const ImageInput(),
                ],
              ),
            ),
          )),
          ElevatedButton.icon(
            onPressed: () {},
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
