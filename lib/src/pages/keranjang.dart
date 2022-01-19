import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class pageKeranjang extends StatefulWidget {
  // const pageKeranjang({ Key? key }) : super(key: key);

  @override
  _pageKeranjangState createState() => _pageKeranjangState();
}

class _pageKeranjangState extends State<pageKeranjang> {
  
  Future<List>getData()async{
    final response = await http
    .get(Uri.parse("https://bayucrud.000webhostapp.com/listcart.php"));
    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Keranjang Anda"),
        ),
        body: FutureBuilder<List>(
          future: getData(),
          builder: (context, snapshot){
            if(snapshot.hasError)print(snapshot.error);

            return snapshot.hasData
            ? new ItemList(
              list: snapshot.data,
            )
            : new Center(
              child: CircularProgressIndicator(),
            );
          },
          ),
      )
      
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i){
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]['merk']),
                leading: new Icon(Icons.widgets),
              ),
            ),
          )
        );
      },
      
    );
  }
}