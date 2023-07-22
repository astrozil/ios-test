import 'package:dailynotes/parts/search_bar.dart';
import 'package:dailynotes/screens/AddScreen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staggered_grid_view_flutter/staggered_grid_view_flutter.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import 'NoteScreen.dart';

class LockScreenForMe extends StatefulWidget {
  const LockScreenForMe({super.key});

  @override
  State<LockScreenForMe> createState() => _LockScreenForMeState();
}

class _LockScreenForMeState extends State<LockScreenForMe> {
  var items = FirebaseFirestore.instance
      .collection("notes")
      .orderBy('timestamp', descending: true)
      .snapshots();
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 235, 223),
      appBar: AppBar(toolbarHeight: 0),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Boom",
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(70),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return AddScreen();
                      }));
                    },
                    child: Icon(Icons.add),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black)),
                  ),
                )
              ],
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: items,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width - 100,
                child: StaggeredGridView.countBuilder(
                  staggeredTileBuilder: (index) =>
                      StaggeredTile.count(2, index % 4 == 0 ? 2 : 1),
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot document = snapshot.data!.docs[index];

                    return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext conntext) {
                            return NoteScreen(note: document['note']);
                          }));
                        },
                        child: NoteBox(document['note'], document['day'],
                            document['month'], document['year']));
                  },
                ),
              );
            },
          ),
        ]),
      ),
    );
  }

  Widget NoteBox(String note, var day, var month, var year) {
    double Width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height / 3,
      width: Width / 2.5,
      decoration: BoxDecoration(
          color: Colors.black87, borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Container(
                  height: 8,
                  width: 8,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                ),
                SizedBox(
                  width: 2,
                ),
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.yellow),
                ),
                SizedBox(
                  width: 2,
                ),
                Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green),
                )
              ],
            ),
          ),
          Center(
            child: Text(
              "${day}/${month}/${year}",
              style: GoogleFonts.lato(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
