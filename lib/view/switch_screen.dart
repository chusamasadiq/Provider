import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/switch_provider.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({Key? key}) : super(key: key);

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  bool switchState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<SwitchProvider>(
              builder: (context, value, child) {
                return Switch(
                  value: value.isSwitched,
                  onChanged: (val) {
                    setState(() {
                      switchState = val;
                    });
                    value.toggleSwitch(val);
                  },
                  activeColor: Colors.green,
                );
              },
            ),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: switchState ? Colors.amber : Colors.green,
                border: Border.all(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
