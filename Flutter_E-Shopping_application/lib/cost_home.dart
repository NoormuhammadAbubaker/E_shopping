import 'package:flutter/material.dart';

class CostHome extends StatefulWidget {
  final String Category_image;
  final String Category_text;

  const CostHome(
      {Key? key, required this.Category_image, required this.Category_text})
      : super(key: key);

  @override
  _CostHomeState createState() => _CostHomeState();
}

class _CostHomeState extends State<CostHome> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white60,
      //elevation: 10,
      child: Stack(
        children: [
          Card(
            //elevation: 30,
            color: Colors.white60,
            child: Container(
              height: 60,
              width: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage(widget.Category_image),
                      fit: BoxFit.fill)),
            ),
          ),
          Stack(
            children: [
              Positioned(
                top: 68,
                left: 30,
                child: Text(
                  widget.Category_text,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
