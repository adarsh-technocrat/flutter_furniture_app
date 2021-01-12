import 'package:flutter/material.dart';
import 'package:flutter_furniture_app/constant/constants.dart';

class DetailScreen extends StatefulWidget {
  final String title;
  final String subtitle;
  final String image;

  DetailScreen(
      {Key key,
      @required this.title,
      @required this.subtitle,
      @required this.image})
      : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int selectedIndex = 0;
  int _selectednavbarindex = 0;

  List<String> _navbartitle = [
    "Reviews",
    "Description",
  ];

  int colorSelectedIndex = 0;
  List<Color> color = [
    Color(0xff89E2B3),
    Color(0xffE77DAE),
    Color(0xffF6B42E),
    Color(0xff5BB2FF),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Constants.navigationbarcolor,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 240,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 60, left: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              widget.subtitle,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Double Cheese features\ntwo 100% pure beef\nburger patties",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 50,
                  top: -40,
                  child: Hero(
                    tag: widget.image,
                    child: Image.asset(
                      widget.image,
                      height: 350,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.3,
                  height: 80,
                  child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, int index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(15),
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: selectedIndex == index
                                    ? Colors.red
                                    : Colors.white,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Image.asset(widget.image),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: Row(
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
                                                        color:
                                                            Color(0xffE67CAE),
                                                      ),
                                                    ),
                                                  )
                                                : Container(),
                                            Material(
                                              color: Colors.transparent,
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    _selectednavbarindex =
                                                        index;
                                                  });
                                                },
                                                child: Container(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    child: Text(
                                                      _navbartitle[index],
                                                      style: TextStyle(
                                                          color:
                                                              _selectednavbarindex ==
                                                                      index
                                                                  ? Colors.white
                                                                  : Color(
                                                                      0xff8171DD),
                                                          fontSize: 15,
                                                          letterSpacing: 3,
                                                          fontWeight:
                                                              FontWeight.w900),
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
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
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
                                padding: const EdgeInsets.only(
                                  left: 50,
                                  top: 40,
                                  right: 20,
                                ),
                                child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, left: 50),
                                child: Text(
                                  "Food That is delicious has a very\npleasant tast.",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 50, top: 30),
                                child: Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: color.length,
                                    itemBuilder: (_, int index) =>
                                        GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          colorSelectedIndex = index;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    colorSelectedIndex == index
                                                        ? Colors.white
                                                        : Colors.transparent,
                                                width: 1,
                                              )),
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Container(
                                              height: 30,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: color[index],
                                              ),
                                            ),
                                          ),
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
            ),
          ],
        ),
      ),
    );
  }
}
