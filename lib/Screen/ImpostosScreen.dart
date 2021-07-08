import 'dart:convert';

import 'package:api/Widgets/ShowNCM.dart';
import 'package:api/Widgets/TitleCard.dart';
import 'package:api/service/json.dart';
import 'package:api/service/api.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:smooth_scroll_web/smooth_scroll_web.dart';

import 'LoadingScreen.dart';

class ImpostoScreen extends StatefulWidget {
  ImpostoScreen({Key key}) : super(key: key);

  @override
  _ImpostoScreenState createState() => _ImpostoScreenState();
}

class _ImpostoScreenState extends State<ImpostoScreen> {
  ListarNCM info;
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WindowBorder(
        color: Color(0xFF1d1d1d),
        width: 1,
        child: FutureBuilder<String>(
          future: getListarNCM(),
          builder: (context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              info = ListarNCM.fromJson(jsonDecode(snapshot.data));
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TitleCard(title: 'Impostos'),
                    SizedBox(height: 5),
                    Expanded(
                      child: SmoothScrollWeb(
                        controller: controller,
                        child: Container(
                          child: Scrollbar(
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              controller: controller,
                              scrollDirection: Axis.vertical,
                              itemCount: info.ncm.length,
                              itemBuilder: (context, index) {
                                return ShowNCM(
                                  descricao:
                                      info.ncm[index].descricao.toString(),
                                  codigo: info.ncm[index].codigo.toString(),
                                );
                              },
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
                title: 'Impostos',
              );
            }
          },
        ),
      ),
    );
  }
}
