import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
class user_reg extends StatefulWidget {
  @override
  _user_regState createState() => _user_regState();
}

class _user_regState extends State<user_reg> {
  @override
  String Name;

  String Email,Password;

  Response response;
  var storage = FlutterSecureStorage();
  void signup() async
  {
    bool error=false;
    Dio dio=new Dio();
    try{
      response=await dio.post('https://f1-appstudent.herokuapp.com/user/signup',data: {"Name":Name,"Email":Email,"Password":Password});
    }on DioError catch(e){
      error=true;
      setState(() {
        show_spinner=false;
      });
      dialog(e.toString());
      if(e != null) {
        print(e.response.data);
      }
      else
        {
          print(response.statusCode);
        }
    }
    try {
      response = await dio.post(
          'https://f1-appstudent.herokuapp.com/user/login',
          data: {"Email": Email, "Password": Password});
    } on DioError catch (e) {
      error = true;
      show_spinner=false;
      dialog(e.toString());
      if (e != null) {
        print(e.response);
      }
    }
    if(error==false)
      {
        var jwt=response.data["token"];
        await storage.write(key: "jwt", value: jwt);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('jwt', jwt);
        print(jwt);
        Navigator.pushNamed(context, '/favdriver');
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Material(
      child: ModalProgressHUD(
        inAsyncCall: show_spinner,
        child: Container(
          decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,colors: [Color(0xff373B44),Color(0xff4286f4)])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(child:Image(image: AssetImage('images/carr.png'),height: height*0.3,)),
              Row(
                children: [
                  Icon(Icons.person,size: 50,),
                  Flexible(
                    child: TextField(
                      onChanged: (value)=>{
                        Name=value
                      },
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: 'Enter Your Name',
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Icon(Icons.email_sharp,size: 50,),
                  Flexible(
                    child: TextField(
                      onChanged: (value)=>{
                        Email=value
                      },
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: 'Enter Your Email Address',
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),Row(
                children: [
                  Icon(Icons.vpn_key,size: 50,),
                  Flexible(
                    child: TextField(
                      onChanged: (value)=>{
                        Password=value
                      },
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      keyboardType: TextInputType.name,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: 'Enter Your Password',
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Center(child: Container(color:Colors.orange,child: FlatButton(onPressed:(){
                setState(() {
                  show_spinner=true;
                });
                signup();
                }, child: Text("SignUp",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),)))),
              Row(
                children: [
                  Container(child:Image(image: AssetImage('images/pr.png'),height: height*0.25,)),
                  Text("Pitstop!!",style: TextStyle(fontSize: 50,fontWeight: FontWeight.w500),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
