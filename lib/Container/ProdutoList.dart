import 'dart:convert';

import 'package:api/Widgets/ShowProduto.dart';
import 'package:api/service/api.dart';
import 'package:api/service/json.dart';
import 'package:flutter/material.dart';
import 'package:smooth_scroll_web/smooth_scroll_web.dart';

class ProdutoList extends StatefulWidget {
  final int page;
  ProdutoList({this.page});

  @override
  _ProdutoListState createState() => _ProdutoListState();
}

class _ProdutoListState extends State<ProdutoList> {
  ScrollController controller = ScrollController();
  ListarProdutos info;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getListarProdutos(page: widget.page + 1),
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          info = ListarProdutos.fromJson(jsonDecode(snapshot.data));
          return SmoothScrollWeb(
            controller: controller,
            child: Container(
              child: Scrollbar(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: controller,
                  scrollDirection: Axis.vertical,
                  itemCount: info.produto.length,
                  itemBuilder: (context, index) {
                    return ShowProduto(
                      color: Colors.orange,
                      descricao: info.produto[index].descricao,
                      unidade: info.produto[index].unidade,
                      valor: "R\$${info.produto[index].valor}",
                    );
                  },
                ),
              ),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
