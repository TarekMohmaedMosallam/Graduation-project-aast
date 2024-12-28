import 'package:flutter/material.dart';
import 'package:final_project_gd/final_project/presentation/manager/shape/shape.dart';
import 'package:final_project_gd/final_project/presentation/pages/HomePage.dart';

import '../../../data/models/Motion Toast/Motion Toast.dart';
import '../../data/models/Warning Message.dart';


class SmartIrrigationComponents extends StatefulWidget {
  SmartIrrigationComponents({Key? key}) : super(key: key);

  @override
  State<SmartIrrigationComponents> createState() => SmartIrrigationComponentState();
}

class SmartIrrigationComponentState extends State<SmartIrrigationComponents> {
  double number = 110;
  double secondNumber = 20;
  double thirdNumber = 40;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Motiontoast.showWarnings(context: context, measurement: number, saveWarning: saveWarning);
      Motiontoast.showWarnings(context: context, measurement: secondNumber, saveWarning: saveWarning);
    });
  }

  void saveWarning(WarningMessage message) {
    setState(() {
      WarningMessage.warningmessagelist.add(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Positioned(
              left: 30,
              top: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: CircleBorder(),
                  fixedSize: Size(50, 50),
                  padding: EdgeInsets.all(20),
                ),
                child: Icon(Icons.arrow_back, color: Colors.grey),
              ),
            ),
            Positioned(
              left: 107,
              top: 75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Smart irrigation',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Positioned(
              left: 16,
              top: 96,
              child: CustomPaint(
                painter: SemiCircleProgress(number, false, Colors.black),
                size: Size(180, 180),
              ),
            ),
            Positioned(
              left: 210,
              top: 96,
              child: CustomPaint(
                painter: SemiCircleProgress(secondNumber, false, Color(0xffC3FDB8)),
                size: Size(180, 180),
              ),
            ),
            Positioned(
              left: 100,
              top: 280,
              child: CustomPaint(
                painter: SemiCircleProgress(thirdNumber, false, Color(0xffC3FDB8)),
                size: Size(180, 180),
              ),
            ),
            Positioned(
              left: 55,
              top: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Temperature',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Positioned(
              left: 255,
              top: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Humidity',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Positioned(
              left: 130,
              top: 330,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Soil moisture',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Positioned(
              left: 75,
              top: 250,
              child: Text(
                '${number.toStringAsFixed(0)}%',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              left: 270,
              top: 250,
              child: Text(
                '${secondNumber.toStringAsFixed(0)}%',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              left: 160,
              top: 435,
              child: Text(
                '${thirdNumber.toStringAsFixed(0)}%',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              left: 135,
              top: 640,
              child: ElevatedButton(
                onPressed: () {
                  // Define the action when the button is pressed
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: CircleBorder(),
                  fixedSize: Size(110, 110),
                  padding: EdgeInsets.all(20),
                ),
                child: Icon(Icons.check, color: Colors.green),
              ),
            ),
            Positioned(
              left: 170,
              top: 675,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'ON',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            Positioned(
              left: 130,
              top: 595,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Water Pump',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
