import 'package:flutter/material.dart';

class StatelessScreen extends StatelessWidget {
  StatelessScreen({Key? key}) : super(key: key);

  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless Widget'),
        centerTitle: true,
      ),
      body: Center(
        child: ValueListenableBuilder(
            valueListenable: _counter,
            builder: (BuildContext context, value, child) {
              return Text(_counter.value.toString());
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
