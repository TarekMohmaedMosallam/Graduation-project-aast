import 'package:flutter/material.dart';

import '../../domain/entities/help center.dart';
import '../../domain/use_cases/Navigatation.dart';
import '../manager/compoents.dart';

class Helpcenter2 extends StatefulWidget {
  final HelpCenter helpcenter;

  Helpcenter2({super.key, required this.helpcenter});

  @override
  State<Helpcenter2> createState() => _Helpcenter2();
}

class _Helpcenter2 extends State<Helpcenter2> {
  @override
  Widget build(BuildContext context) {
    var problemname = widget.helpcenter.problemname;
    var solution = widget.helpcenter.solution;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title:Fontinter(text: problemname.toString(), textsize:screenWidth * 0.05,fontweight: FontWeight.w700, checkunderline: false) ,
        leading: NewBackButton(
          event: () {
            Navigations.Backscannedcrops(context);
          },
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double localheight = constraints.maxHeight;
          double localwidth = constraints.maxWidth;
          return Column(
            children: [
              SizedBox(height: 40),
              Center(child: Container(

                  width: localwidth*0.9,
                  height: localheight*0.9,

                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color:Color(0xffC3FDB8),
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.green, width: 2.0)),



                  child: Text("${solution}",style:TextStyle(
                    fontSize:20
                  ) ,))),
            ],
          );
        },
      ),
    );
  }
}