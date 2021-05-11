import 'package:flutter/material.dart';
import 'profile.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
class fav_driver extends StatefulWidget {
  @override
  _fav_driverState createState() => _fav_driverState();
}

class _fav_driverState extends State<fav_driver> {
  @override
  String email;
  var storage=FlutterSecureStorage();
  Response response;
  void pressing(Driver) async
  {
    String driver=Driver;
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
      response=await dio.post('https://f1-appstudent.herokuapp.com/favorite',data: {"Email":email,"Driver":driver});
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
    Navigator.pushNamed(context, '/favteam');
  }
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Material(
      child: Container(
        decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,colors: [Color(0xff4568DC),Color(0xffB06AB3)])),
        child: ListView(children: [
          Column(
            children: [
              SizedBox(height: 30,),
              Text('Select Your favorite Driver',style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.w500),),
              SizedBox(height: 30,),
              MaterialButton(child: profile(image: AssetImage('images/drivers/Lewis Hamilton.png'),name: 'Lewis Hamilton',team: 'Mercedes',number: '44',),onPressed: (){pressing('Lewis Hamilton');},),
              SizedBox(height: 10,),
              MaterialButton(child: profile(image: AssetImage('images/drivers/Valtteri Bottas.png'),name: 'Valterri Bottas',team: 'Mercedes',number: '77',),onPressed: (){pressing('Valtteri Bottas');},),
              SizedBox(height: 10,),
              MaterialButton(child: profile(image: AssetImage('images/drivers/Max Verstappen.png'),name: 'Max Verstappen',team: 'Red Bull Racing',number: '33',),onPressed: (){pressing('Max Verstappen');},),
              SizedBox(height: 10,),
              MaterialButton(child:profile(image: AssetImage('images/drivers/Sergio Perez.png'),name: 'Sergio Perez',team: 'Red Bull Racing',number: '11',),onPressed: (){pressing('Sergio Perez');},),
              SizedBox(height: 10,),
              MaterialButton(child:profile(image: AssetImage('images/drivers/Lando Norris.png'),name: 'Lando Norris',team: 'Mclaren',number: '4',), onPressed: (){pressing('Lando Norris');},),
              SizedBox(height: 10,),
              MaterialButton(child:profile(image: AssetImage('images/drivers/Daniel Ricciardo.png'),name: 'Daniel Ricciardo',team: 'Mclaren',number: '3',), onPressed: (){pressing('Daniel Ricciardo');},),

              SizedBox(height: 10,),
              MaterialButton(child:profile(image: AssetImage('images/drivers/Lance Stroll.png'),name: 'Lance Stroll',team: 'Aston Martin Racing',number: '18',), onPressed: (){pressing('Lance Stroll');},),

              SizedBox(height: 10,),
              MaterialButton(child: profile(image: AssetImage('images/drivers/Sebastian Vettel.png'),name: 'Sebastian Vettel',team: 'Aston Martin Racing',number: '5',), onPressed: (){pressing('Sebastian Vettel');},),

              SizedBox(height: 10,),
              MaterialButton(child:profile(image: AssetImage('images/drivers/Fernando Alonso.png'),name: 'Fernando Alonso',team: 'Alpine',number: '14',), onPressed: (){pressing('Fernando Alonso');},),

              SizedBox(height: 10,),
              MaterialButton(child:profile(image: AssetImage('images/drivers/Esteban Ocon.png'),name: 'Esteban Ocon',team: 'Alpine',number: '33',), onPressed: (){pressing('Esteban Ocon');},),

              SizedBox(height: 10,),
              MaterialButton(child:profile(image: AssetImage('images/drivers/Carlos Sainz.png'),name: 'Carlos Sainz',team: 'Ferrari',number: '55',), onPressed: (){pressing('Carlos Sainz');},),

              SizedBox(height: 10,),
              MaterialButton(child:profile(image: AssetImage('images/drivers/Charles Leclerc.png'),name: 'Chales Leclerc',team: 'Ferrari',number: '16',), onPressed: (){pressing('Chales Leclerc');},),

              SizedBox(height: 10,),
              MaterialButton(child:profile(image: AssetImage('images/drivers/Pierre Gasly.png'),name: 'Pierre Gasly',team: 'Alpha Tauri',number: '10',), onPressed: (){pressing('Pierre Gasly');},),

              SizedBox(height: 10,),
              MaterialButton(child:profile(image: AssetImage('images/drivers/Yuki Tsunoda.png'),name: 'Yuki Tsunoda',team: 'Alpha Tauri',number: '22',), onPressed: (){pressing('Yuki Tsunoda');},),

              SizedBox(height: 10,),
              MaterialButton(child:profile(image: AssetImage('images/drivers/Kimi Raikkonen.png'),name: 'Kimi Raikkonen',team: 'Alpha Romeo',number: '7',), onPressed: (){pressing('Kimi Raikkonen');},),

              SizedBox(height: 10,),
              MaterialButton(child: profile(image: AssetImage('images/drivers/Antonio Giovinazzi.png'),name: 'Antonio Giovinazzi',team: 'Alpha Romeo',number: '99',), onPressed: (){pressing('Antonio Giovinazzi');},),

              SizedBox(height: 10,),
              MaterialButton(child:profile(image: AssetImage('images/drivers/Mick Schumacher.png'),name: 'Mick Schumacher',team: 'Haas',number: '47',), onPressed: (){pressing('Mick Schumacher');},),

              SizedBox(height: 10,),
              MaterialButton(child:profile(image: AssetImage('images/drivers/Nikita Mazepin.png'),name: 'Nikita Mazepin',team: 'Haas',number: '9',), onPressed: (){pressing('Nikita Mazepin');},),

              SizedBox(height: 10,),
              MaterialButton(child:profile(image: AssetImage('images/drivers/George Russell.png'),name: 'George Russell',team: 'Williams',number: '63',), onPressed: (){pressing('George Russell');},),

              SizedBox(height: 10,),
              MaterialButton(child:profile(image: AssetImage('images/drivers/Nicholas Latifi.png'),name: 'Nicholas Latifi',team: 'Williams',number: '6',), onPressed: (){pressing('Nicholas Latifi');},),


            ],
          ),
        ],),

      ),
    );
  }
}
