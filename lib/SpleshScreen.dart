


import 'dart:async';

import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class MyCustomWidget extends StatefulWidget {
  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 10),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    click()
            )
        )
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: double.infinity,
          child: Image(
            image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQccYCigCmxrCnz0MgucIz6kykZFFcCl-cZZ-lbnpnOYVEUoksWNiEd75DiRavaiWlQHWA&usqp=CAU',),
            fit: BoxFit.fill,height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,),
        )
    );
  }
}
