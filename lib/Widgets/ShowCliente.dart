import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowCliente extends StatefulWidget {
  final String cliente;

  ShowCliente({
    this.cliente,
  });
  @override
  _ShowClienteState createState() => _ShowClienteState();
}

class _ShowClienteState extends State<ShowCliente> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
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
            margin: EdgeInsets.only(bottom: 5, left: 15, right: 15, top: 5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: hovered
                    ? [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 13.0,
                          spreadRadius: 0,
                        )
                      ]
                    : []),
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 15),
                          SizedBox(width: 15),
                          Text(
                            widget.cliente,
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              widget.cliente,
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black45,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}
