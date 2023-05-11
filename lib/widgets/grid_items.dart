import 'package:flutter/material.dart';
import 'package:tes2/screens/ItemScreen.dart';
import 'package:tes2/screens/UserScreen.dart';

class GridItems extends StatelessWidget {
  GridItems({super.key});

  final List<Map<String, dynamic>> ItemList = [
    {
      'text': 'Headset',
      'image': 'images/Headset.png',
      'rating': 4.0,
      'PriceDisc': "75",
      'NormalPrice': '\$150',
      'Description':
          'Our headset boasts a comfortable design with soft, padded ear cups that fit snugly around your ears, ensuring long-lasting comfort even during extended listening sessions. With an adjustable headband and easy-to-use controls, our headset offers a personalized experience that caters to your unique needs.',
      'size': 'L'
    },
    {
      'text': 'Watch',
      'image': 'images/Watch.png',
      'rating': 4.5,
      'PriceDisc': "150",
      'NormalPrice': '\$300',
      'Description':
          'Watch boasts precision engineering and superior craftsmanship, ensuring accurate timekeeping and durability. Our watches also come with advanced features such as chronographs and water resistance, making them suitable for any activity.',
      'size': 'M'
    },
    {
      'text': 'Shoe',
      'image': 'images/Shoe.png',
      'rating': 5.0,
      'PriceDisc': "250",
      'NormalPrice': '\$500',
      'Description':
          'Our shoes are crafted from the finest materials, ensuring durability and long-lasting performance. The sleek and stylish design of our shoes makes them the perfect choice for any occasion, whether you\'re dressing up for a formal event or dressing down for a casual outing.',
      'size': 'S'
    },
    {
      'text': 'Shirt',
      'image': 'images/Tshirt.png',
      'rating': 5.0,
      'PriceDisc': "50",
      'NormalPrice': '\$100',
      'Description':
          'Our TShirts are a must-have addition to your wardrobe, offering a perfect blend of style, quality, and comfort. Crafted from premium-quality cotton, our TShirts are soft, breathable, and durable, ensuring long-lasting wear and exceptional comfort all day long.',
      'size': 'XL'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: List.generate(ItemList.length, (index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemScreen(
                    image: ItemList[index]['image'],
                    text: ItemList[index]['text'],
                    rating: ItemList[index]['rating'],
                    PriceDisc: ItemList[index]['PriceDisc'],
                    NormalPrice: ItemList[index]['NormalPrice'],
                    Description: ItemList[index]['Description'],
                  ),
                ),
              );
            },
            child: Container(
              width: (MediaQuery.of(context).size.width - 30) / 2,
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
                            Text(ItemList[index]['rating'].toString())
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.all(6),
                      child: Image.asset(
                        ItemList[index]['image'],
                        width: 150,
                        height: 130,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ItemList[index]['text'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Row(
                          children: [
                            Text(
                              ItemList[index]['PriceDisc'].toString(),
                              style: TextStyle(
                                  fontSize: 16, color: Colors.redAccent),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              ItemList[index]['NormalPrice'],
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
        }),
      ),
    );
  }
}
