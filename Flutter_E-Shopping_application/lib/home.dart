import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_4/cost_home.dart';
import 'package:flutter_application_4/dealcard.dart';
import 'package:flutter_application_4/featured_product.dart';
import 'package:flutter_application_4/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = "", pass = "";
  @override
  void initState() {
    getData();

    super.initState();
  }

  void getData() async {
    final prefs = await SharedPreferences.getInstance();

    name = prefs.getString('username')!;
    pass = prefs.getString('password')!;
  }

  final List<String> imgList = [
    'assets/salesadd.jpg',
    'assets/salesadd1.jpg',
    'assets/salesadd2.jpg',
  ];
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
  var deal_list = [
    DealCard(
        deal_image: 'assets/shoe.jpg',
        deal_size1: "08",
        deal_size2: "10",
        deal_size3: "12",
        deal_prize: "\$10.06 USD "),
    DealCard(
        deal_image: 'assets/shirt.jpg',
        deal_size1: "08",
        deal_size2: "10",
        deal_size3: "12",
        deal_prize: "\$12.06 USD "),
    DealCard(
        deal_image: 'assets/pants.jpg',
        deal_size1: "08",
        deal_size2: "10",
        deal_size3: "12",
        deal_prize: "\$12.06 USD "),
  ];
  var featured_product_list = [
    Featured_product(
        featured_image: 'assets/Feature/mobile.jpg',
        featured_price: "\$12.06 USD ",
        featured_sold: "13"),
    Featured_product(
        featured_image: 'assets/Feature/makeup.jpg',
        featured_price: "\$12.06 USD ",
        featured_sold: "15"),
    Featured_product(
        featured_image: 'assets/Feature/perfume.jpg',
        featured_price: "\$12.06 USD ",
        featured_sold: "17"),
    Featured_product(
        featured_image: 'assets/Feature/camera.jpg',
        featured_price: "\$12.06 USD ",
        featured_sold: "13"),
    Featured_product(
        featured_image: 'assets/shirt.jpg',
        featured_price: "\$12.06 USD ",
        featured_sold: "15"),
    Featured_product(
        featured_image: 'assets/pants.jpg',
        featured_price: "\$12.06 USD ",
        featured_sold: "17"),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                    child: Container(
                        padding: EdgeInsets.only(top: 30),
                        child: CarouselSlider(
                          options: CarouselOptions(
                              autoPlay: false,
                              viewportFraction: 20,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                              reverse: true),
                          items: imgList
                              .map((item) => ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.asset(item,
                                        fit: BoxFit.cover, width: 370),
                                  ))
                              .toList(),
                        ))),
                SliverAppBar(
                  shadowColor: Colors.white70,
                  backgroundColor: Colors.white70,
                  pinned: true,
                  title: Container(
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          hintText: 'Search Product',
                          hintStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown[200]),
                          suffixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          )),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Text(
                        name + pass,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 50),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Login()));
                          setState(() {
                            name = '';
                            pass = '';
                          });
                        },
                        label: Text('see All'),
                        icon: Icon(Icons.navigate_next),
                      )
                    ],
                  ),
                ),
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 100,
                      mainAxisSpacing: 1.0,
                      crossAxisSpacing: 4.0,
                      childAspectRatio: 1.0,
                      mainAxisExtent: 100),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return CostHome(
                          Category_image: images_category[index].image,
                          Category_text: images_category[index].name);
                    },
                    childCount: images_category.length,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Container(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Flash sales',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        height: 150.0,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: deal_list.length,
                          itemBuilder: (context, index) {
                            return Container(
                                width: 300.0,
                                child: Dealcard(
                                    dealimage: deal_list[index].deal_image,
                                    dealsize1: deal_list[index].deal_size1,
                                    dealprize: deal_list[index].deal_prize,
                                    dealsize2: deal_list[index].deal_size2,
                                    dealsize3: deal_list[index].deal_size3));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Text(
                        'Featured Product',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 70),
                      ElevatedButton.icon(
                        onPressed: () {},
                        label: Text('see All'),
                        icon: Icon(Icons.navigate_next),
                      )
                    ],
                  ),
                ),
                SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return FeaturedProduct(
                            product_image:
                                featured_product_list[index].featured_image,
                            product_price:
                                featured_product_list[index].featured_price,
                            product_sold:
                                featured_product_list[index].featured_sold);
                      },
                      childCount: featured_product_list.length,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisSpacing: 1.0,
                            crossAxisSpacing: 1.0,
                            childAspectRatio: 1.0,
                            maxCrossAxisExtent: 200,
                            mainAxisExtent: 350)),
              ],
            ),
          ),
        ],
      ),
      //Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 30.0,
          elevation: 50.0,
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          selectedItemColor: Colors.blueGrey,
          unselectedItemColor: Colors.brown,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Category'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_sharp), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'Notification'),
            BottomNavigationBarItem(
                icon: Icon(Icons.contacts), label: 'Profile')
          ]),
    );
  }
}

/*CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Demo'),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 1.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 1.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return CostHome(
                    Category_image: images_category[index].image,
                    Category_text: images_category[index].name);
              },
              childCount: images_category.length,
            ),
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
      ),
    );*/

class Category {
  String name;
  String image;
  Category({required this.name, required this.image});
}

class DealCard {
  String deal_image;
  String deal_size1;
  String deal_size2;
  String deal_size3;
  String deal_prize;
  DealCard(
      {required this.deal_image,
      required this.deal_size1,
      required this.deal_size2,
      required this.deal_size3,
      required this.deal_prize});
}

class Featured_product {
  String featured_image;
  String featured_price;
  String featured_sold;
  Featured_product({
    required this.featured_image,
    required this.featured_price,
    required this.featured_sold,
  });
}
