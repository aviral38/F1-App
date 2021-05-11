import 'package:f1_app/fav_d.dart';
import 'package:f1_app/fav_driver.dart';
import 'package:f1_app/fav_team.dart';
import 'package:f1_app/news_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'welcomeScreen.dart';
import 'driver.dart';
import 'package:f1_app/News.dart';
import 'package:f1_app/user_reg.dart';
import 'package:f1_app/user_login.dart';
import 'package:f1_app/FirstScreen.dart';
import 'fav_driver.dart';
import 'package:f1_app/profile_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  var storage = FlutterSecureStorage();
  Future<bool> building() async {
    bool pass=false;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var jwt = await prefs.getString('jwt');
    if (jwt == null) {
      print('no jwt');
    } else {
      await storage.write(key: "jwt", value: jwt);
      pass=true;
    }
    return pass;
  }

  Widget build(BuildContext context) {
    return FutureBuilder(future: building(),builder: (context, snapshot) {
      if (snapshot.data != null) {
        return ChangeNotifierProvider(
          create: (context) => news_provider(),
          child: MaterialApp(
            initialRoute: snapshot.data?'/':'/first',
            routes: {
              '/': (context) => welcomeScreen(),
              '/driver': (context) => driver(),
              '/news': (context) => newspage(),
              '/user_reg': (context) => user_reg(),
              '/user_login': (context) => user_login(),
              '/first': (context) => first(),
              '/favdriver': (context) => fav_driver(),
              '/favteam': (context) => fav_team(),
              '/profile': (context) => profile_page(),
              '/fav_d':(context)=>fav_d(),
            },
          ),
        );
      }
      return Column(children: [
        SizedBox(
          height: 200,
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
