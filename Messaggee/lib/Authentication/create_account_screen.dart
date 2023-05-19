import 'package:firebase_auth/firebase_auth.dart';
import 'package:messaggee/App/home_screen.dart';
import 'package:messaggee/CustomWidgets/colors.dart';
import 'package:messaggee/CustomWidgets/constants.dart';
import 'package:messaggee/CustomWidgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {

  late String name;
  late String email;
  late String password;

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGreen,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
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
                            'Create an Account',
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
                                onPressed: (){
                                },
                                child: Image.asset('images/back_arrow.png', width: 35, height: 35,),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'Welcome!',
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
                    padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
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
                                    'Name',
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
                              height: 10,
                            ),
                            TextFormField(
                              style: const TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500),
                              onChanged: (value) {
                                name = value;
                              },
                              decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Enter your name',
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
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
                              height: 10,
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
                              height: 10,
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
                              height: 10,
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
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    'Confirm Password',
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
                              height: 10,
                            ),
                            TextFormField(
                              style: const TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500),
                              obscureText: true,
                              onChanged: (value) {
                              },
                              decoration: kTextFieldDecoration.copyWith(
                                hintText: 'Confirm password',
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomButton(
                              text: 'CREATE ACCOUNT',
                              onPress: () async {
                                final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                                if(newUser!=null){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return const HomeScreen();
                                  }));
                                }
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
                              'Already have an account?',
                              style: TextStyle(color: kDarkGreen, fontSize: 13, fontWeight: FontWeight.w400),
                            ),
                            TextButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return const LoginScreen();
                                }));
                              },
                              child: Text(
                                'LOGIN',
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
        ),
      ),
    );
  }
}
