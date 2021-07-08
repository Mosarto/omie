import 'dart:convert';

import 'package:api/Widgets/ShowCliente.dart';
import 'package:api/service/api.dart';
import 'package:api/service/json.dart';
import 'package:flutter/material.dart';
import 'package:smooth_scroll_web/smooth_scroll_web.dart';

class ClientList extends StatefulWidget {
  final int page;
  ClientList({this.page});

  @override
  _ClientListState createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  ListarClientes info;
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getListarClientes(page: widget.page + 1),
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          info = ListarClientes.fromJson(jsonDecode(snapshot.data));
          return SmoothScrollWeb(
            controller: controller,
            child: Container(
              padding: EdgeInsets.only(
                bottom: 10,
              ),
              child: Scrollbar(
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: controller,
                  scrollDirection: Axis.vertical,
                  itemCount: info.cliente.length,
                  itemBuilder: (context, index) {
                    return ShowCliente(
                      cliente: info.cliente[index].nome.toString(),
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
