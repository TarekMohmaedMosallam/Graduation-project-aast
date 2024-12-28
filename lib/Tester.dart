// import 'package:flutter/material.dart';
// import 'dart:math';
//
// import 'package:final_project_gd/final_project/data/models/values.dart';
// import 'package:final_project_gd/final_project/presentation/pages/Basic_Page.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class SmartIrrigation extends StatefulWidget {
//    SmartIrrigation({super.key});
//
//   @override
//   State<SmartIrrigation> createState() => SmartIrrigationState();
// }
//
// class SmartIrrigationState extends State<SmartIrrigation> {
//   @override
//   Widget build(BuildContext context) {
//     double number = 35;
//     double secondnumber = 50;
//     double thirdnumber = 70;
//     int count = 0;
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       //appBar: AppBar(title: Text('Smart irrigation')),
//       // appBar: AppBar(
//       //   automaticallyImplyLeading: false,
//       //   backgroundColor: Colors.white,
//       //   elevation: 0.0,
//       //   actions: [
//       //     Container(
//       //       margin: const EdgeInsets.only(
//       //           right: 360, top: 30), // Adjust 'top' to move the button down
//       //       width: screenWidth / 26.50,
//       //       child: InkWell(
//       //         child: Image.asset(Bluring.backicon, fit: BoxFit.fill),
//       //         onTap: () {
//       //           Navigator.of(context).push(SlideRight(page: Basic_Page()));
//       //         },
//       //       ),
//       //     ),
//       //   ],
//       // ),
//
//       body: Stack(
//         alignment: Alignment.topLeft,
//         children: [
//           Positioned(
//             // button after third number
//             left: 30, // Align with the CustomPaint
//             top: 60, // Place below the third number with some spacing
//             child: ElevatedButton(
//               onPressed: () {
//                 // Define the action when the button is pressed
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.white, // Button background color
//                 shape: CircleBorder(), // Circular shape
//                 fixedSize: Size(50, 50),
//                 padding: EdgeInsets.all(20), // Adjust padding for size
//               ),
//               child: Icon(Icons.arrow_back,
//                   color: Colors.grey), // Example icon inside the button
//             ),
//           ),
//           Positioned(
//             //button text
//             left: 107, // Align with the CustomPaint
//             top: 75, // Place below the CustomPaint with some spacing
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   'Smart irrigation',
//                   style: TextStyle(
//                     fontSize: 26, // Increase the font size
//                     color: Colors.black, // Change the text color to white
//                     fontWeight: FontWeight.bold, // Optional: make the text bold
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Transform.translate(
//                   offset: Offset(-20, 0), // Move the number to the left
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             //first circle
//             left: 16, // Adjust as needed
//             top: 96, // Adjust as needed
//             child: CustomPaint(
//               painter: SemiCircleProgress(number, false),
//               size: Size(180, 180),
//             ),
//           ),
//           Positioned(
//             // second circle
//             left: 210, // Adjust as needed
//             top: 96, // Adjust as needed
//             child: CustomPaint(
//               painter: SemiCircleProgress(number, false),
//               size: Size(180, 180),
//             ),
//           ),
//           Positioned(
//             // third circle
//             left: 100, // Adjust as needed
//             top: 280, // Adjust as needed
//             child: CustomPaint(
//               painter: SemiCircleProgress(number, false),
//               size: Size(180, 180),
//             ),
//           ),
//           Positioned(
//             //first temprature
//             left: 55, // Align with the CustomPaint
//             top: 150, // Place below the CustomPaint with some spacing
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   'Temprature',
//                   style: TextStyle(
//                     fontSize: 20.0, // Set the desired font size here
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Transform.translate(
//                   offset: Offset(-20, 0), // Move the number to the left
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             //second temprature
//             left: 255, // Align with the CustomPaint
//             top: 150, // Place below the CustomPaint with some spacing
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   'Humidity',
//                   style: TextStyle(
//                     fontSize: 20.0, // Set the desired font size here
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Transform.translate(
//                   offset: Offset(-20, 0), // Move the number to the left
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             //third temprature
//             left: 130, // Align with the CustomPaint
//             top: 330, // Place below the CustomPaint with some spacing
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   'Soil moisture',
//                   style: TextStyle(
//                     fontSize: 20.0, // Set the desired font size here
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Transform.translate(
//                   offset: Offset(-20, 0), // Move the number to the left
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             //first number
//             left: 75, // Align with the CustomPaint
//             top: 250, // Place below the C
//             child: Text(
//               '${number.toStringAsFixed(0)}%',
//               style: TextStyle(
//                 fontSize: 35,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Positioned(
//             //second number
//             left: 270, // Align with the CustomPaint
//             top: 250, // Place below the C
//             child: Text(
//               '${secondnumber.toStringAsFixed(0)}%',
//               style: TextStyle(
//                 fontSize: 35,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Positioned(
//             //third number
//             left: 160, // Align with the CustomPaint
//             top: 435, // Place below the C
//             child: Text(
//               '${thirdnumber.toStringAsFixed(0)}%',
//               style: TextStyle(
//                 fontSize: 35,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Positioned(
//             // button after third number
//             left: 135, // Align with the CustomPaint
//             top: 640, // Place below the third number with some spacing
//             child: ElevatedButton(
//               onPressed: () {
//                 // Define the action when the button is pressed
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green, // Button background color
//                 shape: CircleBorder(), // Circular shape
//                 fixedSize: Size(110, 110),
//                 padding: EdgeInsets.all(20), // Adjust padding for size
//               ),
//               child: Icon(Icons.check,
//                   color: Colors.green), // Example icon inside the button
//             ),
//           ),
//           Positioned(
//             //button text
//             left: 170, // Align with the CustomPaint
//             top: 675, // Place below the CustomPaint with some spacing
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   'ON',
//                   style: TextStyle(
//                     fontSize: 28, // Increase the font size
//                     color: Colors.white, // Change the text color to white
//                     fontWeight: FontWeight.bold, // Optional: make the text bold
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Transform.translate(
//                   offset: Offset(-20, 0), // Move the number to the left
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             //button text
//             left: 130, // Align with the CustomPaint
//             top: 595, // Place below the CustomPaint with some spacing
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   'Water Pump',
//                   style: TextStyle(
//                     fontSize: 20, // Increase the font size
//                     color: Colors.black, // Change the text color to white
//                     fontWeight: FontWeight.bold, // Optional: make the text bold
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Transform.translate(
//                   offset: Offset(-20, 0), // Move the number to the left
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class SemiCircleProgress extends CustomPainter {
//   final double value;
//   final bool isTemp;
//   final Color color
//
//   SemiCircleProgress({ required this.color  ,required this.value, required this.isTemp});
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     int maximumValue = isTemp ? 50 : 100;
//
//     Paint outerCircle = Paint()
//       ..strokeWidth = 14
//       ..color = Colors.grey
//       ..style = PaintingStyle.stroke;
//
//     Paint progressArc = Paint()
//       ..strokeWidth = 14
//       ..color = isTemp ? Colors.red : Colors.blue
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;
//
//     Offset center = Offset(size.width / 2, size.height);
//     double radius = min(size.width / 2, size.height) - 14;
//
//     // Draw the base circle
//     canvas.drawArc(
//       Rect.fromCircle(center: center, radius: radius),
//       pi, // Start angle at the middle-top of the circle
//       pi, // Sweep angle is 180 degrees (half-circle)
//       false,
//       outerCircle,
//     );
//
//     // Draw the progress arc
//     double angle = pi * (value / maximumValue);
//     canvas.drawArc(
//       Rect.fromCircle(center: center, radius: radius),
//       pi, // Start angle
//       angle, // Sweep angle for the progress
//       false,
//       progressArc,
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: SmartIrrigation(),
//   ));
// }
