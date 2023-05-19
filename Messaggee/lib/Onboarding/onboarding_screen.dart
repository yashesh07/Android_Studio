import 'package:messaggee/Authentication/login_screen.dart';
import 'package:messaggee/CustomWidgets/colors.dart';
import 'package:messaggee/CustomWidgets/custom_button.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 75,
            ),
            Image.asset('images/onboarding_illus.png'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 15),
              child: Text('Safe-Secure-Fast',
                style: TextStyle(
                  color: kDarkGreen,
                  fontSize: 35,
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text('Message or call with your friends\nbecome more safe and secure',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CustomButton(
                text: 'Skip',
                onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginScreen();
                  }));
                },
                borderColour: kPink,
                textColour: kPink,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CustomButton(
                text: 'Next',
                onPress: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LoginScreen();
                  }));
                },
                borderColour: kDarkGreen,
                colour: kDarkGreen,
                textColour: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
