
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';
class profile_page extends StatefulWidget {
  @override
  _profile_pageState createState() => _profile_pageState();
}
class _profile_pageState extends State<profile_page> {
  @override
  int ind=3;
  Response response;
  void change(int index) {
    if (index == 1) {
      Navigator.pushNamed(context, '/driver');
    }
    if (index == 2) {
      Navigator.pushNamed(context, '/news');
    }
    if(index==0)
      {
        Navigator.pushNamed(context, '/');
      }
  }
  var storage=FlutterSecureStorage();
  String email='null';
  Future<Response> get_detail() async
  {
    var jwt = await storage.read(key: 'jwt');

    if (jwt == null) {
      print('no jwt');
    } else {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(jwt);
      email = decodedToken["Email"];
    }
    bool error=false;
    Dio dio=new Dio();
    try{
      response=await dio.get('https://f1-appstudent.herokuapp.com/favorite/detail/$email');
    }on DioError catch(e) {
      error = true;
      if (e != null) {
        print(e.response.data);

        print(response.data);
      }
      else {
        print(response.statusCode);
      }
    }
      print(response.data);
      return response;
  }
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return FutureBuilder(future:get_detail(),builder: (context,snapshot){
      if(snapshot.data!=null)
        {
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

            ),
            backgroundColor: Color(0xff39043D),
            body: ListView(
              children: [
                Stack(
                  children: [
                    Container(
                      width: width,
                      height: height/2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.0, -1.0),
                          end: Alignment(0.0, 1.0),
                          colors: [const Color(0x80c51f61), const Color(0x80570627)],
                          stops: [0.0, 1.0],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(height: height/12,),
                        Center(
                          child: Text(
                            'Hi '+email,
                            style: TextStyle(
                              fontFamily: 'Sen',
                              fontSize: 31,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: height/6,),
                        Container(
                          child: SvgPicture.string(
                            '<svg viewBox="-663.8 -752.0 414.0 451.0" ><path transform="translate(-765.85, 1054.06)" d="M 102.0201873779297 -1784.179931640625 C 102.0201873779297 -1784.179931640625 127.894905090332 -1804.463989257812 173.6564025878906 -1803.623046875 C 219.4179077148438 -1802.7822265625 239.7563171386719 -1801.941284179688 271.1114501953125 -1787.646850585938 C 302.466552734375 -1773.352783203125 344.8382263183594 -1770.830200195312 376.1933288574219 -1771.671020507812 C 407.5484008789062 -1772.511840820312 434.6663513183594 -1789.328857421875 445.6829833984375 -1792.692016601562 C 456.69970703125 -1796.055419921875 480.4279174804688 -1812.031616210938 516.0201416015625 -1803.623046875 C 516.0201416015625 -1755.665283203125 516.0201416015625 -1355.038818359375 516.0201416015625 -1355.038818359375 L 103.3190765380859 -1355.038818359375 L 102.0201873779297 -1784.179931640625 Z" fill="#edf3fb" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                            width: width,
                            height: height,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              SizedBox(height: height/3.5,),
                              FlatButton(
                                onPressed: (){Navigator.pushNamed(context, '/fav_d');},
                                child: Container(
                                  width: width-20,
                                  height: height/3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    color: Color(0xff0045FF),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0x57ec498a),
                                        offset: Offset(0, 20),
                                        blurRadius: 30,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Favorite Driver',
                                        style: TextStyle(
                                          fontFamily: 'Sen',
                                          fontSize: 30,
                                          color: const Color(0xffffffff),
                                          fontWeight: FontWeight.w700,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Image(image: AssetImage('images/drivers/'+snapshot.data.data['detail'][0]['Driver']+'.png'),height: height/4.5,),
                                      Text(
                                        snapshot.data.data['detail'][0]['Driver'],
                                        style: TextStyle(
                                          fontFamily: 'Sen',
                                          fontSize: 30,
                                          color: const Color(0xffffffff),
                                          fontWeight: FontWeight.w700,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              FlatButton(
                                onPressed:(){Navigator.pushNamed(context, '/favteam');},
                                child: Container(
                                  width: width-20,
                                  height: height/3,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    color: Color(0xff0045FF),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0x57ec498a),
                                        offset: Offset(0, 20),
                                        blurRadius: 30,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Favorite Team',
                                        style: TextStyle(
                                          fontFamily: 'Sen',
                                          fontSize: 30,
                                          color: const Color(0xffffffff),
                                          fontWeight: FontWeight.w700,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Image(image: AssetImage('images/'+snapshot.data.data['detail'][0]['Team']+'.png'),height: height/4.5,),
                                      Text(
                                        snapshot.data.data['detail'][0]['Team'],
                                        style: TextStyle(
                                          fontFamily: 'Sen',
                                          fontSize: 30,
                                          color: const Color(0xffffffff),
                                          fontWeight: FontWeight.w700,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          height: 50,
                          width: width*0.5,
                          color: Colors.blue,
                          child: FlatButton(onPressed: ()async{
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            await prefs.clear();
                            Navigator.pushNamed(context, '/first');
                          }, child: Row(
                            children: [
                              Text(
                                'Logout',
                                style: TextStyle(
                                  fontFamily: 'Sen',
                                  fontSize: 30,
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(width: width*0.1,),
                              Icon(Icons.power_settings_new_rounded),
                            ],
                          ),),
                        ),
                      ],
                    ),




                  ],
                ),

              ],
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
