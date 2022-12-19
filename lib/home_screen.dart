import 'package:flutter/material.dart';
import '/game_screen.dart';
import '/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  int count = 0;
  bool control = false;

  @override
  void initState() {
    super.initState();
    print("InitState worked.");
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    //super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.inactive) print("State is inactive.");
    if (state == AppLifecycleState.paused) print("State is paused.");
    if (state == AppLifecycleState.resumed) print("State is resumed.");
    if (state == AppLifecycleState.detached) print("State is detached.");
  }

  Future<int> sumAll(int n1, int n2) async {
    //requires .toInt() if the method is defined like: sumAll(int n1, n2)
    //int sum = (n1 + n2).toInt();
    int sum = n1 + n2;
    return sum;
  }

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
            Text(
              "Counter: $count",
              style: const TextStyle(fontSize: 36),
            ),
            ElevatedButton(
                onPressed: () => setState(() => count++),
                child: const Text("Press Me")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GameScreen(
                              user: User(
                                  age: 34,
                                  height: 1.71,
                                  isSingle: true,
                                  name: "Ahmet")))).then((value) {
                    print("Returned to the Main Screen");
                  });
                },
                child: const Text("Start")),
            //Visible is alternative to if(visible)
            Visibility(visible: control, child: const Text("HELLO")),
            Text(
              control ? "HELLO" : "X",
              style: TextStyle(color: control ? Colors.green : Colors.red),
            ),
            //code below showcases how to return widgets with if/else statements
            //must return a widget for each case
            //can not return null! return Container() instead
            (() {
              if (control) {
                return const Text(
                  "HELLO",
                  style: TextStyle(color: Colors.amber),
                );
              } else {
                return const Text(
                  "X",
                  style: TextStyle(color: Colors.purple),
                );
              }
            }()),
            ElevatedButton(
                onPressed: () => setState(() {
                      control = true;
                      print("Control: $control");
                    }),
                child: const Text("State 1: true")),
            ElevatedButton(
                onPressed: () => setState(() {
                      control = false;
                      print("Control: $control");
                    }),
                child: const Text("State 2: false")),
            //FutureBuilder is used for database query operations
            FutureBuilder<int>(
                future: sumAll(10, 20),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text("Something went wrong.");
                  }
                  if (snapshot.hasData) {
                    return Text("Result: ${snapshot.data}");
                  } else {
                    return const Text("Snapshot has no data!");
                  }
                })
          ],
        ),
      ),
    );
  }
}
