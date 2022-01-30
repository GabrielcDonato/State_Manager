import 'package:flutter/material.dart';
import 'package:state_manager/src/builder.dart';
import 'package:state_manager/src/reactive.dart';

class HomeReactive extends Reactive<bool> {
  HomeReactive() : super(false);
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final reactive1 = HomeReactive();
  final reactive2 = HomeReactive();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: const Text("Tap reactive 1"),
            onPressed: () {
              reactive1.update(!reactive1.value);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ReactiveBuilder<bool>(
            reactive: reactive1,
            builder: (_, value) => value
                ? Container(
                    width: 200,
                    height: 200,
                    color: Colors.green,
                    child: const Center(child: Text("Reactive 1")),
                  )
                : Container(
                    width: 200,
                    height: 200,
                    color: Colors.red,
                    child: const Center(child: Text("Reactive 1")),
                  ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            child: const Text("Tap reactive 2"),
            onPressed: () {
              reactive2.update(!reactive2.value);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ReactiveBuilder<bool>(
            reactive: reactive2,
            builder: (_, value) => value
                ? Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                    child: const Center(child: Text("Reactive 2")),
                  )
                : Container(
                    width: 100,
                    height: 100,
                    color: Colors.yellow,
                    child: const Center(child: Text("Reactive 2")),
                  ),
          ),
        ],
      ),
    );
  }
}
