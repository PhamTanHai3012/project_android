import 'package:flutter/material.dart';
import 'package:tanhai_63133878/TH1/page_home.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PageHome(),
      debugShowCheckedModeBanner: false,
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
  TextEditingController nameController = TextEditingController();

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
        actions: [
          Icon(Icons.home),
          SizedBox(width: 15,),
          Icon(Icons.share),
          SizedBox(width:15,),
          Icon(Icons.call),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
              children:[
                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        _counter--;
                      });
                    },
                    child: Icon(Icons.remove)
                ),
                Text("$_counter"),
                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        _counter++;
                      });
                    },
                    child: Icon(Icons.add)
                ),
                ElevatedButton(
                    onPressed: (){
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                        content: Text("This is snackbar"),
                        duration: Duration(seconds: 30),
                        action: SnackBarAction(
                          label: "closer",
                          onPressed: (){
                            ScaffoldMessenger.of(context).clearSnackBars();
                          },
                        ),
                      ));
                    },
                    child: Text("show snackbar")
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      labelText: "Name",
                      hintText: "Nhap ten vao day"
                  ),
                ),
                ElevatedButton(
                    onPressed: (){
                      print("${nameController.text}");
                    },
                    child: Text("Submit")
                )
              ]
          )
      ),
    );
  }
}