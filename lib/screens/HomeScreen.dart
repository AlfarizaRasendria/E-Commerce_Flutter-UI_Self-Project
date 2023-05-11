import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tes2/screens/ItemScreen.dart';
import 'package:tes2/screens/CartScreen.dart';
import 'package:tes2/screens/BottomScreen.dart';
import 'package:tes2/widgets/grid_items.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  GridItems gridItems = GridItems();

  @override
  Widget build(BuildContext context) {
    List<Color> ColorList = <Color>[
      Colors.blue,
      Colors.orange,
      Colors.green,
    ];

    List<dynamic> ImageList = <dynamic>[
      "images/Firstslide.png",
      "images/Secondslide.png",
      "images/Thirdslide.png",
    ];

    List<dynamic> IconList = <dynamic>[
      Icons.headset,
      Icons.watch,
      Icons.directions_run,
      Icons.style,
    ];

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: 38,
                  decoration: BoxDecoration(
                      color: Color(0xFFD4ECF7),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          spreadRadius: 2,
                        )
                      ]),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search",
                          ),
                        ),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.search))
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi! Customer",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Let's Start Shopping",
                    style: TextStyle(fontSize: 18, color: Colors.black45),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    for (int i = 0; i < 3; i++)
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Scaffold(
                                  body: CartScreens(),
                                );
                              },
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          padding: EdgeInsets.only(left: 10),
                          width: MediaQuery.of(context).size.width / 1.5,
                          height: MediaQuery.of(context).size.height / 5.7,
                          decoration: BoxDecoration(
                              color: ColorList[i],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "50% off for the end of year sale",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Container(
                                      width: 90,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text("Buy Now"),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Image.asset(
                                  ImageList[i],
                                  height: 180,
                                  width: 100,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Categories",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(color: Colors.black45),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    for (int i = 0; i < 4; i++)
                      Column(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            margin: EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: Color(0xFFD4ECF7),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  spreadRadius: 2,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ItemScreen(
                                                  image: gridItems.ItemList[i]
                                                      ['image'],
                                                  text: gridItems.ItemList[i]
                                                      ['text'],
                                                  rating: gridItems.ItemList[i]
                                                      ['rating'],
                                                  PriceDisc: gridItems
                                                      .ItemList[i]['PriceDisc'],
                                                  NormalPrice:
                                                      gridItems.ItemList[i]
                                                          ['NormalPrice'],
                                                  Description:
                                                      gridItems.ItemList[i]
                                                          ['Description'],
                                                )));
                                  },
                                  icon: Icon(IconList[i])),
                            ),
                          ),
                          Text(gridItems.ItemList[i]['text'])
                        ],
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              itemCount: gridItems.ItemList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.7),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemScreen(
                          image: gridItems.ItemList[index]['image'],
                          text: gridItems.ItemList[index]['text'],
                          rating: gridItems.ItemList[index]['rating'],
                          PriceDisc: gridItems.ItemList[index]['PriceDisc'],
                          NormalPrice: gridItems.ItemList[index]['NormalPrice'],
                          Description: gridItems.ItemList[index]['Description'],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFFD4ECF7),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "50% off",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  Text(gridItems.ItemList[index]['rating']
                                      .toString())
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: EdgeInsets.all(6),
                            child: Image.asset(
                              gridItems.ItemList[index]['image'],
                              width: 150,
                              height: 130,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                gridItems.ItemList[index]['text'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Row(
                                children: [
                                  Text(
                                    gridItems.ItemList[index]['PriceDisc']
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.redAccent),
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  Text(
                                    gridItems.ItemList[index]['NormalPrice'],
                                    style: TextStyle(
                                        fontSize: 12,
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.black.withOpacity(0.5)),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
