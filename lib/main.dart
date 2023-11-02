import 'package:flutter/material.dart';

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

//Code is entered here
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final dollarTextField = TextEditingController();
  final euroTextField = TextEditingController();
  double _dollars = 0;
  double _euros = 0;
  double _conversionRate = 1.06;

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
        title: Text('CIS 3334 Currency Converter'),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            TextField(controller: dollarTextField, keyboardType: TextInputType.number),
            Text('Dollars'),
            ElevatedButton(
              child: Text("Convert to Euros"),
              onPressed: (){
                print("Convert to Euros button pressed");
                _dollars = double.parse(dollarTextField.text);
                _euros = _dollars / _conversionRate;
                euroTextField.text = _euros.toStringAsFixed(2);
                print(_euros);
              },
            ),

            TextField(controller: euroTextField, keyboardType: TextInputType.number),
            Text('Euros'),
            ElevatedButton(
              child: Text("Convert to Dollars"),
              onPressed: (){
                print("Convert to Dollars button pressed");
                _euros = double.parse(euroTextField.text);
                _dollars = _euros * _conversionRate;
                dollarTextField.text = _dollars.toStringAsFixed(2);
                print(_dollars);
              },
            )
          ],


        ),
      ),
    );
  }
}
