import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/onboarding_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(

      title: 'Onboarding Screen',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
      ),
      home: OnboardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}