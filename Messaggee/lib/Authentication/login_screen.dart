import 'package:firebase_auth/firebase_auth.dart';
import 'package:messaggee/App/home_screen.dart';
import 'package:messaggee/Authentication/forgot_password_screen.dart';
import 'package:messaggee/CustomWidgets/colors.dart';
import 'package:messaggee/CustomWidgets/constants.dart';
import 'package:messaggee/CustomWidgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'create_account_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late String email;
  late String password;

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kDarkGreen,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: Image.asset('images/back_arrow.png', width: 35, height: 35,),
                        ),
                      ),
                      const Text(
                        'Log In',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 23,
                          color: Colors.white,
                        ),
                      ),
                      Visibility(
                        maintainSize: true,
                        maintainAnimation: true,
                        maintainState: true,
                        visible: false,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: TextButton(
                            onPressed: (){},
                            child: Image.asset('images/back_arrow.png', width: 35, height: 35,),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: kBoxDecoration,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 50, 30, 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                'Email',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          style: const TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500),
                          onChanged: (value) {
                            email = value;
                          },
                          decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Enter your email',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                'Password',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500),
                          obscureText: true,
                          onChanged: (value) {
                            password = value;
                          },
                          decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Enter your password',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return const ForgotPasswordScreen();
                                }));
                              },
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(color: kDarkGreen, fontSize: 13, fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomButton(
                          text: 'LOG IN',
                          onPress: () async {
                            await _auth.signInWithEmailAndPassword(email: email, password: password);
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const HomeScreen();
                            }));
                          },
                          borderColour: kDarkGreen,
                          colour: kDarkGreen,
                          textColour: Colors.white,
                          fontWeight: FontWeight.w500,
                          width: 300,
                          textFontSize: 15,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(color: kDarkGreen, fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                        TextButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return const CreateAccountScreen();
                            }));
                          },
                          child: Text(
                            'CREATE ACCOUNT',
                            style: TextStyle(color: kPink, fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
