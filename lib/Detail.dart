

import 'package:flutter/material.dart';

import 'Modal.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.model}) : super(key: key);

  final Model model;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Detail Page'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: Theme(
        data: Theme.of(context),
        child: Stack(
          children: [
            Container(
              child: Image(
                image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSipC8JSzhFGJ0MIlMkLQXZ13MIi2dlLTjj6Q&usqp=CAU',
                ),
                fit: BoxFit.fill,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 20, top: 50, right: 20),
                child: Column(
                  children: [
                    Center(
                      child: RotationTransition(
                        turns: _controller,
                        child: Image.network(
                          widget.model.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          '${widget.model.name}',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      child: Text(
                        '☝️Position: ${widget.model.position}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      child: Text(
                        '☝️ Velocity: ${widget.model.velocity}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                        width: double.infinity,
                        child: Text('☝️ Distance: ${widget.model.distance}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ))),
                    SizedBox(height: 10),
                    Container(
                      child: Text(
                        '☝️ Description: ${widget.model.description}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}