import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_3/homework4/screen_a.dart';
import 'package:flutter_bootcamp_3/homework4/screen_x.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ScreenA())),
                child: const Text("Go to Screen A")),
            ElevatedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ScreenX())),
                child: const Text("Go to Screen X")),
          ],
        ),
      ),
    );
  }
}
