import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowProduto extends StatefulWidget {
  final Color color;
  final String descricao;
  final String unidade;
  final String valor;

  ShowProduto({
    this.color,
    this.descricao,
    this.unidade,
    this.valor,
  });

  @override
  _ShowProdutoState createState() => _ShowProdutoState();
}

class _ShowProdutoState extends State<ShowProduto> {
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
                                Icons.shopping_bag_rounded,
                                color: widget.color,
                                size: 22,
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Text(
                            widget.descricao,
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
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              widget.unidade,
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
                              widget.valor,
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
