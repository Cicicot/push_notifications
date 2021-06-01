// SHA1: 01:D7:1B:F1:0A:8A:27:D7:8B:68:88:8E:69:19:43:69:B8:9F:AE:29
// cHbLgwcAQTixefQd2IeXnp:APA91bFOAXla7SymkW11g4bEynzR_9l4MoUfgrfZSYJ2W41VIxl9IZTuFPLE3eNA5R03ain2woTzWYAvaz1TrXvUpi2ITXp_4zdUFgpBieI6mLQghRgT5BecURoZuZyRY90cAY3ZaXub

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationServices {

  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static String? token;

  static Future _onBackgroundHandler( RemoteMessage message ) async {
    print( '_onBackground Handler ${ message.messageId }');
  }

  static Future _onMessageHandler( RemoteMessage message ) async {
    print( '_onMessage Handler ${ message.messageId }' );
  }

  static Future _onMessageOpenedApp( RemoteMessage message ) async {
    print( '_onMessageOpenedApp Handler ${ message.messageId }' );
  }

  static Future initializeApp() async {

    // Push Notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();

    print( 'Token: $token' );

    // Handlers
    FirebaseMessaging.onBackgroundMessage( _onBackgroundHandler );
    FirebaseMessaging.onMessage.listen( _onMessageHandler );
    FirebaseMessaging.onMessageOpenedApp.listen( _onMessageOpenedApp );    

  }

}