import 'package:api/Widgets/MenuButtons.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleCard extends StatefulWidget {
  final String title;

  TitleCard({this.title});

  @override
  _TitleCardState createState() => _TitleCardState();
}

class _TitleCardState extends State<TitleCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      margin: EdgeInsets.only(
        left: 15,
      ),
      child: WindowTitleBarBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back,
              ),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              iconSize: 28,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              width: 55,
            ),
            Expanded(
              child: MoveWindow(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    widget.title,
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: WindowButtons(),
            ),
          ],
        ),
      ),
    );
  }
}
