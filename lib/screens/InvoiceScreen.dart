import 'package:flutter/material.dart';
import 'package:tes2/screens/CartScreen.dart';
import 'package:tes2/screens/HomeScreen.dart';
import 'package:tes2/widgets/grid_items.dart';
import 'package:tes2/screens/BottomScreen.dart';
import 'package:intl/intl.dart';

class Invoice extends StatelessWidget {
  final GridItems gridItems = GridItems();
  final List<int> count;
  final int Total;
  Invoice({required this.Total, required this.count, super.key});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    String Date = DateFormat('dd/MM/yyyy').format(date);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Stack(children: [
          Text(
            "Invoice Overview",
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ]),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color(0xFFD4ECF7),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height / 1.4,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Invoice for",
                              style: TextStyle(color: Colors.black54),
                            ),
                            Text("Total Amount")
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Alfariza",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Text(
                              "\$${Total.toString()}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 200,
                          width: 400,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "images/Payment.jpg",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 100,
                          width: 400,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.difference_outlined),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Invoice Details",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14))
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 50,
                                width: 400,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Customer Email",
                                          style:
                                              TextStyle(color: Colors.black54),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Alfariza@gmail.com",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Invoice Date",
                                          style:
                                              TextStyle(color: Colors.black54),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          Date.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 400,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 400,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Items",
                                          style:
                                              TextStyle(color: Colors.black54),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        for (int i = 0; i < 4; i++)
                                          Text(
                                            gridItems.ItemList[i]['text']
                                                .toString(),
                                          ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Total Amount",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Price",
                                          style:
                                              TextStyle(color: Colors.black54),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        for (int i = 0; i < 4; i++)
                                          Text(
                                            count[i].toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "\$${Total.toString()}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BottomNav(
                    selectedindex: 0,
                  );
                }));
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    "Back To HomePage",
                    style: TextStyle(color: Colors.white, fontSize: 18),
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
