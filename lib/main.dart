import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onboarding/Onboarding.dart';
import 'package:onboarding/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


int? isViewed;

void main() async{

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard') ;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  isViewed !=0  ?  HomePage() : OnBoarding(),
    );
  }
}


