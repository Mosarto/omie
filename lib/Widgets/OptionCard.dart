import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class OptionCard extends StatefulWidget {
  final Color color;
  final String name;
  final IconData icon;
  final Widget screen;

  OptionCard({
    this.color,
    this.name,
    this.icon,
    this.screen,
  });

  @override
  _OptionCardState createState() => _OptionCardState();
}

class _OptionCardState extends State<OptionCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.fade,
            child: widget.screen,
          ),
        );
      },
      child: MouseRegion(
        onEnter: (value) {
          setState(() {
            hovered = true;
          });
        },
        onExit: (value) {
          setState(() {
            hovered = false;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 275),
          height: hovered ? 160 : 155,
          width: hovered ? 200 : 195,
          margin: EdgeInsets.only(right: 15, left: 10),
          decoration: BoxDecoration(
              color: hovered ? widget.color : Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ]),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  child: Icon(
                    widget.icon,
                    color: !hovered ? Colors.black : Colors.white,
                    size: 50,
                  ),
                ),
                SizedBox(
                  width: 13,
                ),
                Container(
                  child: Text(
                    widget.name,
                    style: GoogleFonts.quicksand(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      color: hovered ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
