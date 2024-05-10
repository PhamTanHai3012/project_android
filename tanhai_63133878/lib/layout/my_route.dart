import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String? data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(data ?? "Đợi..."),
            ElevatedButton(
                onPressed: () async{
                  data = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SecondPage(data: "Xin chào",),)
                  );
                  setState(() { // Build lại giao diện

                  });
                },
                child: Text("To Second")
            )
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  String? data;
  SecondPage({super.key, this.data});

  @override
  State<SecondPage> createState() => _SecondState();
}

class _SecondState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(widget.data?? "Không có gì"),
            ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop("Cảm ơn");
                },
                child: Text("Go back")
            )
          ],
        ),
      ),
    );
  }
}