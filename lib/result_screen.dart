import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';

class ResultPage extends StatelessWidget {
  final String bmi;
  ResultPage({required this.bmi});
  
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBG,
      appBar: AppBar(
          backgroundColor: kBG,
          title: Text(
            "BMI CALCULATOR",
            style: kBodyTextStyle,
          )
        ),

        
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
                Column(
                  children: [
                    const SizedBox(height: 180,),
                    const Text(
                      "YOUR BMI IS",
                      style: kResultTextStyle,
                    ),
                    const SizedBox(height: 20,),
                     Text(
                      bmi,
                      style: kBMITextStyle,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(
                height: 80,
                color: kBottomContainerColour,
                child: Center(
                  child: Text(
                    'RECALCULATE MY BMI',
                    style: kLargeButtonTextStyle,
                  ),
                ),
              ),
                  ),
                )
            ],
          ),
        ),
      );
  }
}
