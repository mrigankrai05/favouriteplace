import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/provider/dataprovider.dart';

class Addscreen extends ConsumerStatefulWidget {
  const Addscreen({super.key});

  @override
  ConsumerState<Addscreen> createState() => _AddscreenState();
}

class _AddscreenState extends ConsumerState<Addscreen> {
  final titlecontroller = TextEditingController();
  @override
  void dispose() {
    titlecontroller.dispose();
    super.dispose();
  }

  void addplace() {
    final text = titlecontroller.text;
    if (text.isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("ERROR", style: TextStyle(color: Colors.red)),
          content: Text(
            "Please enter a title",
            style: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            TextButton.icon(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              icon: Icon(Icons.error),
              label: Text('OK'),
            )
          ],
        ),
      );
      return;
    }

    ref.read(DataProvider.notifier).addPlace(text);

    Navigator.of(context).pop();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Screen'),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'ENTER TITLE'),
                controller: titlecontroller,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: addplace,
                icon: Icon(Icons.add),
                label: Text('ADD PLACE'),
              )
            ],
          )),
    );
  }
}
