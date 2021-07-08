import 'dart:convert';

import 'package:api/Container/ProdutoList.dart';
import 'package:api/Widgets/TitleCard.dart';
import 'package:api/Screen/LoadingScreen.dart';
import 'package:api/service/api.dart';
import 'package:api/service/json.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProdutoScreen extends StatefulWidget {
  ProdutoScreen({Key key}) : super(key: key);

  @override
  _ProdutoScreenState createState() => _ProdutoScreenState();
}

class _ProdutoScreenState extends State<ProdutoScreen> {
  ListarProdutos info;
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WindowBorder(
        color: Color(0xFF1d1d1d),
        width: 1,
        child: FutureBuilder<String>(
          future: getListarProdutos(),
          builder: (context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              info = ListarProdutos.fromJson(jsonDecode(snapshot.data));
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TitleCard(title: 'Produtos'),
                    SizedBox(height: 5),
                    Expanded(
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: _controller,
                        itemCount: info.total,
                        itemBuilder: (context, index) {
                          return ProdutoList(
                            page: index,
                          );
                        },
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: _controller, // PageController
                      count: info.total,
                      effect: ScrollingDotsEffect(
                          activeDotColor:
                              Colors.black54), // your preferred effect
                      onDotClicked: (index) {
                        if (index == _controller.page + 1) {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 560),
                            curve: Curves.easeIn,
                          );
                        } else if (index == _controller.page - 1) {
                          _controller.previousPage(
                            duration: Duration(milliseconds: 560),
                            curve: Curves.easeIn,
                          );
                        } else {
                          _controller.jumpToPage(index);
                        }
                      },
                    ),
                    SizedBox(height: 10),
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
                title: 'Produtos',
              );
            }
          },
        ),
      ),
    );
  }
}
