import 'package:flutter/material.dart';

class FeaturedProduct extends StatefulWidget {
  final String product_price;
  final String product_sold;
  final String product_image;
  const FeaturedProduct(
      {Key? key,
      required this.product_image,
      required this.product_price,
      required this.product_sold})
      : super(key: key);

  @override
  _FeaturedProductState createState() => _FeaturedProductState();
}

class _FeaturedProductState extends State<FeaturedProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      child: Card(
        color: Colors.white70,
        child: Stack(
          children: [
            Positioned(
              top: 5,
              left: 5,
              child: Container(
                height: 200,
                width: 170,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage(widget.product_image),
                      fit: BoxFit.fill,
                    )),
              ),
            ),
            Positioned(
              top: 210,
              left: 20,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Exhaust flex Pipe\nTube Light',
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
                      Text(widget.product_price,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54,
                              wordSpacing: 8)),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.bolt_rounded))
                    ],
                  ),
                  Row(
                    children: [
                      Text('${widget.product_sold} Sold',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                            color: Colors.red[400],
                          )),
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
