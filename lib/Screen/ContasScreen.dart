import 'dart:convert';

import 'package:api/Widgets/ContaCard.dart';
import 'package:api/Widgets/TitleCard.dart';
import 'package:api/service/api.dart';
import 'package:api/service/json.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:smooth_scroll_web/smooth_scroll_web.dart';

import 'LoadingScreen.dart';

class ContasScreen extends StatefulWidget {
  @override
  _ContasScreenState createState() => _ContasScreenState();
}

class _ContasScreenState extends State<ContasScreen> {
  ListarContas info;
  ScrollController controller = ScrollController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: WindowBorder(
        color: Color(0xFF1d1d1d),
        width: 1,
        child: FutureBuilder<String>(
          future: getListarContasCorrentes(),
          builder: (context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              info = ListarContas.fromJson(jsonDecode(snapshot.data));
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TitleCard(title: 'Contas'),
                    SizedBox(height: 5),
                    Expanded(
                      child: SmoothScrollWeb(
                        controller: controller,
                        child: Container(
                          child: Scrollbar(
                            child: GridView.count(
                              physics: NeverScrollableScrollPhysics(),
                              crossAxisCount:
                                  MediaQuery.of(context).size.width.toInt() ~/
                                      200,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 40,
                              padding: EdgeInsets.only(
                                  left: 10, bottom: 10, top: 20, right: 10),
                              controller: controller,
                              scrollDirection: Axis.vertical,
                              children: List.generate(
                                info.conta.length,
                                (index) {
                                  return ContaCard(
                                    name: info.conta[index].descricao,
                                    forma: info.conta[index].tipo,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      snapshot.error.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              );
            } else {
              return LoadingScreen(
                title: 'Contas',
              );
            }
          },
        ),
      ),
    );
  }
}
