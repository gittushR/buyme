import 'package:firebase_core/firebase_core.dart';
import 'package:flipkart_grid_5/constants/theme.dart';
import 'package:flipkart_grid_5/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:flipkart_grid_5/screens/auth_ui/login/login.dart';
import 'package:flipkart_grid_5/screens/auth_ui/sign_up/sign_up.dart';
import 'package:flipkart_grid_5/screens/auth_ui/welcome/welcomeScreen.dart';
import 'package:flipkart_grid_5/screens/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyARaVohBmwQnuGmxTTUn5PpmE8TWOiw2aY',
      appId: '1:1036429344343:android:fd603aca5d214ecf262d12',
      messagingSenderId: '1036429344343',
      projectId: 'grid-a561d',
    ),
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      theme: themeData,
      home: StreamBuilder(
        stream: FirebaseAuthHelper.instance.getAuthChange,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeScreen();
          }
          return const WelcomeScreen();
        },
      ),
    );
  }
}
