import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              '通知',
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
