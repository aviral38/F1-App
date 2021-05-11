import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
class news_provider extends ChangeNotifier{
  Response response;
  void news_data()async{
    var dio = Dio();
    response = await dio.get('https://f1-appstudent.herokuapp.com/news');
    t1=response.data[0]["Heading"];
    t2=response.data[1]["Heading"];
    t3=response.data[2]["Heading"];
  }
  void news1(){
    t1=response.data[0]["News"];
    notifyListeners();
  }
  void news1_heading(){
    t1=response.data[0]["Heading"];
    notifyListeners();
  }
  void news2(){
  t2=response.data[1]["News"];
  notifyListeners();
  }
  void news2_heading(){
    t2=response.data[1]["Heading"];
    notifyListeners();
  }
  void news3(){
  t3=response.data[2]["News"];
  notifyListeners();
  }
  void news3_heading(){
    t3=response.data[2]["Heading"];
    notifyListeners();
  }


  String t1,t2,t3;


}