import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ItemScreen extends StatefulWidget {
  final String image;
  final String text;
  final String PriceDisc;
  final String NormalPrice;
  final String Description;
  final double rating;

  const ItemScreen(
      {required this.image,
      required this.text,
      required this.rating,
      required this.PriceDisc,
      required this.NormalPrice,
      required this.Description,
      super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  color: Color(0xFFD4ECF7),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 32,
                    ),
                  )),
            ],
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.text,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    RatingBar.builder(
                        initialRating: widget.rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 25,
                        itemBuilder: (context, _) {
                          return Icon(
                            Icons.star,
                            color: Colors.amber,
                          );
                        },
                        onRatingUpdate: (rating) {}),
                    SizedBox(
                      width: 10,
                    ),
                    Text("(400)"),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      widget.PriceDisc,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      widget.NormalPrice,
                      style: TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.black54),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    widget.Description,
                    style: TextStyle(fontSize: 13, color: Colors.black),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          )
        ],
      )),
      bottomNavigationBar: Container(
          width: MediaQuery.of(context).size.width,
          height: 55,
          margin: EdgeInsets.only(top: 8, bottom: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {});
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Confirmation'),
                        content:
                            Text('Your Items has succesfully added to cart'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Ok'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Center(
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.3,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Add to Cart",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(Icons.add)
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
