import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/components/rounded_inputField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';

import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ProgressHUD(
        child: Builder(builder: (context) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: Hero(
                    tag: 'logo',
                    child: Container(
                      height: 200.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                RoundedInputField(
                  inputHint: 'Enter your email',
                  onChanged: (value) {
                    email = value;
                  },
                  passwordFormat: false,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 8.0,
                ),
                RoundedInputField(
                  inputHint: 'Enter your password',
                  onChanged: (value) {
                    password = value;
                  },
                  passwordFormat: true,
                  textInputType: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButtonWidget(
                  color: Colors.lightBlueAccent,
                  buttonLabel: 'login',
                  onPressed: () async {
                    final progress = ProgressHUD.of(context);
                    progress.show();
                    try {
                      // Causes "lost connection to device"
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                        progress.dismiss();
                      } else {
                        print('User is signed out!');
                        progress.dismiss();
                      }
                    } catch (e) {
                      print(e);
                      progress.dismiss();
                    }
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
