import 'package:flutter/material.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

  // create _showTimePicker method
  TimeOfDay _timeOfDay = TimeOfDay.now();

  // create _showTimePicker method
  void _showTimePicker(){
    showTimePicker(
        context: context,
        initialTime: TimeOfDay.now()
    ).then((value){
      setState(() {
        _timeOfDay = value!;
      });
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("Time Picker Example"),
        centerTitle: true,
      ),

      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                // The 1st display Button
                SizedBox(height: 150,),
                Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color:Colors.grey.shade500,
                        spreadRadius: 1,
                        blurRadius: 15,
                        offset: Offset(4,4)
                      ),

                      BoxShadow(
                          color:Colors.white,
                          spreadRadius: 1,
                          blurRadius: 15,
                          offset: Offset(-4,-4)
                      )
                    ]
                  ),
                  child:  Center(
                      child: Text( _timeOfDay.format(context).toString(),style: TextStyle(color: Colors.black),)),//  date with showing the time (hours, minutes, seconds),
                ),


                // The 2nd Matarial Button
                SizedBox(height: 170,),
                MaterialButton(
                  onPressed: _showTimePicker,
                  color: Colors.cyan,
                  splashColor: Colors.deepOrangeAccent,
                  child: Center(child: Text("Choose Time",style: TextStyle(color: Colors.white),)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}