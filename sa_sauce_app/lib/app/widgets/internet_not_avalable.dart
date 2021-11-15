import 'package:flutter/material.dart';

class InternetNotAvailable extends StatelessWidget {
  const InternetNotAvailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.grey,
      padding: const EdgeInsets.all(16.0),
      child: const Text('Check your Internet Connection',
          style: TextStyle(color: Colors.white, fontSize: 18)),
    );
  }
}
