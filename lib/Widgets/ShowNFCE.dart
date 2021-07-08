import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowNFCE extends StatefulWidget {
  final Color color;
  final String name;
  final String data;
  final String forma;
  final String numeracaoNFCE;

  ShowNFCE({
    this.color,
    this.name,
    this.data,
    this.forma,
    this.numeracaoNFCE,
  });

  @override
  _ShowNFCEState createState() => _ShowNFCEState();
}

class _ShowNFCEState extends State<ShowNFCE> {
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
                          Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                              color: widget.color.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.check,
                                color: widget.color,
                                size: 22,
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            widget.name,
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
                              widget.forma,
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              widget.data,
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black45,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              widget.numeracaoNFCE,
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black87,
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
