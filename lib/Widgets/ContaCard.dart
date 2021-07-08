import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContaCard extends StatefulWidget {
  final String name;
  final String forma;
  ContaCard({this.name, this.forma});

  @override
  _ContaCardState createState() => _ContaCardState();
}

class _ContaCardState extends State<ContaCard> {
  bool hovered = false;
  IconData icon;
  Color color;

  @override
  Widget build(BuildContext context) {
    if (widget.forma == 'CX') {
      icon = Icons.attach_money_outlined;
      color = Colors.green;
    } else if (widget.forma == 'CC') {
      icon = Icons.money;
      color = Colors.red;
    } else if (widget.forma == 'AC') {
      icon = Icons.payment;
      color = Colors.blue;
    } else if (widget.forma == 'CN') {
      icon = Icons.data_usage;
      color = Colors.yellow;
    }
    return MouseRegion(
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
        height: 100,
        width: 150,
        margin: EdgeInsets.only(right: 15, left: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: hovered
                ? [
                    BoxShadow(
                      color: color,
                      blurRadius: 13.0,
                      spreadRadius: 0,
                    )
                  ]
                : [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 13.0,
                      spreadRadius: 0,
                    )
                  ]),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                child: Icon(
                  icon,
                  color: color,
                  size: 50,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Text(
                  widget.name,
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
