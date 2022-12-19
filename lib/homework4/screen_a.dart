import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_3/homework4/screen_b.dart';

class ScreenA extends StatelessWidget {
  const ScreenA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen A"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ScreenB())),
            child: const Text("Go to Screen B")),
      ),
    );
  }
}
