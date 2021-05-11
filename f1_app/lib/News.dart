import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:f1_app/news_provider.dart';
import 'package:provider/provider.dart';
class newspage extends StatefulWidget {
  @override
  _newspageState createState() => _newspageState();
}

class _newspageState extends State<newspage> {
  @override
  Response response;
  String text1,text2,text3,image1,image2,image3;
  int p1=0,p2=0,p3=0;
  Future<Response> get_news()async{
    var dio = Dio();
    response = await dio.get('https://f1-appstudent.herokuapp.com/news');
    text1=response.data[0]["Heading"];
    text2=response.data[1]["Heading"];
    text3=response.data[2]["Heading"];
    image1=response.data[0]["image"];
    image2=response.data[1]["image"];
    image3=response.data[2]["image"];
    print('Done');
    return response;
  }
  int ind=2;
  void change(int index){
    if(index==0)
    {
      Navigator.pushNamed(context, '/');
    }
    if(index==1)
    {
      Navigator.pushNamed(context, '/driver');
    }
    if (index == 3) {
      Navigator.pushNamed(context, '/profile');
    }
  }
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                'images/caricon.png',
                height: 50,
                width: 50,
              ),
              label: 'home'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'images/drivericon.png',
                height: 50,
                width: 50,
              ),
              label: 'driver standings'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'images/newsicon.png',
                height: 50,
                width: 50,
              ),
              label: 'driver standings'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'images/profileicon.png',
                height: 50,
                width: 50,
              ),
              label: 'Profile'),
        ],
          currentIndex: ind,
          onTap: change,
        ),
        appBar: AppBar(
          backgroundColor: Colors.black45,
          title: Text(
            'Formula1',
            style: TextStyle(fontSize: 20, color: Colors.red),
          ),
        ),
        backgroundColor: Color(0xff39043D),
        body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/report.jpg'), fit: BoxFit.cover)),
              child: ListView(
                children: [
                  FutureBuilder(
                      future: get_news(),
                      builder: (context,snapshot){
                        if(snapshot.data!=null)
                        {
                          return Column(
                            children: [
                              Text('Top News',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 50),),
                              SizedBox(height: 20,),
                              Consumer<news_provider>(builder: (context,news_text,child){
                                if(p1%2!=0){
                                  return Container(color: Colors.white,
                                    child: Column(
                                      children: [
                                        FadeInImage.assetNetwork(
                                          placeholder: 'images/f1_logo.png',
                                          image: image1,
                                        ),
                                        Text(news_text.t1,style: TextStyle(fontSize: 20),),
                                        FlatButton(onPressed: (){
                                          p1++;
                                          if(p1%2!=0)
                                          {
                                            news_text.news1();
                                          }
                                          else{
                                            news_text.news1_heading();
                                          }
                                        },child: Text('Shrink News')),
                                      ],
                                    ),);
                                }
                                else{
                                  return Container(
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            FadeInImage.assetNetwork(
                                              placeholder: 'images/f1_logo.png',
                                              image: image1,
                                            ),
                                            Column(
                                              children: [
                                                SizedBox(height: 80,),
                                                Center(child: Text(news_text.t1,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),)),
                                              ],
                                            ),
                                          ],
                                        ),
                                        FlatButton(onPressed: (){
                                          p1++;
                                          if(p1%2!=0)
                                          {
                                            news_text.news1();
                                          }
                                          else{
                                            news_text.news1_heading();
                                          }
                                        },child: Text('Full News')),
                                      ],
                                    ),
                                  );
                                }

                              }),
                              SizedBox(height: 20,),
                              Consumer<news_provider>(builder: (context,news_text,child){
                                if(p2%2!=0){
                                  return Container(color: Colors.white,
                                  child: Column(
                                    children: [
                                      FadeInImage.assetNetwork(
                                        placeholder: 'images/f1_logo.png',
                                        image: image2,
                                      ),
                                      Text(news_text.t2,style: TextStyle(fontSize: 20)),
                                      FlatButton(onPressed: (){
                                        p2++;
                                        if(p2%2!=0)
                                        {
                                          news_text.news2();
                                        }
                                        else{
                                          news_text.news2_heading();
                                        }
                                      },child: Text('Shrink News')),
                                    ],
                                  ),);
                                }
                                else{
                                  return Container(
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            FadeInImage.assetNetwork(
                                              placeholder: 'images/f1_logo.png',
                                              image: image2,
                                            ),
                                            Column(
                                              children: [
                                                SizedBox(height: 80,),
                                                Center(child: Text(news_text.t2,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white))),
                                              ],
                                            ),
                                          ],
                                        ),
                                        FlatButton(onPressed: (){
                                          p2++;
                                          if(p2%2!=0)
                                          {
                                            news_text.news2();
                                          }
                                          else{
                                            news_text.news2_heading();
                                          }
                                        },child: Text('Full News')),
                                      ],
                                    ),
                                  );
                                }

                              }),
                              SizedBox(height: 20,),
                              Consumer<news_provider>(builder: (context,news_text,child){
                                if(p3%2!=0){
                                  return Container(color: Colors.white,
                                    child: Column(
                                      children: [
                                        FadeInImage.assetNetwork(
                                          placeholder: 'images/f1_logo.png',
                                          image: image3,
                                        ),
                                        Text(news_text.t3,style: TextStyle(fontSize: 20)),
                                        FlatButton(onPressed: (){
                                          p3++;
                                          if(p3%2!=0)
                                          {
                                            news_text.news3();
                                          }
                                          else{
                                            news_text.news3_heading();
                                          }
                                        },child: Text('Shrink News')),
                                      ],
                                    ),);
                                }
                                else{
                                  return Container(
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Stack(
                                          children: [
                                            FadeInImage.assetNetwork(
                                              placeholder: 'images/f1_logo.png',
                                              image: image3,
                                            ),
                                            Column(
                                              children: [
                                                SizedBox(height: 80,),
                                                Center(child: Text(news_text.t3,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white))),
                                              ],
                                            ),
                                          ],
                                        ),
                                        FlatButton(onPressed: (){
                                          p3++;
                                          if(p3%2!=0)
                                          {
                                            news_text.news3();
                                          }
                                          else{
                                            news_text.news3_heading();
                                          }
                                        },child: Text('Full News')),
                                      ],
                                    ),
                                  );
                                }

                              }),
                            ],
                          );
                        }
                        else{
                          return Column(children: [
                            SizedBox(
                              height: height/2.5,
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
                        }
                      }),
                ],
              ),
            ),
    );
  }
}
