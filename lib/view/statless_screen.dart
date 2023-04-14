import 'package:flutter/material.dart';

class StatelessScreen extends StatelessWidget {
  StatelessScreen({Key? key}) : super(key: key);

  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final ValueNotifier<bool> _toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateless Widget'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ValueListenableBuilder(
                valueListenable: _counter,
                builder: (BuildContext context, value, child) {
                  return Text(_counter.value.toString());
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ValueListenableBuilder(
              valueListenable: _toggle,
              builder: (BuildContext context, value, child){
                return TextFormField(
                  obscureText: _toggle.value,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      suffixIcon: InkWell(
                          onTap: (){
                            _toggle.value = !_toggle.value;
                          },
                          child: Icon(_toggle.value ? Icons.visibility : Icons.visibility_off))
                  ),
                );
              }
            ),
          )
        ],
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
