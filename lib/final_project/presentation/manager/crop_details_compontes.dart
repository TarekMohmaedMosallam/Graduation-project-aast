import 'package:flutter/material.dart';

import '../../data/models/Imagetest.dart';
import 'compoents.dart';

class ShowCropdetials extends StatefulWidget {
  final Imagetest imagetest;

  ShowCropdetials({super.key, required this.imagetest});

  @override
  State<ShowCropdetials> createState() => _ShowCropdetialsState();
}

class _ShowCropdetialsState extends State<ShowCropdetials> {
  @override
  Widget build(BuildContext context) {
    var imagetest = widget.imagetest.image;
    var imagename = widget.imagetest.name;
    var imagetext= widget.imagetest.info;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      appBar: AppBar(
        title: Fontinter(
            text: imagename.toString(),
            textsize: 30,
            fontweight: FontWeight.w600,
            checkunderline: false),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: NewBackButton(
          event: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ScannedCrops()));
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double localheight = constraints.maxHeight;
          double localwidth = constraints.maxWidth;
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40),
                Center(
                  child: Container(
            
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.4,
                    child: Image.asset(imagetest.toString()),
                    decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(8) ,
                      color: Color(0xffC3FDB8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(0, 1),
                          blurRadius: 1,
                        ),
                      ],
                    ) ,
                  ),
                ),
                SizedBox(height: 50),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 100),
                      child: Fontinter(
                        text: "Recommendations",
                        textsize: 25,
                        fontweight: FontWeight.w600,
                        checkunderline: false,
                      ),
                    ),
                    // SizedBox(height: 25),
                    Poppins(text: "$imagetext", textsize: 16, fontweight: FontWeight.w400, checkunderline: false, color: Colors.black,) ,
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
