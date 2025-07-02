import 'package:flutter/material.dart';

class BottomsScreen extends StatelessWidget {
  const BottomsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              'ボトムス',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
