import 'package:flutter/material.dart';
import 'package:global_gazzete/email_verification.dart';
import 'package:global_gazzete/login_page.dart';
import 'package:global_gazzete/profile_view.dart';
import 'package:global_gazzete/signup_page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login' : (context)=>const LoginScreen(),
        'verify':(context)=> const EmailVerification(),
        'register': (context)=>const SignUpScreen(),
        'ProfileRoutes':(context)=> ProfileView()
      }
    );
  }
}

