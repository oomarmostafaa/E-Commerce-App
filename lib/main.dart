import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Login screen/login_sceen.dart';
import 'Register/register.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:LoginSceen.routeName ,
      routes: {
        LoginSceen.routeName:(context)=>LoginSceen(),
        Register.routeName:(context)=> const Register(),
      },
    );
  }
}
