import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_3/result_screen.dart';
import '/user_model.dart';

class GameScreen extends StatefulWidget {
  final User user;
  const GameScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Future<bool> goBack(BuildContext context) async {
    print("Navigator go back button is pressed.");
    //if returns false, does not navigate back
    //if returns true, it navigates back
    return true;
  }

  @override
  Widget build(BuildContext context) {
    var user = widget.user;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            print("Appbar go back button is pressed.");
            Navigator.pop(context);
          },
        ),
      ),
      body: WillPopScope(
        onWillPop: () => goBack(context), //to handle native Android back button
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                  "${user.name} | ${user.height} | ${user.age} | ${user.isSingle}"),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ResultScreen()));
                  },
                  child: const Text("Game Over")),
            ],
          ),
        ),
      ),
    );
  }
}
