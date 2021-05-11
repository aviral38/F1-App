import 'package:flutter/material.dart';
class team_profile extends StatelessWidget {
  team_profile({this.image,this.name,this.press});
  AssetImage image;
  String name;
  Function press;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialButton(
      onPressed: ()async{
        await press();
        Navigator.pushNamed(context, '/');
      },
      child: Container(
        height: height*0.25,
        width: width-20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          gradient: LinearGradient(colors: [Color(0xffff4b1f),Color(0xffffc371)]),
        ),
        child: Row(
          children: [
            Image(image: image,height: height*0.8,width: width*0.3,),
            SizedBox(width: 20,),
            Column(children: [
              SizedBox(height: height*0.25*0.3,),
              Text(name,style:TextStyle(fontSize: 20),),
            ],),
          ],
        ),
      ),
    );
  }
}
