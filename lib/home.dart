import 'dart:async';

import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int seconds=2;
  int minutes=10;
  void startTimer(){
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if(minutes>0){
        setState(() {
          minutes--;
        });
      }else if(minutes==0 && seconds>0){
        minutes=59;
        seconds-=1;
      }
      else{
        timer.cancel();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          minutes>9?
          Text("0$seconds:$minutes",style: const TextStyle(color: Colors.black,fontSize: 40),)
          :
        Text("0$seconds:0$minutes",style: const TextStyle(color: Colors.black,fontSize: 40),),
    const SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 80,
                height: 70,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      )
                  ),
                    onPressed: (){
                    print("cliked");
                    startTimer();
                    }, child: const Text("Start")),
              ),],
          )
        ],
      ),
    );
  }
}
