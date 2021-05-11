import'package:flutter/material.dart';
import 'package:f1_app/team_profile.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:dio/dio.dart';
class fav_team extends StatefulWidget {
  @override
  _fav_teamState createState() => _fav_teamState();
}

class _fav_teamState extends State<fav_team> {
  @override
  String email;
  Response response;
  var storage=FlutterSecureStorage();
  void pressing(String team) async{
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
      response=await dio.put('https://f1-appstudent.herokuapp.com/favorite',data: {"Email":email,"Team":team});
    }on DioError catch(e){
      error=true;
      if(e != null) {
        print(e.response.data);
      }
      else
      {
        print(response.statusCode);
      }
    }
  }
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin:Alignment.bottomLeft,end: Alignment.topRight,colors: [Color(0xfff12711),Color(0xfff5af19)]),
        ),
        child: ListView(children: [
          Column(
            children: [
              Text('Select Your favorite Team',style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.w500),),
              SizedBox(height: 30,),
              team_profile(image: AssetImage('images/Mercedes.png'),name: 'Mercedes',press: (){pressing('Mercedes');},),
              SizedBox(height: 10,),
              team_profile(image: AssetImage('images/RedBull.png'),name: 'Red Bull Racing',press: (){pressing('RedBull');},),
              SizedBox(height: 10,),
              team_profile(image: AssetImage('images/Mclaren.png'),name: 'Mclaren',press: (){pressing('Mclaren');},),
              SizedBox(height: 10,),
              team_profile(image: AssetImage('images/Aston Martin.png'),name: 'Aston Martin Racing',press: (){pressing('Aston Martin Racing');},),
              SizedBox(height: 10,),
              team_profile(image: AssetImage('images/Alpine.png'),name: 'Alpine',press: (){pressing('Alpine');},),
              SizedBox(height: 10,),
              team_profile(image: AssetImage('images/Ferrari.png'),name: 'Ferrari',press: (){pressing('Ferrari');},),
              SizedBox(height: 10,),
              team_profile(image: AssetImage('images/Alpha Tauri.png'),name: 'Alpha Tauri',press: (){pressing('Alpha Tauri');},),
              SizedBox(height: 10,),
              team_profile(image: AssetImage('images/Alpha Romeo.png'),name: 'Alpha Romeo',press: (){pressing('Alpha Romeo');},),
              SizedBox(height: 10,),
              team_profile(image: AssetImage('images/Haas.png'),name: 'Haas',press: (){pressing('Haas');},),
              SizedBox(height: 10,),
              team_profile(image: AssetImage('images/Williams.png'),name: 'Williams',press: (){pressing('Williams');},),

            ],
          ),
        ],),

      ),
    );
  }
}
