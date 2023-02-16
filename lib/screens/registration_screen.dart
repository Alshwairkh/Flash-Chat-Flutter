import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/components/rounded_inputField.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email;
  String password;
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;

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
                  color: Colors.blueAccent,
                  buttonLabel: 'Register',
                  onPressed: () async {
                    final progress = ProgressHUD.of(context);
                    progress.show();
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      progress.dismiss();
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
