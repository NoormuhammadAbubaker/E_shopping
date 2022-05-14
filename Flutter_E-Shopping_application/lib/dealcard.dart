import 'package:flutter/material.dart';

class Dealcard extends StatefulWidget {
  final String dealimage;
  final String dealsize1;
  final String dealsize2;
  final String dealsize3;
  final String dealprize;
  const Dealcard(
      {Key? key,
      required this.dealimage,
      required this.dealsize1,
      required this.dealprize,
      required this.dealsize2,
      required this.dealsize3})
      : super(key: key);

  @override
  _DealcardState createState() => _DealcardState();
}

class _DealcardState extends State<Dealcard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 300,
      child: Card(
        //elevation: 30.0,
        color: Colors.white70,
        child: Stack(
          children: [
            Positioned(
              left: 5,
              top: 5,
              child: Container(
                height: 120,
                width: 120,
                child: Image(image: AssetImage(widget.dealimage)),
              ),
            ),
            Stack(
              children: [
                Positioned(
                  top: 5,
                  left: 40,
                  child: Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        color: Colors.white,
                        child: Text(widget.dealsize1,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(width: 5),
                      Container(
                        height: 20,
                        width: 20,
                        child: Text(widget.dealsize2,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        color: Colors.white,
                      ),
                      SizedBox(width: 5),
                      Container(
                        height: 20,
                        width: 20,
                        child: Text(widget.dealsize3,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              left: 130,
              top: 10,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text('Exhaust flex Pipe',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Tube Light',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(widget.dealprize,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54,
                              wordSpacing: 12)),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
