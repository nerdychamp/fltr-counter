import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('counter'),
        ),
        body: const Center(
          child: Counter(),
        ),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _Counter();
}

class _Counter extends State<Counter> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 20,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Counter',
          style: Theme.of(context).textTheme.headline4,
        ),
        CounterDisplay(counter: counter),
        Wrap(direction: Axis.horizontal, spacing: 20, children: [
          removeButton(),
          AddButton(onPress: incrementCounter),
        ])
      ],
    );
  }

  Widget removeButton() {
    return Button(
        onPressed: () {
          setState(() {
            counter--;
          });
        },
        child: const Icon(Icons.remove));
  }
}

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({super.key, required this.counter});

  final int counter;

  @override
  Widget build(BuildContext context) {
    return (Text(
      '$counter',
      style: const TextStyle(color: Colors.black, fontSize: 32),
    ));
  }
}

class AddButton extends StatelessWidget {
  const AddButton({required this.onPress, super.key});

  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Button(
      onPressed: onPress,
      child: const Icon(Icons.add),
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(16),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: child);
  }
}
