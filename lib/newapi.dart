import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'package:http/http.dart';
import 'package:flutter/material.dart';
void main() => runApp(new MaterialApp(
  home: new homepage(),
));
class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final String url="";
  List data;
  @override
  void initState(){
    super.initState()
    this.getData();
  }Future<List> getData() async{

    final prefs = await SharedPreferences.getInstance();
    String serverUrl = "https://p3ly.com/api";
    final key = 'token';
    final value = prefs.get(key ) ?? 0;

    String myUrl = "$serverUrl/products/";
    http.Response response = await http.get(myUrl,
        headers: {
          'Accept':'application/json',
          'Authorization' : 'Bearer $value'
        });
    //var json.decode(response.body);
  }
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("MHSMSRI"),
        ),
        body: new ListView.builder(
            itemCount: 0,
            itemBuilder: (BuildContext context, int index) {
              return new Container(
                child: new Center(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new Card(
                        child: new Container(
                          child: Text("data"),
                          padding: const EdgeInsets.all(20.0),
                        ),
                      )

                    ],
                  ),
                ),
              );
            })

    );
  }
}
