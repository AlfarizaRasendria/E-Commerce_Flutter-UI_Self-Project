import 'package:flutter/material.dart';
import 'package:tes2/screens/LoginScreen.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> FiturList = [
      {
        'icon': Icons.person,
        'title': 'Edit Profile',
      },
      {
        'icon': Icons.settings,
        'title': 'Settings',
      },
      {'icon': Icons.wallet, 'title': 'Payment'},
      {'icon': Icons.mark_as_unread_outlined, 'title': 'Suggestions'},
      {'icon': Icons.logout, 'title': 'Logout'},
    ];
    var Upwidth = MediaQuery.of(context).size.height / 2.6;
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF3F704D),
                          Color(0xFF4E8A5B),
                          Color(0xFF5E9C69),
                          Color(0xFF6EBD77),
                        ]),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 50),
                          CircleAvatar(
                            backgroundImage: AssetImage('images/PasFoto.png'),
                            radius: 60,
                          ),
                          SizedBox(height: 28),
                          Text(
                            "Alfariza Rasendria",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.white),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Software Engineer",
                            style:
                                TextStyle(color: Colors.white54, fontSize: 18),
                          ),
                        ]),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(top: Upwidth),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 1.6,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24)),
                    child: Column(children: [
                      SizedBox(height: 30),
                      for (int i = 0; i < 4; i++)
                        Expanded(
                          child: SizedBox(
                            height: 100,
                            child: ListTile(
                              leading: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Color(0xFFD4ECF7),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 4,
                                        spreadRadius: 2,
                                      )
                                    ]),
                                child: Icon(
                                  FiturList[i]["icon"],
                                  size: 28,
                                ),
                              ),
                              title: Text(
                                FiturList[i]['title'],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                        ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return LoginScreens();
                            },
                          ));
                        },
                        child: SizedBox(
                          height: 100,
                          child: ListTile(
                            leading: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Color(0xFFD4ECF7),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                    )
                                  ]),
                              child: Icon(
                                FiturList[4]["icon"],
                                size: 28,
                              ),
                            ),
                            title: Text(
                              FiturList[4]['title'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
