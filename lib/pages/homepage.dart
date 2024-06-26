

import 'package:flutter/material.dart';
import 'package:training/model/datamodel.dart';
import 'package:training/pages/itemDesc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<String> itemname = ['Tv', 'Laptop', 'Computer', 'Mobile'];
  static List<String> price = [
    'Rs.20,000',
    'Rs.60,000',
    'Rs.50,000',
    'Rs.12,000'
  ];
  static List<String> desc = [
    'Display :-2K , Color:- Black , Size:- 32inch',
    'Display :-2K , Color:- Black , Size:- 19.2inch, RAM:- 4GB',
    'Display :-2K , Color:- Black , Size:- 24inch, RAM:- 4GB',
    'Color:- Black ,Camera:- 48m, RAM:- 4GB , ROM:- 64GB'
  ];
  static List images = [
    'assets/images/Tv.png',
    'assets/images/Laptop.png',
    'assets/images/computer.png',
    'assets/images/mobile.png'
  ];
  final List<ItemDataModel> itemdata = List.generate(
      itemname.length,
      (index) => ItemDataModel(
          itemname[index],
          '${images[index]}',
          '${itemname[index]} cost:- ${price[index]} ',
          'More info ${desc[index]}'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: ListView.builder(
            itemCount: itemdata.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(itemdata[index].name),
                  subtitle: Text(price[index]),
                  leading: SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset(itemdata[index].Image),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ItemDetail(
                              itemDataModel: itemdata[index],
                            )));
                  },
                ),
              );
            }));
  }
}
