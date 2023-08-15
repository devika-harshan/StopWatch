import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stopwatch/usersprovider.dart';
import 'package:stopwatch/screens/splashscreenpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBkrQvKx9V1pmvM4-g4hIjUPb9XV8LlodU",
          projectId: "stopwatch-95039",
          storageBucket: "stopwatch-95039.appspot.com",
          messagingSenderId: "812020658244",
          appId: "1:812020658244:android:aaf7043ded7c37be4a0c11"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UsersProvider(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: SplashScreenEffect(),
      ),
    );
  }
}

class SplashScreenEffect extends StatelessWidget {
  Future<void> _loadData() async {
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadData(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashScreenPage();
        } else {
          return login();
        }
      },
    );
  }
}
