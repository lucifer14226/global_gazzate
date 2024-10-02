import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:global_gazzete/constant.dart';
import 'package:global_gazzete/firebase_options.dart';
import 'package:global_gazzete/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/login2.png"))),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.6,
                right: 35,
                left: 35,
              ),
              child: Column(
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                 const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Sign In',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 27,
                            fontWeight: FontWeight.w700),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xff4c505b),
                        child: IconButton(
                          color: Colors.white,
                          onPressed: () async {
                            await Firebase.initializeApp(
                                options:
                                    DefaultFirebaseOptions.currentPlatform);
                            final email = _emailController.text;
                            final password = _passwordController.text;

                            try {
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                email: email,
                                password: password,
                              );
                              Navigator.of(context).pushAndRemoveUntil(  MaterialPageRoute(
                                    builder: (context) {
                                    return HomeScreen(
                                        title: 'all', date: "2024-08-30");
                                    },
                                  ),(route)=>false);
                            } catch (e) {
                              debugPrint(e.toString());
                            }
                          },
                          icon: const Icon(Icons.arrow_forward),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'register');
                          },
                          child: const Text(
                            'Signup',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 18,
                                color: Colors.white),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 18,
                                color: Colors.white),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
