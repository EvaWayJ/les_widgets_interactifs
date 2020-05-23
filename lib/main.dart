import 'dart:io';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
int itemSelectionne;
bool iterrupteur = false;
double sliderDouble = 0.0;

List<Widget> radios(){
  List <Widget> l = [];
  for (int x=0; x < 4; x++){
    Row r = new Row(
      children: <Widget>[ 
        new Text('Choix numero ${x+1}'),
        new Radio(
            value: x,
            groupValue: itemSelectionne,
            onChanged: (int i) {
              setState(() {
                itemSelectionne=i;
              });
            }
        )
      ],
    );
    l.add(r);
  }
  return l;
}
  Map check = {
    'Carrote':false,
    'Banane': false,
    'Yaourt':false,
    'Pain' : false
  };

  List<Widget> checkList() {
    List<Widget> l = [];
    check.forEach((key, value) {
      Row row = new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(key, style: new TextStyle(color: value?Colors.green : Colors.red),),
            new Checkbox(
                value: (value),
                onChanged: (bool b) {
              setState(() {
                check[key] = b;
              });
            })
          ]
      );
      l.add(row);
    });
    return l;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child:
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              new Text('Valeur du slider: $sliderDouble'),
              new Slider(
                  value: sliderDouble,
                  min: 0.0,
                  max: 10.0,
                  inactiveColor: Colors.black,
                  activeColor: Colors.pinkAccent,
                  divisions: 5,
                  onChanged: (double d){
                    setState(() {
                      sliderDouble = d;
                    });
        })
            ],
          ),
        )
    );
  }
}
