import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  MainAxisAlignment alignment = MainAxisAlignment.center;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: alignment,
          children: <Widget>[
            const Text(
              'You have pushed the add button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        backgroundColor: Colors.blue[700],
        overlayOpacity: 0.1,
        icon: Icons.more_horiz_sharp,
        children: [
          SpeedDialChild(
              child: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          )),
          SpeedDialChild(
              child: FloatingActionButton(
            onPressed: () => setState(() {
              alignment = changeLayout(alignment.index);
            }),
            tooltip: 'Change layout',
            child: const Icon(Icons.layers_outlined),
          ))
        ],
      ),
    );
  }

  MainAxisAlignment changeLayout(int index) {
    int cantidadDeLayoutsDisponibles = MainAxisAlignment.values.length - 1;
    if (index == cantidadDeLayoutsDisponibles) {
      return MainAxisAlignment.values[0];
    }
    return MainAxisAlignment.values[index + 1];
  }
}
