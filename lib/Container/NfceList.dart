import 'dart:convert';

import 'package:api/Widgets/ShowNFCE.dart';
import 'package:api/service/api.dart';
import 'package:api/service/json.dart';
import 'package:flutter/material.dart';
import 'package:smooth_scroll_web/smooth_scroll_web.dart';

class NfceList extends StatefulWidget {
  final int page;
  NfceList({this.page});

  @override
  _NfceListState createState() => _NfceListState();
}

class _NfceListState extends State<NfceList> {
  CuponsPagamentos info;
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getCuponsPagamentos(page: widget.page + 1),
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          info = CuponsPagamentos.fromJson(jsonDecode(snapshot.data));
          return SmoothScrollWeb(
            controller: controller,
            child: Container(
              child: Scrollbar(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: controller,
                  scrollDirection: Axis.vertical,
                  itemCount: info.pagamentos.length,
                  itemBuilder: (context, index) {
                    return ShowNFCE(
                      color: Colors.green,
                      name: info.pagamentos[index].nome,
                      forma: info.pagamentos[index].forma,
                      data: info.pagamentos[index].emissao,
                      numeracaoNFCE:
                          info.pagamentos[index].numeracaonfce.toString(),
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
