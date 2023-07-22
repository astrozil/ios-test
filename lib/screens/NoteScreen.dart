import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteScreen extends StatefulWidget {
  String note;
  NoteScreen({required this.note});
  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 235, 223),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 235, 223),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 100, 40, 100),
                child: Text(
                  widget.note,
                  style: GoogleFonts.lato(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
