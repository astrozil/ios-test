import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  var expanded;
  SearchBar({this.expanded});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: widget.expanded ? 200 : 50,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
          boxShadow: kElevationToShadow[6]),
      child: Row(children: [
        ClipOval(
          child: Material(
            type: MaterialType.transparency,
            child: Padding(
                padding: EdgeInsets.all(5),
                child: IconButton(
                  icon: Icon(widget.expanded ? Icons.close : Icons.search),
                  onPressed: () {
                    setState(() {
                      widget.expanded = !widget.expanded;
                    });
                  },
                )),
          ),
        )
      ]),
    );
  }
}
