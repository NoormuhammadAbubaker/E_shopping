import 'package:flutter/material.dart';
import 'package:flutter_application_4/cost_home.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  var images_category = [
    Category(name: "Bag", image: 'assets/Onlie_Store/bag.jpg'),
    Category(name: "Beauty", image: 'assets/Onlie_Store/beauty.jpg'),
    Category(name: "fashion", image: 'assets/Onlie_Store/fashion.jpg'),
    Category(name: "Home", image: 'assets/Onlie_Store/home.jpg'),
    Category(name: "Kitchen", image: 'assets/Onlie_Store/kitchen.jpg'),
    Category(name: "Music", image: 'assets/Onlie_Store/music.jpg'),
    Category(name: "Travel", image: 'assets/Onlie_Store/travel.jpg'),
    Category(name: "Watch", image: 'assets/Onlie_Store/watch.jpg'),
  ];
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          pinned: true,
          expandedHeight: 250.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Demo'),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              const Text(
                'Popular Categories',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 60),
              ElevatedButton.icon(
                onPressed: () {},
                label: Text('see All'),
                icon: Icon(Icons.navigate_next),
              )
            ],
          ),
        ),
        Expanded(
          flex: 9,
          child: GridView.builder(
              itemCount: images_category.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (BuildContext context, int index) {
                return CostHome(
                    Category_image: images_category[index].image,
                    Category_text: images_category[index].name);
              }),
        ),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('List Item $index'),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Category {
  String name;
  String image;
  Category({required this.name, required this.image});
}
