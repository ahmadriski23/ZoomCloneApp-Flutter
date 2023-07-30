import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:zoom_clone_app/state_util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone_app/resources/auth_methods.dart';
import 'package:zoom_clone_app/screens/home_screen.dart';
import 'package:zoom_clone_app/screens/login_screen.dart';
import 'package:zoom_clone_app/screens/video_call_screen.dart';
import 'package:zoom_clone_app/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dismee',
      navigatorKey: Get.navigatorKey,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        useMaterial3: true,
      ),
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/video-call': (context) => VideoCallScreen(),
      },
      home: StreamBuilder(
        stream: AuthMethods().authChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return AnimatedSplashScreen(
              splashIconSize: 500,
              splash: 'assets/images/splash.png',
              nextScreen: HomeScreen(),
              splashTransition: SplashTransition.fadeTransition,
              backgroundColor: backgroundColor,
            );
          }
          return AnimatedSplashScreen(
            splashIconSize: 500,
            splash: 'assets/images/splash.png',
            nextScreen: LoginScreen(),
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: backgroundColor,
          );
        },
      ),
    );
  }
}
