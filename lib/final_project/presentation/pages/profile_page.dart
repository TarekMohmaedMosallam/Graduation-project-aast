import 'package:flutter/services.dart';
import '../../domain/use_cases/Navigatation.dart';
import '../manager/compoents.dart';
import '../manager/Homepage_compontes.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  Uint8List? _imageData;

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    int count = 0;

    return LayoutBuilder(
      builder: (context, constraints) {
        double localwidth = constraints.maxWidth;
        double localhight = constraints.maxHeight;
        return Scaffold(
          appBar: AppBar(
            title: Fontinter(
              text: "profile",
              textsize: 25,
              fontweight: FontWeight.w600,
              color: Colors.black,
              checkunderline: false,
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: NewBackButton(
              event: () {
                Navigations.logintohome(context);
              },
            ),
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(

              children: <Widget>[
                SizedBox(
                  height: localhight * 0.1,
                ),
                FaceioneCricler(vh: .5, vw: 1,),
                SizedBox(
                  height: localhight * 0.1,
                ),
                CustomListProfile(),
              ],
            ),
          ),
        );
      },
    );
  }
}
