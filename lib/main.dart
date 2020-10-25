import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/foodmenu.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter FoodApp';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const TextStyle optionStyle1 = TextStyle(
      fontSize: 13.0, fontWeight: FontWeight.bold, color: Colors.redAccent);

  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    FoodMenu(),
    Fav(),
    Track(),
    Menu()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20.0,
        backgroundColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            title: Text(
              "Home",
              style: optionStyle1,
            ),
            // label: Text( 'Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fastfood,
              size: 30.0,
            ),
            title: Text(
              "Food Menu",
              style: optionStyle1,
            ),
            // label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: 30,
            ),
            title: Text(
              "Favourites",
              style: optionStyle1,
            ),
            // label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.directions_bike,
              size: 30,
            ),
            title: Text(
              "Track",
              style: optionStyle1,
            ),
            // label: Text( 'Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
              size: 30,
            ),
            title: Text(
              "Menu",
              style: optionStyle1,
            ),
            // label: Text( 'Home'),
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.black54,
        selectedItemColor: Colors.red[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

// HomePage
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red[900],
        title: const Text(
          'Home',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class FoodMenu extends StatefulWidget {
  @override
  _FoodMenuState createState() => _FoodMenuState();
}

class _FoodMenuState extends State<FoodMenu> {
  List imgList = [
    'https://mobileapp.chickinguae.com/images/banners/banner.png',
    'https://mobileapp.chickinguae.com/images/banners/banner1-fs8.png',
    'https://mobileapp.chickinguae.com/images/banners/banner1.png',
    'https://mobileapp.chickinguae.com/images/banners/banner2.png',
    'https://mobileapp.chickinguae.com/images/banners/banner3.png',
    'https://mobileapp.chickinguae.com/images/banners/banner4.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Positioned(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                      color: Colors.red[900],
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(bottom: 150, left: 23),
                          child: GestureDetector(
                            onTap: () {
                              print("menu");
                            },
                            child: Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(bottom: 150, left: 70.0),
                            child: Text(
                              "CHICKING DUBAI",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21.0,
                                  fontWeight: FontWeight.bold),
                            )),
                        Container(
                          padding: EdgeInsets.only(bottom: 150, left: 73),
                          child: GestureDetector(
                              onTap: () {
                                print("cart");
                              },
                              child: Icon(
                                Icons.add_shopping_cart,
                                color: Colors.white,
                                size: 32,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 85.0, bottom: 10.0),
                  child: Column(
                    children: <Widget>[
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 235.0,
                          enlargeCenterPage: true,
                          viewportFraction: .85,
                          initialPage: 0,
                        ),
                        items: imgList.map((item) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                padding: EdgeInsets.only(top: 0, bottom: 0),
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 0.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.white,
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: item,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                "Popular Dishes",
                style: TextStyle(
                    color: Colors.red[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
            ),
            GestureDetector(
              onTap: () {
                print("order1");
              },
              child: Container(
                  padding: EdgeInsets.only(top: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.5, // soften the shadow
                              spreadRadius: 1.0, //extend the shadow
                              offset: Offset(
                                2.0, // Move to right 10  horizontally
                                2.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: 115,
                        height: 140,
                        child: Column(
                          children: [
                            Image.network(
                                'https://mobileapp.chickinguae.com/images/common_items/Chicken.png'),
                            Container(
                              color: Colors.red[900],
                              height: 15,
                              width: 80,
                              alignment: Alignment.center,
                              child: Text(
                                'ORDER NOW.',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("order2");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 1.5, // soften the shadow
                                spreadRadius: 1.0, //extend the shadow
                                offset: Offset(
                                  2.0, // Move to right 10  horizontally
                                  2.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: 115,
                          height: 140,
                          child: Column(
                            children: [
                              Image.network(
                                  'https://mobileapp.chickinguae.com/images/common_items/Chicken.png'),
                              Container(
                                color: Colors.red[900],
                                height: 15,
                                width: 80,
                                alignment: Alignment.center,
                                child: Text(
                                  'ORDER NOW.',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("order3");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 1.5, // soften the shadow
                                spreadRadius: 1.0, //extend the shadow
                                offset: Offset(
                                  2.0, // Move to right 10  horizontally
                                  2.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: 115,
                          height: 140,
                          child: Column(
                            children: [
                              Image.network(
                                  'https://mobileapp.chickinguae.com/images/common_items/20181210064114_1544424074.png'),
                              Container(
                                color: Colors.red[900],
                                height: 15,
                                width: 80,
                                alignment: Alignment.center,
                                child: Text(
                                  'ORDER NOW.',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Container(
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("order4");
                      },
                      child: Container(
                        padding: EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.5, // soften the shadow
                              spreadRadius: 1.0, //extend the shadow
                              offset: Offset(
                                2.0, // Move to right 10  horizontally
                                2.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: 115,
                        height: 145,
                        child: Column(
                          children: [
                            Image.network(
                                'https://mobileapp.chickinguae.com/images/common_items/20200930103838_1601447918.jpg'),
                            Container(
                              color: Colors.red[900],
                              height: 15,
                              width: 80,
                              alignment: Alignment.center,
                              child: Text(
                                'ORDER NOW.',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("order5");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.5, // soften the shadow
                              spreadRadius: 1.0, //extend the shadow
                              offset: Offset(
                                2.0, // Move to right 10  horizontally
                                2.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: 115,
                        height: 140,
                        child: Column(
                          children: [
                            Image.network(
                                'https://mobileapp.chickinguae.com/images/common_items/20200930103816_1601447896.jpg'),
                            Container(
                              color: Colors.red[900],
                              height: 15,
                              width: 80,
                              alignment: Alignment.center,
                              child: Text(
                                'ORDER NOW.',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("MENU");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.5, // soften the shadow
                              spreadRadius: 1.0, //extend the shadow
                              offset: Offset(
                                2.0, // Move to right 10  horizontally
                                2.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: 115,
                        height: 140,
                        child: Image.asset('assets/menu.png'),
                      ),
                    ),
                  ],
                )),
            Container(
              padding: EdgeInsets.only(top: 20.0),
              child: Text("Nearby Outlets",
                  style: TextStyle(
                    color: Colors.red[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )),
            ),
            GestureDetector(
              onTap: () {
                print("store 1 ");
              },
              child: Container(
                  padding: EdgeInsets.only(top: 15, bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 1.5, // soften the shadow
                              spreadRadius: 1.0, //extend the shadow
                              offset: Offset(
                                2.0, // Move to right 10  horizontally
                                2.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: 115,
                        height: 140,
                        child: Image.asset(
                          'assets/plc1.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("store 2");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 1.5, // soften the shadow
                                spreadRadius: 1.0, //extend the shadow
                                offset: Offset(
                                  2.0, // Move to right 10  horizontally
                                  2.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: 115,
                          height: 140.8,
                          child: Column(
                            children: [
                              Image.asset(
                                  'assets/Screenshot_2020-10-25 Home V2.png'),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("All outlets");
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 1.5, // soften the shadow
                                spreadRadius: 1.0, //extend the shadow
                                offset: Offset(
                                  2.0, // Move to right 10  horizontally
                                  2.0, // Move to bottom 10 Vertically
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: 115,
                          height: 140,
                          child: Image.asset('assets/outlet.png'),
                        ),
                      ),
                    ],
                  )),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Text("What Our Customer Says",
                  style: TextStyle(
                    color: Colors.red[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30.0, top: 10.0),
              child: Column(
                children: [
                  Container(
                    child: CarouselSlider(
                      options:
                          CarouselOptions(height: 120, enlargeCenterPage: true),
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 4.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.5)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: .5,
                                        blurRadius: 1,
                                        offset: Offset(
                                            2, 0), // changes position of shadow
                                      ),
                                    ],
                                    color: Colors.white),
                                child: Row(
                                  children: [
                                    Container(
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage('assets/usr.png'),
                                        radius: 35,
                                      ),
                                      padding: EdgeInsets.only(left: 24),
                                    ),
                                    Container(
                                      child: Text(
                                        "Excellent and Mindblowing \n service.Satisfied and Enjoyed \n overall service..",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red[900]),
                                      ),
                                      padding: EdgeInsets.only(left: 10),
                                    )
                                  ],
                                ));
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Fav extends StatefulWidget {
  @override
  _FavState createState() => _FavState();
}

class _FavState extends State<Fav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red[900],
        title: const Text(
          'Favourites',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class Track extends StatefulWidget {
  @override
  _TrackState createState() => _TrackState();
}

class _TrackState extends State<Track> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red[900],
        title: const Text(
          'Track',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red[900],
        title: const Text(
          'Menu',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
