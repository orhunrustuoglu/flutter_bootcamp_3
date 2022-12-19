import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_3/homework4/screen_y.dart';

class ScreenB extends StatelessWidget {
  const ScreenB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen B"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ScreenY())),
            child: const Text("Go to Screen Y")),
      ),
    );
  }
}
