import 'package:tanhai_63133878/app_state/changenotifier_counter.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CounterProvider extends StatelessWidget {
  const CounterProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CounterState(),
        child: PageCounter(),
    );
  }
}

class PageCounter extends StatelessWidget {
  const PageCounter({super.key});

  @override
  Widget build(BuildContext context) {
    //var counterState = context.watch<CounterState>();
    int? v = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Example"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  var c = context.read<CounterState>().tang();
                },
                child: Text("+", style: TextStyle(fontSize: 20))
            ),
            Consumer<CounterState>(
                child: Text("$v", style: TextStyle(fontSize: 20, color: Colors.red)),
                builder: (context, value, child) {
                  v = value.count;
                  return Column(
                    children: [
                      Text("${value.count}", style: TextStyle(fontSize: 20)),
                    ],
                  );
                }
            ),
            ElevatedButton(
                onPressed: (){
                  var c = context.read<CounterState>().giam();
                },
                child: Text("-", style: TextStyle(fontSize: 20))),
          ],
        ),
      ),
    );
  }
}
