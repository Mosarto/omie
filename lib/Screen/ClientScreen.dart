import 'dart:convert';
import 'package:api/Container/ClientList.dart';
import 'package:api/Widgets/TitleCard.dart';
import 'package:api/Screen/LoadingScreen.dart';
import 'package:api/service/api.dart';
import 'package:api/service/json.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ClientScreen extends StatefulWidget {
  ClientScreen({Key key}) : super(key: key);

  @override
  _ClientScreenState createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  ListarClientes info;
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WindowBorder(
        color: Color(0xFF1d1d1d),
        width: 1,
        child: FutureBuilder<String>(
          future: getListarClientes(page: 1),
          builder: (context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              info = ListarClientes.fromJson(jsonDecode(snapshot.data));
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TitleCard(title: 'Clientes'),
                    SizedBox(height: 5),
                    Expanded(
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: _controller,
                        itemCount: info.total,
                        itemBuilder: (context, index) {
                          return ClientList(
                            page: index,
                          );
                        },
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: _controller,
                      count: info.total,
                      effect: ScrollingDotsEffect(
                        activeDotColor: Colors.black54,
                      ),
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
                title: 'Clientes',
              );
            }
          },
        ),
      ),
    );
  }
}
