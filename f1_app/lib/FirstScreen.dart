import 'package:flutter/material.dart';
class first extends StatefulWidget {
  @override
  _firstState createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(begin:Alignment.bottomLeft,end: Alignment.topRight,colors: [Color(0xfff12711),Color(0xfff5af19)]),
      ),
      child: Column(
        children: [
          SizedBox(height: height*0.2,),
          Image(image: AssetImage('images/f1_logo.png')),
          SizedBox(height: 50,),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(begin:Alignment.bottomLeft,end: Alignment.topRight,colors: [Color(0xfffd1d1d),Color(0xfffcb045)]),
            ),child: FlatButton(
            child: Text('SignUp',style:TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 50),),
            onPressed: (){Navigator.pushNamed(context, '/user_reg');},
          ),),
          SizedBox(height: 20,),
          Container(decoration: BoxDecoration(
            gradient: LinearGradient(begin:Alignment.bottomLeft,end: Alignment.topRight,colors: [Color(0xfffd1d1d),Color(0xfffcb045)]),
          ),child: FlatButton(
            child: Text('Login',style:TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 50),),
            onPressed: (){Navigator.pushNamed(context, '/user_login');},
          ),),
        ],
      ),
    );
  }
}
