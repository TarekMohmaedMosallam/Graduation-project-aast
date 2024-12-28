import 'package:flutter/material.dart';
import '../../data/models/Warning Message.dart';
import '../../domain/use_cases/Navigatation.dart';
import 'compoents.dart';

class NotificationComponents extends StatefulWidget {
  const NotificationComponents({Key? key}) : super(key: key);

  @override
  State<NotificationComponents> createState() => _NotificationComponentsState();
}

class _NotificationComponentsState extends State<NotificationComponents> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Notifications",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
        leading: NewBackButton(
          event: () => Navigations.logintohome(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 70),
            Flexible(
              child: ListView.builder(
                itemCount: WarningMessage.warningmessagelist.length,
                itemBuilder: (context, index) {
                  final message = WarningMessage.warningmessagelist[index];
                  return Container(
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.14,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffC3FDB8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(1, 1),
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message.warningMessage,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                message.warningMessageBody,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              WarningMessage.warningmessagelist.removeAt(index);
                            });
                          },
                          icon: Icon(Icons.close),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
