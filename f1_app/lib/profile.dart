import 'package:flutter/material.dart';
class profile extends StatelessWidget {
  @override
  profile({this.image,this.name,this.team,this.number});
  AssetImage image;
  String name,team,number;
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height*0.25,
      width: width-30,
      decoration: BoxDecoration(
        color: Colors.white,
        gradient: LinearGradient(colors: [Color(0xff6190E8),Color(0xffA7BFE8)]),
        borderRadius: BorderRadius.all(Radius.circular(25.0))
      ),
      child: Row(
        children: [
          Image(image: image,height: height*0.3,width: width*0.4,),
          Column(children: [
            SizedBox(height: height*0.25*0.25,),
            Text(name,style:TextStyle(fontSize: 20),),
            Text(team,style:TextStyle(fontSize: 20)),
            Text(number,style:TextStyle(fontSize: 20)),
          ],),
        ],
      ),
    );
  }
}
