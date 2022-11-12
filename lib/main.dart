import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



//   // This widget is the root of your application.
// ///////////////////////////
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Retrieve Text Input',
//       home: MyCustomForm(),
//     );
//   }
// }
//
// // Define a custom Form widget.
// class MyCustomForm extends StatefulWidget {
//   const MyCustomForm({super.key});
//
//   @override
//   State<MyCustomForm> createState() => _MyCustomFormState();
// }
//
// // Define a corresponding State class.
// // This class holds the data related to the Form.
// class _MyCustomFormState extends State<MyCustomForm> {
//   // Create a text controller and use it to retrieve the current value
//   // of the TextField.
//   final myController = TextEditingController();
//   final myController1 = TextEditingController();
//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     myController.dispose();
//     myController1.dispose();
//     super.dispose();
//   }
// //////////////////////////

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:const MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  //final myController = TextEditingController();
  //final myController1=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Weather app"),
      ),
    body:
        Center(child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                height:100,
                width:200,

                color:Colors.amberAccent,
                child: Center(
                  child: TextField (
                   // controller:myController,
                    decoration: InputDecoration(
                        border: InputBorder.none,

                        labelText: 'longitude',
                        hintText: 'Enter Your Longitude:'
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                height:100,
                width:200,
                color:Colors.amberAccent,
                child: TextField (
                  style:TextStyle(fontSize:40,),
                 // controller:myController1,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'latitude',
                      hintText: 'Enter the latitude:'
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
        FutureBuilder(
            future: apicall("50","60"),
            builder:(context,snapshot){
              if(snapshot.hasData){
                return Column(
                  children:[
                 // color:Colors.lightBlue,
                   Padding(

                    padding: const EdgeInsets.all(10.0),

                    child: Text(snapshot.data["description"]),

                  ),

              ]
                );
              }
              else
                {
                  return CircularProgressIndicator();
                }
            } ),
    //     Center(
    //       child: Column(
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.all(14.0),
    //             child: Container(
    //               height:100,
    //               width:200,
    //
    //               color:Colors.amberAccent,
    //               child: Center(
    //                 child: TextField (
    // decoration: InputDecoration(
    // border: InputBorder.none,
    //                 labelText: 'longitude',
    //                 hintText: 'Enter Your Longitude:'
    // ),
    // ),
    //               ),
    //             ),
    //           ),
    //   Padding(
    //     padding: const EdgeInsets.all(14.0),
    //     child: Container(
    //       height:100,
    //       width:200,
    //       color:Colors.amberAccent,
    //       child: TextField (
    //               decoration: InputDecoration(
    //                   border: InputBorder.none,
    //                   labelText: 'latitude',
    //                   hintText: 'Enter the latitude:'
    //               ),
    //       ),
    //     ),
    //   ),
    //         ],
    //       ),
    //     )

    ],
    )
        )

    );
  }
}

Future apicall(a,b) async{

  String text="https://api.openweathermap.org/data/2.5/weather?lat="+a+"&lon="+b+"&appid=1c05ee004e7a37d9f1f4270cb855c961";
  final url=Uri.parse(text);
      //final url=URL.parse("")
  final response = await http.get(url);
  print(response.body);
  final json=jsonDecode(response.body);
  print(json["weather"][0]["main"]);
  final output={"description": json["weather"][0]["description"],"temperature": json["main"]["temp"]};
  //return json["weather"][0]["description"];
  return output;
  //final data =
}

