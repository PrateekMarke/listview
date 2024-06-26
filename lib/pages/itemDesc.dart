import 'package:flutter/material.dart';

import 'package:training/model/datamodel.dart';

class ItemDetail extends StatelessWidget {
  final ItemDataModel itemDataModel;

  const ItemDetail({super.key, required this.itemDataModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(itemDataModel.name),),
      body: SingleChildScrollView(
        child: Center(
        child: Column(
        children: [
          Image.asset(itemDataModel.Image,
                  width: 350, height: 300),
          const SizedBox(
            height: 10,
          ),
          Text(itemDataModel.price,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          const SizedBox(
            height: 10,
          ),
          Text(itemDataModel.desc,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
        ],                                  
      ),
        ),
      ),
    );
  }
}