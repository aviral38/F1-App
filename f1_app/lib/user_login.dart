import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
class user_login extends StatefulWidget {
  @override
  _user_loginState createState() => _user_loginState();
}

class _user_loginState extends State<user_login> {
  @override
  String Email, Password;
  Response response;
  var storage = FlutterSecureStorage();
  void login() async {
    bool error = false;
    Dio dio = new Dio();
    try {
      response = await dio.post(
          'https://f1-appstudent.herokuapp.com/user/login',
          data: {"Email": Email, "Password": Password});
    } on DioError catch (e) {
      error = true;
      setState(() {
        show_spinner=false;
      });
      dialog('Wrong Password or Email not Registered');
      if (e != null) {
        print(e.response);
      }
    }

    if (error == false) {
      var jwt=response.data["token"];
      await storage.write(key: "jwt", value: jwt);
      print(jwt);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('jwt', jwt);
      Navigator.pushNamed(context, '/');
    }
  }
  Future<void> dialog(var a) async{
    return showDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(a),
            elevation: 24.0,
          );
        });
  }
  bool show_spinner=false;
  Widget build(BuildContext context) {
    return Material(
      child: ModalProgressHUD(
        inAsyncCall: show_spinner,
        child: Container(
          decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,colors: [Color(0xff7F7FD5),Color(0xff86A8E7),Color(0xff91EAE4)])),
          child: Column(
            children: [
              SizedBox(height: 50,),
              Image(image: AssetImage('images/cars.png')),
              Row(
                children: [
                  Icon(
                    Icons.email_rounded,
                    size: 80,
                  ),
                  Flexible(
                    child: TextField(
                      onChanged: (value) => {Email = value},
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: 'Enter Your Email Address',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Icon(
                    Icons.vpn_key_sharp,
                    size: 80,
                  ),
                  Flexible(
                    child: TextField(
                      onChanged: (value) => {Password = value},
                      obscureText: true,
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: 'Enter Your Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  color: Colors.orange,
                  child: FlatButton(
                      onPressed: (){
                        setState(() {
                          show_spinner=true;
                        });
                        login();
                        },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w500),
                      ))),
            ],
          ),
        ),
      ),
    );

  }
}
