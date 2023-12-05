import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

import 'Detail.dart';
import 'HomeScreen.dart';
import 'Modal.dart';
import 'main.dart';

class SlideAnimationn extends StatefulWidget {
  @override
  State<SlideAnimationn> createState() => _SlideAnimationnState();
}

class _SlideAnimationnState extends State<SlideAnimationn> {
  Model model = Model(
      name: '',
      position: '',
      image: '',
      velocity: '',
      distance: '',
      description: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          backgroundColor: Colors.white.withOpacity(0.50),
          actions: [
            IconButton(
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .ChangeTheme();
              },
              icon: (Provider.of<ThemeProvider>(context).isDrak)
                  ? Icon(Icons.dark_mode_outlined)
                  : Icon(Icons.light_mode_outlined),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(

            width: double.infinity,
            child: Image(
              image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQYNxwysMIVdYWTvVQmRPOnXfPqjG43UHDMA&usqp=CAU'),
              fit: BoxFit.fill,height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width
            ),
          ),
          ListView.builder(
              padding: EdgeInsets.all(30),
              itemCount: modelList.length,
              itemBuilder: (context, index) {
                Model model = modelList[index];
                return AnimationConfiguration.staggeredList(
                    position: index,
                    delay: Duration(milliseconds: 300),
                    child: FadeInAnimation(
                        curve: Curves.fastLinearToSlowEaseIn,
                        duration: Duration(milliseconds: 2500),
                        child: InkWell(
                          onTap: () {
                            print('Tapped on ${model.name}');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(model: model),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20),
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.50),
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 40,
                                  spreadRadius: 10,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                model.name,style: TextStyle(decoration: TextDecoration.underline),
                              ),
                            ),
                          ),
                        )));
              }
              ),
        ],
      ),
    );
  }
}