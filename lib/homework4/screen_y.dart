import 'package:flutter/material.dart';

class ScreenY extends StatelessWidget {
  const ScreenY({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen Y"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: (() =>
              Navigator.of(context).popUntil((route) => route.isFirst)),
        ),
      ),
      body: const Center(
          child:
              Text("Go Back To The Home Screen by The Arrow Button Above...")),
    );
  }
}
