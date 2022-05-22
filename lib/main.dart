import 'package:flutter/material.dart';
import 'package:flutter_application_1/result_screen.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData.dark(

      ),
      home: const InputPage(),
    );
  }
}

enum Gender {
  male, female
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? gender;
  var age = 18;
  var heigth = 150;
  var weight = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBG,

      appBar: AppBar(
        backgroundColor: kBG,
        title: const Text("BMI CALCULATOR", style: kBodyTextStyle,),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: <Widget>[


              Expanded(
                child: ReusableCard(  
                  onTap: (){
                    
                    setState(() {
                      gender = Gender.male;
                    });
                  },
                  color: gender == Gender.male ? kActiveCardColour : kInactiveCardColour,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(
                      FontAwesomeIcons.mars,
                      size: 100,
                    ),
                    const SizedBox(height: 20,),
                    const Text(
                      'MALE',
                      style: kBodyTextStyle,
                    ),
                  ], 
                )
                ),
              ),


              Expanded(
                child: ReusableCard(  
                  onTap: (){
                    setState(() {
                      
                      gender = Gender.female;
                    });
                  },
                  color: gender == Gender.female ? kActiveCardColour : kInactiveCardColour,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      FontAwesomeIcons.venus,
                      size: 100,
                    ),
                    SizedBox(height: 20,),
                    Text(
                      'FEMALE',
                      style: kBodyTextStyle,
                    ),
                  ], 
                )
                ),
              ),


            ],
            ),
          ),
          
          Expanded(
            child: ReusableCard(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
                  Text('HEIGHT', style: kBodyTextStyle,),
                  Text(heigth.toString(), style: kNumberTextStyle,),
                  Slider(
                    min: 130,
                    max: 220,
                    activeColor: kBottomContainerColour,
                    value: heigth.toDouble(), 
                    onChanged: (value) {
                    setState(() {
                      heigth = value.round();
                    });
                  })
               ],
               )
            )
          ),
          
          Expanded(
            child: Row(
              children: <Widget>[

              Expanded(
            child: Row(
              children: <Widget>[
                
                Expanded(
                child: ReusableCard(  
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[   
                    Text(
                      'WEIGHT',
                      style: kBodyTextStyle,
                    ),
                    SizedBox(height: 20,),
                    Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        RawMaterialButton(
                          onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },
                          child: Icon(FontAwesomeIcons.plus),
                          shape: CircleBorder(),
                          constraints: BoxConstraints.tightFor(
                            width: 56.0,
                            height: 56.0
                          ),
                          fillColor: Color(0xFF222747),
                          padding: EdgeInsets.all(5),
                          elevation: 10,
                        ),
                        
                        SizedBox(width: 10,),

                        RawMaterialButton(
                          onPressed: (){
                            setState(() {
                              weight--;
                            });
                          },
                          child: Icon(FontAwesomeIcons.minus),
                          shape: CircleBorder(),
                          constraints: BoxConstraints.tightFor(
                            width: 56.0,
                            height: 56.0
                          ),
                          fillColor: Color(0xFF222747),
                          padding: EdgeInsets.all(5),
                          elevation: 10,
                        ),

                      ],
                    ),
                  ], 
                )
                ),
              ),

              Expanded(
                child: ReusableCard(  
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[   
                    Text(
                      'AGE',
                      style: kBodyTextStyle,
                    ),
                    SizedBox(height: 20,),
                    Text(
                      age.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        RawMaterialButton(
                          onPressed: (){
                            setState(() {
                              age++;
                            });
                          },
                          child: Icon(FontAwesomeIcons.plus),
                          shape: CircleBorder(),
                          constraints: BoxConstraints.tightFor(
                            width: 56.0,
                            height: 56.0
                          ),
                          fillColor: Color(0xFF222747),
                          padding: EdgeInsets.all(5),
                          elevation: 10,
                        ),
                        
                        SizedBox(width: 10,),

                        RawMaterialButton(
                          onPressed: (){
                            setState(() {
                              age--;
                            });
                          },
                          child: Icon(FontAwesomeIcons.minus),
                          shape: CircleBorder(),
                          constraints: BoxConstraints.tightFor(
                            width: 56.0,
                            height: 56.0
                          ),
                          fillColor: Color(0xFF222747),
                          padding: EdgeInsets.all(5),
                          elevation: 10,
                        ),

                      ],
                    ),
                  ], 
                )
                ),
              ),

              
            ],
            ),
          ),

           
          
      ]
      )
      ),

      SizedBox(height: 20,),

      GestureDetector(
              onTap: (){
                final heigthSquared = heigth / 100;
                final res = weight / (heigthSquared * heigthSquared);
                Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(bmi: res.round().toString(),)));
              },
              child: Container(
                height: 80,
                color: kBottomContainerColour,
                child: Center(
                  child: Text(
                    'CALCULATE MY BMI',
                    style: kLargeButtonTextStyle,
                  ),
                ),
              ),
            ),
      ])
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function? onTap;

  
   ReusableCard({
    Key? key, 
    this.color = kInactiveCardColour, 
    required this.child, 
    this.onTap, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: child,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
