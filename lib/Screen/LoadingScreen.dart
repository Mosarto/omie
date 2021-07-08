import 'package:api/Widgets/TitleCard.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  final String title;
  const LoadingScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TitleCard(
              title: title,
            ),
            Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
