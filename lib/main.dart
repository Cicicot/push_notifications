import 'package:flutter/material.dart';
import 'package:push_notifications/screens/message_screen.dart';
import 'package:push_notifications/services/push_notification_services.dart';

import 'screens/home_screen.dart';
 
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationServices.initializeApp();

  runApp(MyApp());

}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home'   :( _ )=>HomeScreen(),
        'message':( _ )=>MessageScreen()
      },
    );
  }
}