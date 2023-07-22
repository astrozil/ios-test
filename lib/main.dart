import 'package:dailynotes/firebase_options.dart';
import 'package:dailynotes/screens/AddScreen.dart';
import 'package:dailynotes/screens/HomeScreenForBoom.dart';
import 'package:dailynotes/screens/loginScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    home: LoginScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

// import 'package:dailynotes/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Web App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final TextEditingController _noteController = TextEditingController();
//   CollectionReference _notesCollection =
//       FirebaseFirestore.instance.collection('notes');

//   void _addNote() {
//     _notesCollection.add({'content': _noteController.text});
//     _noteController.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Daily Notes'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _noteController,
//               decoration: InputDecoration(
//                 labelText: 'Enter a note',
//               ),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: _addNote,
//             child: Text('Add Note'),
//           ),
//           StreamBuilder<QuerySnapshot>(
//             stream: _notesCollection.snapshots(),
//             builder:
//                 (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//               if (snapshot.hasError) {
//                 return Text('Error: ${snapshot.error}');
//               }

//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return CircularProgressIndicator();
//               }

//               return Expanded(
//                 child: ListView(
//                   children:
//                       snapshot.data!.docs.map((DocumentSnapshot document) {
//                     return ListTile(
//                       title: Text(document['content']),
//                     );
//                   }).toList(),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
