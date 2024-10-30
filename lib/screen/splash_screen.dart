import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todoapp/constant/color.dart';
import 'package:todoapp/screen/dashbored.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashbored()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BG,
       body: SafeArea(
         child: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("Manage your", style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold, color: Colors.white),),
               Text("Daily TO DO", style: TextStyle(fontSize: 30, color: Colors.white),),
               SizedBox(height: 10,),
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Image.asset('assets/images/splach.png', width: 390, height: 390,),
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Container(
                     width: 40,
                     height: 10,
                     decoration: BoxDecoration(
                         color: Colors.amber,
                       borderRadius: BorderRadius.circular(24)
                     ),
                   ),
                   SizedBox(width: 5,),
                   Container(
                     width: 40,
                     height: 10,
                     decoration: BoxDecoration(
                         color: Colors.amber.shade200,
                         borderRadius: BorderRadius.circular(24)
                     ),),
                   SizedBox(width: 5,),
                   Container(
                     width: 40,
                     height: 10,
                     decoration: BoxDecoration(
                         color: Colors.amber.shade200,
                         borderRadius: BorderRadius.circular(24)
                     ),),
                 ],
               ),
               SizedBox(height: 5,),
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Text("Without much worry just manage things as easy as piece of cake", style: TextStyle(color: Colors.white, fontSize: 16),textAlign: TextAlign.center,),
               ),
               SizedBox(height: 10,),
               ElevatedButton(onPressed: (){
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dashbored()));
               }, child: Text("Create a Note", style: TextStyle(fontSize: 16, color:Colors.white),), style: ElevatedButton.styleFrom(backgroundColor: tdbtn),),
             ],
           ),
         ),
       ),
    );
  }
}
