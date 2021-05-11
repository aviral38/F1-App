import 'package:flutter/material.dart';
import 'package:f1_app/boxes.dart';
import 'package:dio/dio.dart';
class driver extends StatefulWidget {
  @override
  _driverState createState() => _driverState();
}

class _driverState extends State<driver> {
  @override
  void initState(){
    get_driver();
    super.initState();
  }
  Response response;
  Future<Response> get_driver()async{
    var dio = Dio();
    response = await dio.get('https://f1-appstudent.herokuapp.com/driverstanding');
    print(response.data[1]["Name"]);
    for (int i=0;i<response.data.length;i++)
      {
        for(int j=0;j<response.data.length-i-1;j++)
          {
            if(response.data[j]['Points']<response.data[j+1]['Points'])
              {
                var temp=response.data[j];
                response.data[j]=response.data[j+1];
                response.data[j+1]=temp;
              }
          }
      }
    print('Done');
    return response;
  }
  int ind=1;
  void change(int index){
    if(index==0)
      {
        Navigator.pushNamed(context, '/');
      }
    if(index==2)
      {
        Navigator.pushNamed(context,'/news');
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
            label: 'News'),
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
      body:Container(
        decoration: BoxDecoration(image: DecorationImage(image:AssetImage('images/driver.jpg'),fit: BoxFit.cover)),
        child: ListView(
          children: [
            FutureBuilder(
              future: get_driver(),
              builder: (context,snapshot){//response is snapshot here
                if(snapshot.data!=null)
                {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          child: Row(
                            children: [
                              Text(
                                "Driver's Standing",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(width: width*0.15,),
                              Text(
                                "Points",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          box(
                            color: Colors.white,
                            text: snapshot.data.data[0]["Name"],
                            img: AssetImage('images/'+snapshot.data.data[0]["Team"]+'.png'),
                          ),
                          SizedBox(width: width*0.05,),
                          Text(
                            snapshot.data.data[0]["Points"].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(height:15),
                      Row(
                        children: [
                          box(
                            color: Colors.white,
                            text: snapshot.data.data[1]["Name"],
                            img: AssetImage('images/'+snapshot.data.data[1]["Team"]+'.png'),
                          ),
                          SizedBox(width: width*0.05,),
                          Text(
                            snapshot.data.data[1]["Points"].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(height:15),
                      Row(
                        children: [
                          box(
                            color: Colors.white,
                            text: snapshot.data.data[2]["Name"],
                            img: AssetImage('images/'+snapshot.data.data[2]["Team"]+'.png'),
                          ),
                          SizedBox(width: width*0.05,),
                          Text(
                            snapshot.data.data[2]["Points"].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(height:15),
                      Row(
                        children: [
                          box(
                            color: Colors.white,
                            text: snapshot.data.data[3]["Name"],
                            img: AssetImage('images/'+snapshot.data.data[3]["Team"]+'.png'),
                          ),
                          SizedBox(width: width*0.05,),
                          Text(
                            snapshot.data.data[3]["Points"].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(height:15),
                      Row(
                        children: [
                          box(
                            color: Colors.white,
                            text: snapshot.data.data[4]["Name"],
                            img: AssetImage('images/'+snapshot.data.data[4]["Team"]+'.png'),
                          ),
                          SizedBox(width: width*0.05,),
                          Text(
                            snapshot.data.data[4]["Points"].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(height:15),
                      Row(
                        children: [
                          box(
                            color: Colors.white,
                            text: snapshot.data.data[5]["Name"],
                            img: AssetImage('images/'+snapshot.data.data[5]["Team"]+'.png'),
                          ),
                          SizedBox(width: width*0.05,),
                          Text(
                            snapshot.data.data[5]["Points"].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(height:15),
                      Row(
                        children: [
                          box(
                            color: Colors.white,
                            text: snapshot.data.data[6]["Name"],
                            img: AssetImage('images/'+snapshot.data.data[6]["Team"]+'.png'),
                          ),
                          SizedBox(width: width*0.05,),
                          Text(
                            snapshot.data.data[6]["Points"].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(height:15),
                      Row(
                        children: [
                          box(
                            color: Colors.white,
                            text: snapshot.data.data[7]["Name"],
                            img: AssetImage('images/'+snapshot.data.data[7]["Team"]+'.png'),
                          ),
                          SizedBox(width: width*0.05,),
                          Text(
                            snapshot.data.data[7]["Points"].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(height:15),
                      Row(
                        children: [
                          box(
                            color: Colors.white,
                            text: snapshot.data.data[8]["Name"],
                            img: AssetImage('images/'+snapshot.data.data[8]["Team"]+'.png'),
                          ),
                          SizedBox(width: width*0.05,),
                          Text(
                            snapshot.data.data[8]["Points"].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(height:15),
                      Row(
                        children: [
                          box(
                            color: Colors.white,
                            text: snapshot.data.data[9]["Name"],
                            img: AssetImage('images/'+snapshot.data.data[9]["Team"]+'.png'),
                          ),
                          SizedBox(width: width*0.05,),
                          Text(
                            snapshot.data.data[9]["Points"].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(height:15),
                      Row(
                        children: [
                          box(
                            color: Colors.white,
                            text: snapshot.data.data[10]["Name"],
                            img: AssetImage('images/'+snapshot.data.data[10]["Team"]+'.png'),
                          ),
                          SizedBox(width: width*0.05,),
                          Text(
                            snapshot.data.data[10]["Points"].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(height:15),
                      Row(
                        children: [
                          box(
                            color: Colors.white,
                            text: snapshot.data.data[11]["Name"],
                            img: AssetImage('images/'+snapshot.data.data[11]["Team"]+'.png'),
                          ),
                          SizedBox(width: width*0.05,),
                          Text(
                            snapshot.data.data[11]["Points"].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(height:15),
                      Row(
                        children: [
                          box(
                            color: Colors.white,
                            text: snapshot.data.data[12]["Name"],
                            img: AssetImage('images/'+snapshot.data.data[12]["Team"]+'.png'),
                          ),
                          SizedBox(width: width*0.05,),
                          Text(
                            snapshot.data.data[12]["Points"].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(height:15),
                      Row(
                        children: [
                          box(
                            color: Colors.white,
                            text: snapshot.data.data[13]["Name"],
                            img: AssetImage('images/'+snapshot.data.data[13]["Team"]+'.png'),
                          ),
                          SizedBox(width: width*0.05,),
                          Text(
                            snapshot.data.data[13]["Points"].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(height:15),
                      Row(
                        children: [
                          box(
                            color: Colors.white,
                            text: snapshot.data.data[14]["Name"],
                            img: AssetImage('images/'+snapshot.data.data[14]["Team"]+'.png'),
                          ),
                          SizedBox(width: width*0.05,),
                          Text(
                            snapshot.data.data[14]["Points"].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(height:15),
                      Row(
                        children: [
                          box(
                            color: Colors.white,
                            text: snapshot.data.data[15]["Name"],
                            img: AssetImage('images/'+snapshot.data.data[15]["Team"]+'.png'),
                          ),
                          SizedBox(width: width*0.05,),
                          Text(
                            snapshot.data.data[15]["Points"].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(height:15),
                      Row(
                        children: [
                          box(
                            color: Colors.white,
                            text: snapshot.data.data[16]["Name"],
                            img: AssetImage('images/'+snapshot.data.data[16]["Team"]+'.png'),
                          ),
                          SizedBox(width: width*0.05,),
                          Text(
                            snapshot.data.data[16]["Points"].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(height:15),
                      Row(
                        children: [
                          box(
                            color: Colors.white,
                            text: snapshot.data.data[17]["Name"],
                            img: AssetImage('images/'+snapshot.data.data[17]["Team"]+'.png'),
                          ),
                          SizedBox(width: width*0.05,),
                          Text(
                            snapshot.data.data[17]["Points"].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(height:15),
                      Row(
                        children: [
                          box(
                            color: Colors.white,
                            text: snapshot.data.data[18]["Name"],
                            img: AssetImage('images/'+snapshot.data.data[18]["Team"]+'.png'),
                          ),
                          SizedBox(width: width*0.05,),
                          Text(
                            snapshot.data.data[18]["Points"].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      SizedBox(height:15),
                      Row(
                        children: [
                          box(
                            color: Colors.white,
                            text: snapshot.data.data[19]["Name"],
                            img: AssetImage('images/'+snapshot.data.data[19]["Team"]+'.png'),
                          ),
                          SizedBox(width: width*0.05,),
                          Text(
                            snapshot.data.data[19]["Points"].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  );

                }
                return Column(
                  children: [
                    SizedBox(height: height/2.5,),
                    Container(
                      child: CircularProgressIndicator(
                      backgroundColor: Colors.orange,
                      strokeWidth: 10,
                      ),
                      height: 100,
                      width: 100,
                    ),
                ]
                );
              },
            ),
          ]
        ),
      ),
    );
  }
}



