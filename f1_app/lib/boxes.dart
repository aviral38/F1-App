import 'package:flutter/material.dart';
class box extends StatelessWidget {
  @override
  box({this.color,this.text,this.img});
  Color color;
  String text;
  AssetImage img;
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(color: Colors.purple,gradient:LinearGradient(colors: [Color(0xfff5af19),Color(0xff12711)]),border: Border.all(width: 1,style: BorderStyle.none),borderRadius: BorderRadius.all(Radius.circular(10))),
      width: width*0.75,
      child: Wrap(
        direction: Axis.horizontal,
        children: [
          Image(image: img,height: 50,width: 50,),
          SizedBox(width: 05,),
          Text(text,style: TextStyle(color: Colors.black,fontSize: 30.0,fontWeight: FontWeight.w500),),
        ],
      ),
    );
  }
}
