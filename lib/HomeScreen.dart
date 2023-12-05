import 'dart:convert';

import 'package:animetoor/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Modal.dart';


class click extends StatefulWidget {
  Model model = Model(
      name: '',
      position: '',
      image: '',
      velocity: '',
      distance: '',
      description: '');
  click({
    Key,
    key,
  });

  @override
  State<click> createState() => _clickState();
}

List<Model> modelList = [];

class _clickState extends State<click> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCj_PaH6VaE5TY7UJ6hlJ0y8iOOJKH5a3Umw&usqp=CAU'),fit: BoxFit.fill,)
        ),
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              String dataString = await rootBundle.loadString('assets/Plente.json');
              List jsonData = jsonDecode(dataString);
              modelList = Model.parseList(jsonData);
              print(modelList);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SlideAnimationn()));
              setState(() {});
            },
            child: Text('On Taped',style: TextStyle(color: Colors.pink)),
          ),
        ),
      ),
    );
  }
}