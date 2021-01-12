import 'package:flutter/material.dart';
import 'package:flutter_furniture_app/Models/newArivalCouch.dart';
import 'package:flutter_furniture_app/Models/recentlyViewModels.dart';
import '../constant/constants.dart';
import 'DetailScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  int _selectednavbarindex = 0;

  List<String> _navbartitle = [
    "Sofa",
    "Armchair",
    "Round Chair",
    "Dining Chair",
  ];
  List<String> _icons = [
    "assets/icons/icons8-armchair-50.png",
    "assets/icons/icons8-table-50.png",
    "assets/icons/icons8-lamp-50.png",
    "assets/icons/icons8-wardrobe-50.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.navigationbarcolor,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Positioned(
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Container(
                      color: Constants.navigationbarcolor,
                      height: 70,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: ListView.builder(
                                itemCount: _navbartitle.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, int index) => Stack(
                                  children: [
                                    _selectednavbarindex == index
                                        ? Positioned(
                                            right: 0,
                                            left: 0,
                                            bottom: 10,
                                            child: Container(
                                              height: 10,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Color(0xffE67CAE),
                                              ),
                                            ),
                                          )
                                        : Container(),
                                    Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            _selectednavbarindex = index;
                                          });
                                        },
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Text(
                                              _navbartitle[index],
                                              style: TextStyle(
                                                  color: _selectednavbarindex ==
                                                          index
                                                      ? Colors.white
                                                      : Color(0xff8171DD),
                                                  fontSize: 15,
                                                  letterSpacing: 3,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 20,
                    left: 10,
                    child: IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {})),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Constants.primarycolor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 30),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Good Morning",
                                style: TextStyle(
                                  color: Color(0xffD9D4F9),
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Dwi Lestari",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 20),
                        child: Container(
                          height: 55,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, int index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 13),
                                width: 55,
                                decoration: BoxDecoration(
                                  color: Color(0xff694DFA),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    _icons[index],
                                    height: 30,
                                    color: _selectedIndex == index
                                        ? Colors.white
                                        : Color(0xff9581FB),
                                  ),
                                  // child: Icon(
                                  //   Icons.table_chart,
                                  //   size: 30,
                                  // color: _selectedIndex == index
                                  //     ? Colors.white
                                  //     : Color(0xff9581FB),
                                  // ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 30),
                        child: Text(
                          "New Arrival",
                          style: TextStyle(
                            color: Color(0xffD9D4F9),
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 20),
                        child: Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            itemCount: newArivalCouch.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, int index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Material(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => DetailScreen(
                                          title: newArivalCouch[index].title,
                                          image: newArivalCouch[index].image,
                                          subtitle:
                                              newArivalCouch[index].subtitle,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 230,
                                    child: Column(
                                      children: [
                                        Hero(
                                          tag: newArivalCouch[index].image,
                                          child: Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Image.asset(
                                              newArivalCouch[index].image,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 0,
                                              left: 20.0,
                                              right: 20,
                                              bottom: 20),
                                          child: Row(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    newArivalCouch[index].title,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 2,
                                                  ),
                                                  Text(
                                                    newArivalCouch[index]
                                                        .subtitle,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: Container(),
                                              ),
                                              Text(
                                                newArivalCouch[index].price,
                                                style: TextStyle(
                                                  color: Constants
                                                      .navigationbarcolor,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 30),
                        child: Text(
                          "Recently Views",
                          style: TextStyle(
                            color: Color(0xffD9D4F9),
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, left: 25),
                          child: Container(
                            child: ListView.builder(
                              itemCount: listrecentlyViewModels.length,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (_, int index) => Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        height: 50,
                                        width: 65,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Image.asset(
                                            listrecentlyViewModels[index].image,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            listrecentlyViewModels[index].title,
                                            style: TextStyle(
                                              color: Color(0xffD9D4F9),
                                              fontSize: 15,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            listrecentlyViewModels[index].price,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
