import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/main.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:const MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title:Center(child: Text("How's the Weather there?",style:TextStyle(fontSize: 30,color:Colors.black,fontWeight:FontWeight.w900))),
        ),
        body:
        Center(child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
                future: apicall("50","60"),
                builder:(context,snapshot){
                  if(snapshot.hasData){
                    return Column(
                        children:[

                          Row(

                            children: [
                              Padding(
                                padding: const  EdgeInsets. fromLTRB(440, 0, 0.0, 5.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(45.0)),
                                        color:Colors.yellow.shade300,
                                        border: Border.all(color: Colors.black87)
                                    ),
                                    height:70,
                                    width:300,
                                    child:Column(
                                        children:[
                                          Padding(
                                            padding: const  EdgeInsets. fromLTRB(0.0, 26.0, 0.0, 5.0),
                                            child: Text("LATITUDE IS 50" ,style:TextStyle(fontSize: 16,fontWeight:FontWeight.w900)),
                                          ),

                                        ]
                                    )
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(45.0)),
                                        color:Colors.yellow.shade300,
                                        border: Border.all(color: Colors.black87)
                                    ),
                                    height:70,
                                    width:300,
                                    child:Column(
                                        children:[
                                          Padding(
                                            padding: const  EdgeInsets. fromLTRB(0.0, 26.0, 0.0, 5.0),
                                            child: Text("LONGITUDE IS 60" ,style:TextStyle(fontSize: 16,fontWeight:FontWeight.w900)),
                                          ),

                                        ]
                                    )
                                ),
                              ),

                            ],
                          ),
                          // color:Colors.lightBlue,
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(45.0)),
                                    color:Colors.yellow.shade200,
                                    border: Border.all(color: Colors.black87)
                                ),
                                height:90,
                                width:300,
                                child:Column(
                                    children:[
                                      Padding(
                                        padding: const  EdgeInsets. fromLTRB(0.0, 26.0, 0.0, 5.0),
                                        child: Text("Current state is : "+ snapshot.data["description"] ,style:TextStyle(fontSize: 16,fontWeight:FontWeight.w700)),
                                      ),
                                      FaIcon(FontAwesomeIcons.temperatureLow),
                                    ]
                                )
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(45.0)),
                                    color:Colors.yellow.shade200,
                                    border: Border.all(color: Colors.black87)
                                ),
                                height:70,
                                width:300,
                                child:Center(
                                  child: Column(
                                      children:[
                                        Padding(
                                          padding: const  EdgeInsets. fromLTRB(0.0, 26.0, 0.0, 5.0),

                                          child: Text("The Country is: "+ snapshot.data["Country"] ,style:TextStyle(fontSize: 16,fontWeight:FontWeight.w700)),
                                        ),

                                      ]
                                  ),
                                )
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(45.0)),
                                    color:Colors.yellow.shade200,
                                    border: Border.all(color: Colors.black87)
                                ),
                                height:90,
                                width:300,
                                child:Column(
                                    children:[
                                      Padding(
                                        padding: const  EdgeInsets. fromLTRB(0.0, 26.0, 0.0, 5.0),
                                        child: Text("Wind speed : "+ snapshot.data["Wind-speed"] ,style:TextStyle(fontSize: 16,fontWeight:FontWeight.w700)),
                                      ),
                                      FaIcon(FontAwesomeIcons.wind),
                                    ]
                                )
                            ),
                          ),



                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(45.0)),
                                    color:Colors.yellow.shade200,
                                    border: Border.all(color: Colors.black87)
                                ),
                                height:70,
                                width:300,
                                child:Column(
                                    children:[
                                      Text( "Temperature is : "+ snapshot.data["temperature"] ,style:TextStyle(fontSize: 16,fontWeight:FontWeight.w700)),
                                      FaIcon(FontAwesomeIcons.temperatureLow),
                                    ]
                                )
                            ),
                          ),







                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(45.0)),
                                  color:Colors.yellow.shade200,
                                  border: Border.all(color: Colors.black87)
                              ),
                              height:70,
                              width:300,
                              child:Column(
                                  children:[
                                    Text( "Humidity is : "+ snapshot.data["Humidity"] ,style:TextStyle(fontSize: 16,fontWeight:FontWeight.w700)),
                                    FaIcon(FontAwesomeIcons.cloud),
                                  ]
                              ),
                            ),
                          )






                        ]
                    );
                  }
                  else
                  {
                    return CircularProgressIndicator();
                  }
                } ),
          ],

        )
        ));
  }
}
int a=10;
Future apicall(a,b) async{

  String text="https://api.openweathermap.org/data/2.5/weather?lat="+a+"&lon="+b+"&appid=1c05ee004e7a37d9f1f4270cb855c961";
  final url=Uri.parse(text);
  //final url=URL.parse("")

  print((a.toString()).runtimeType);
  final response = await http.get(url);
  print(response.body);
  final json=jsonDecode(response.body);
  print(json["weather"][0]["main"]);
  final output={"description": json["weather"][0]["description"],"temperature": json["main"]["temp"].toString(),"Humidity":json["main"]["humidity"].toString(),"Wind-speed":json["wind"]["speed"].toString(),"Country":json["sys"]["country"]};
  //return json["weather"][0]["description"];
  return output;
}