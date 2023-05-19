import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messaggee/CustomWidgets/colors.dart';
import 'package:messaggee/CustomWidgets/constants.dart';
import 'package:messaggee/CustomWidgets/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool chatOrCall = true;

  final _auth = FirebaseAuth.instance;
  late final loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void triggerChatOrCall(int flag) {
    setState(() {
      if (flag == 1) {
        chatOrCall = true;
      } else if (flag == 2) {
        chatOrCall = false;
      }
    });
  }

  Future<void> getCurrentUser() async {
    try {
      loggedInUser = _auth.currentUser!;
      print(loggedInUser.email);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGreen,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            "images/messagee_horizontal.png",
                            width: 200,
                            height: 69,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomButton(
                            text: "CHATS",
                            letterSpacing: 2,
                            onPress: () {
                              triggerChatOrCall(1);
                            },
                            textColour: chatOrCall ? kDarkGreen : Colors.white,
                            fontWeight:
                                chatOrCall ? FontWeight.w500 : FontWeight.w400,
                            colour: chatOrCall ? Colors.white : kDarkGreen,
                            borderColour: Colors.white,
                            width: 140,
                            textFontSize: 18,
                          ),
                          CustomButton(
                            text: "CALLS",
                            letterSpacing: 2,
                            onPress: () {
                              triggerChatOrCall(2);
                            },
                            textColour: chatOrCall ? Colors.white : kDarkGreen,
                            borderColour: Colors.white,
                            fontWeight:
                                chatOrCall ? FontWeight.w400 : FontWeight.w500,
                            colour: chatOrCall ? kDarkGreen : Colors.white,
                            width: 140,
                            textFontSize: 18,
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 3,
                child: Container(
                  decoration: kBoxDecoration,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Stack(
                      children: [
                        chatOrCall ? const ChatListView() : const CallListView(),
                        Visibility(
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          visible: chatOrCall,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: TextButton(
                                  onPressed: (){},
                                  child: Stack(
                                    children: [
                                      Image.asset('images/green_circle.png'),
                                      Image.asset('images/add_icon.png'),
                                    ],
                                  )
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

class ChatListView extends StatelessWidget {
  const ChatListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ProfileListTile(),
        ProfileListTile(),
        ProfileListTile(),
        ProfileListTile(),
        ProfileListTile(),
        ProfileListTile(),
        ProfileListTile(),
        ProfileListTile(),
        ProfileListTile(),
        ProfileListTile(),
        ProfileListTile(),
        ProfileListTile(),
        ProfileListTile(),
        ProfileListTile(),
        ProfileListTile(),
        ProfileListTile(),
        ProfileListTile(),
      ],
    );
  }
}

class CallListView extends StatelessWidget {
  const CallListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        CallListTile(),
        CallListTile(),
        CallListTile(),
        CallListTile(),
        CallListTile(),
        CallListTile(),
        CallListTile(),
        CallListTile(),
        CallListTile(),
        CallListTile(),
        CallListTile(),
        CallListTile(),
        CallListTile(),
        CallListTile(),
        CallListTile(),
        CallListTile(),
        CallListTile(),
        CallListTile(),
        CallListTile(),
        CallListTile(),
        CallListTile(),
        CallListTile(),
        CallListTile(),
      ],
    );
  }
}

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: ListTile(
        leading: Image.asset('images/profile_circle.png', width: 50,),
        title: const Text(
          'Zelda Logan',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: const Text('Something Extra'),
        trailing: const Text(
          '15 mins ago',
          style: TextStyle(
            color: Color(0xFFA6A6A6),
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

class CallListTile extends StatelessWidget {
  const CallListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: ListTile(
        leading: Image.asset('images/profile_circle.png', width: 50,),
        title: const Text(
          'User Name',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: const Text(
          '15 mins ago',
          style: TextStyle(
            color: Color(0xFFA6A6A6),
            fontSize: 12,
          ),
        ),
        trailing: Image.asset('images/video_call_green.png'),
      ),
    );
  }
}
