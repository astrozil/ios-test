import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController controller = TextEditingController();
  CollectionReference _notesCollection =
      FirebaseFirestore.instance.collection('notes');

  void _addNote() {
    _notesCollection.add({
      'note': controller.text,
      'timestamp': DateTime.now(),
      'month': DateTime.now().month,
      'day': DateTime.now().day,
      'year': DateTime.now().year
    });

    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 240, 235, 223),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 235, 223),
        elevation: 0,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: TextField(
                cursorColor: Colors.black,
                maxLines: 10,
                controller: controller,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: ElevatedButton(
              onPressed: () {
                _addNote();
              },
              child: Text(
                "Add",
                style: TextStyle(color: Colors.black),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white)),
            ))
      ]),
    );
  }
}
