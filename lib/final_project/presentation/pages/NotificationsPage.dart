import 'package:flutter/material.dart';

import '../manager/notificationcompontes.dart';
class NotificationsPage extends StatefulWidget {
   NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return  NotificationComponents();
  }
}
