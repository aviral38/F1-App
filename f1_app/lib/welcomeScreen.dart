import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'boxes.dart';
import 'package:dio/dio.dart';
import 'package:f1_app/news_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class welcomeScreen extends StatefulWidget {
  @override
  _welcomeScreenState createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  Response response;
  String username;
  var storage = FlutterSecureStorage();
  Future<Response> get_team() async {
    Provider.of<news_provider>(context).news_data();
    var dio = Dio();
    response = await dio.get('https://f1-appstudent.herokuapp.com/team');
    print(response.data[1]["Name"]);
    for (int i = 0; i < response.data.length; i++) {
      for (int j = 0; j < response.data.length - i - 1; j++) {
        if (response.data[j]['Points'] < response.data[j + 1]['Points']) {
          var temp = response.data[j];
          response.data[j] = response.data[j + 1];
          response.data[j + 1] = temp;
        }
      }
    }

    var jwt = await storage.read(key: 'jwt');

    if (jwt == null) {
      print('no jwt');
    } else {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(jwt);
      username = decodedToken["Email"];
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var pp = await prefs.getString('jwt');
    print('pp is $pp');
    print('Done');
    return response;
  }

  int ind = 0;
  void change(int index) {
    if (index == 1) {
      Navigator.pushNamed(context, '/driver');
    }
    if (index == 2) {
      Navigator.pushNamed(context, '/news');
    }
    if (index == 3) {
      Navigator.pushNamed(context, '/profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return FutureBuilder(
        future: get_team(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                showSelectedLabels: false,
                items: [
                  BottomNavigationBarItem(
                      icon: Image.asset(
                        'images/caricon.png',
                        height: 50,
                        width: 50,
                      ),
                      label: 'home'),
                  BottomNavigationBarItem(
                      icon: Image.asset(
                        'images/drivericon.png',
                        height: 50,
                        width: 50,
                      ),
                      label: 'driver standings'),
                  BottomNavigationBarItem(
                      icon: Image.asset(
                        'images/newsicon.png',
                        height: 50,
                        width: 50,
                      ),
                      label: 'News'),
                  BottomNavigationBarItem(
                      icon: Image.asset(
                        'images/profileicon.png',
                        height: 50,
                        width: 50,
                      ),
                      label: 'Profile'),
                ],
                currentIndex: ind,
                onTap: change,
              ),
              appBar: AppBar(
                backgroundColor: Colors.black45,
                title: Text(
                  'Formula1',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
                actions: [
                  FlatButton(
                      onPressed: null,
                      child: Text(
                        username,
                        style: TextStyle(color: Colors.red),
                      ))
                ],
              ),
              backgroundColor: Color(0xff39043D),
              body: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/jb.jpg'), fit: BoxFit.cover)),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            child: Text(
                              "Constructor's Standing",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text('Team',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700)),
                            SizedBox(
                              width: width*0.55,
                            ),
                            Text('Points',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700)),
                          ],
                        ),
                        Row(
                          children: [
                            box(
                              color: Colors.white,
                              text: snapshot.data.data[0]["Team"],
                              img: AssetImage('images/' +
                                  snapshot.data.data[0]["Team"] +
                                  '.png'),
                            ),
                            SizedBox(
                              width: width*0.08,
                            ),
                            Text(
                              snapshot.data.data[0]["Points"].toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            box(
                              color: Colors.white,
                              text: snapshot.data.data[1]["Team"],
                              img: AssetImage('images/' +
                                  snapshot.data.data[1]["Team"] +
                                  '.png'),
                            ),
                            SizedBox(
                              width: width*0.08,
                            ),
                            Text(
                              snapshot.data.data[1]["Points"].toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            box(
                              color: Colors.white,
                              text: snapshot.data.data[2]["Team"],
                              img: AssetImage('images/' +
                                  snapshot.data.data[2]["Team"] +
                                  '.png'),
                            ),
                            SizedBox(
                              width: width*0.08,
                            ),
                            Text(
                              snapshot.data.data[2]["Points"].toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            box(
                              color: Colors.white,
                              text: snapshot.data.data[3]["Team"],
                              img: AssetImage('images/' +
                                  snapshot.data.data[3]["Team"] +
                                  '.png'),
                            ),
                            SizedBox(
                              width: width*0.08,
                            ),
                            Text(
                              snapshot.data.data[3]["Points"].toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            box(
                              color: Colors.white,
                              text: snapshot.data.data[4]["Team"],
                              img: AssetImage('images/' +
                                  snapshot.data.data[4]["Team"] +
                                  '.png'),
                            ),
                            SizedBox(
                              width: width*0.08,
                            ),
                            Text(
                              snapshot.data.data[4]["Points"].toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            box(
                              color: Colors.white,
                              text: snapshot.data.data[5]["Team"],
                              img: AssetImage('images/' +
                                  snapshot.data.data[5]["Team"] +
                                  '.png'),
                            ),
                            SizedBox(
                              width: width*0.08,
                            ),
                            Text(
                              snapshot.data.data[5]["Points"].toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            box(
                              color: Colors.white,
                              text: snapshot.data.data[6]["Team"],
                              img: AssetImage('images/' +
                                  snapshot.data.data[6]["Team"] +
                                  '.png'),
                            ),
                            SizedBox(
                              width: width*0.08,
                            ),
                            Text(
                              snapshot.data.data[6]["Points"].toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            box(
                              color: Colors.white,
                              text: snapshot.data.data[7]["Team"],
                              img: AssetImage('images/' +
                                  snapshot.data.data[7]["Team"] +
                                  '.png'),
                            ),
                            SizedBox(
                              width: width*0.08,
                            ),
                            Text(
                              snapshot.data.data[7]["Points"].toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            box(
                              color: Colors.white,
                              text: snapshot.data.data[8]["Team"],
                              img: AssetImage('images/' +
                                  snapshot.data.data[8]["Team"] +
                                  '.png'),
                            ),
                            SizedBox(
                              width: width*0.08,
                            ),
                            Text(
                              snapshot.data.data[8]["Points"].toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            box(
                              color: Colors.white,
                              text: snapshot.data.data[9]["Team"],
                              img: AssetImage('images/' +
                                  snapshot.data.data[9]["Team"] +
                                  '.png'),
                            ),
                            SizedBox(
                              width: width*0.08,
                            ),
                            Text(
                              snapshot.data.data[9]["Points"].toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          return Column(children: [
            SizedBox(
              height: height/2.5,
            ),
            Container(
              child: CircularProgressIndicator(
                backgroundColor: Colors.orange,
                strokeWidth: 10,
              ),
              height: 100,
              width: 100,
            ),
          ]);
        });
  }
}
