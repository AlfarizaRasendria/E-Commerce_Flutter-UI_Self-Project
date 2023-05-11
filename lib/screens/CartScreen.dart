import 'package:flutter/material.dart';
import 'package:tes2/widgets/grid_items.dart';
import 'package:tes2/screens/ItemScreen.dart';
import 'package:tes2/screens/InvoiceScreen.dart';

class CartScreens extends StatefulWidget {
  CartScreens({super.key});

  @override
  State<CartScreens> createState() => _CartScreensState();
}

class _CartScreensState extends State<CartScreens> {
  List<int> _count = [0, 0, 0, 0];
  List<int> totalperItem = [0, 0, 0, 0];
  int Total = 0;
  

  final GridItems gridItems = GridItems();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                  SizedBox(
                    width: 55,
                  ),
                  Text(
                    "My Shopping Cart",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ],
              ),
              SizedBox(height: 20),
              for (int i = 0; i < 4; i++)
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 126,
                  width: MediaQuery.of(context).size.width / 1.1,
                  decoration: BoxDecoration(
                      color: Color(0xFFF8F8F8),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 105,
                        width: MediaQuery.of(context).size.width / 5,
                        margin: EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                            color: Color(0xFFD4ECF7),
                            borderRadius: BorderRadius.circular(12)),
                        child: Image.asset(gridItems.ItemList[i]['image']),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 4,
                        margin: EdgeInsets.all(8),
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                gridItems.ItemList[i]['text'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Size : ",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    gridItems.ItemList[i]['size'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 4,
                        margin: EdgeInsets.all(8),
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "\$${gridItems.ItemList[i]['PriceDisc'].toString()}",
                                style: TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 32,
                                    height: 32,
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _count[i] -= 1;
                                            if (_count[i] < 0) {
                                              _count[i] = 0;
                                            }
                                            if (totalperItem[i] > 0) {
                                              totalperItem[i] -= int.parse(
                                                  gridItems.ItemList[i]
                                                          ['PriceDisc']
                                                      .toString());
                                            }
                                            /* if (Total < 0) {
                                              Total = 0;
                                            } */
                                            /* for (int i = 0; i < 4; i++)
                                              Total += totalperItem[i]; */

                                            print(totalperItem);
                                            print(Total);
                                          });
                                        },
                                        icon: Icon(
                                          Icons.remove,
                                          size: 25,
                                          color: Colors.black,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      _count[i].toString(),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    width: 32,
                                    height: 32,
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            _count[i] += 1;
                                            totalperItem[i] = _count[i] *
                                                int.parse(gridItems.ItemList[i]
                                                        ['PriceDisc']
                                                    .toString());

                                            // Total = total[i];
                                            /* for (int i = 0; i < 4; i++)
                                              Total += totalperItem[i]; */
                                            print(totalperItem);
                                            print(Total);
                                          });
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          size: 25,
                                          color: Colors.black,
                                        )),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              SizedBox(
                height: 40,
                /* child: IconButton(
                    onPressed: () {
                      setState(() {
                        for (int i = 0; i < 4; i++) {
                          Quantity += _count[i];
                        }
                        /*
                        for (int i = 0; i < 4; i++) {
                          Total += totalperItem[i];
                        }
                        print(Total);*/
                      });
                    },
                    icon: Icon(Icons.add)), */
              ),
              /*  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Quantity Of Items",
                    style: TextStyle(fontSize: 25),
                  ),
                  Row(
                    children: [
                      Text(
                        "\$",
                        style: TextStyle(color: Colors.redAccent, fontSize: 20),
                      ),
                      Text(
                        Quantity.toString(),
                        style: TextStyle(color: Colors.redAccent, fontSize: 20),
                      ),
                    ],
                  )
                ],
              ), */
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    for (int i = 0; i < 4; i++) Total += totalperItem[i];
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Invoice(count: _count, Total: Total);
                      },
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.redAccent),
                  child: Center(
                    child: Text(
                      "Order Now",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    /* IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ) */
  }
}
