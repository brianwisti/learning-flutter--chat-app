import 'package:flutter/material.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';

import 'utils/spaces.dart';
import 'widgets/login_text_field.dart';

class LoginPage extends StatelessWidget {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _mainUrl = Uri.https('randomgeekery.org');

  LoginPage({Key? key}) : super(key: key);

  void loginUser(context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      print(userNameController.text);
      print(passwordController.text);
      Navigator.pushReplacementNamed(context, '/chat',
          arguments: userNameController.text);
      print("Logging in");
    } else {
      print("not successful");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Let\s sign you in!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text('Welcome back! \nYou\'ve been missed!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  )),
              Image.asset('resources/banner_image.png', height: 200),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    LoginTextField(
                      validator: (value) {
                        if (value != null &&
                            value.isNotEmpty &&
                            value.length < 5) {
                          return "Username should be more than 5 characters";
                        }

                        if (value == null || value.isEmpty) {
                          return "Username cannot be empty";
                        }

                        return null;
                      },
                      controller: userNameController,
                      hintText: 'Add your username',
                    ),
                    verticalSpacing(24),
                    LoginTextField(
                      controller: passwordController,
                      hintText: 'Add your password',
                      isObscured: true,
                    ),
                  ],
                ),
              ),
              verticalSpacing(24),
              ElevatedButton(
                  onPressed: () {
                    loginUser(context);
                  },
                  child: const Text("Log In",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w300,
                      ))),
              GestureDetector(
                onTap: () async {
                  print('tapped URL');
                  if (!await launchUrl(_mainUrl)) {
                    throw 'Could not $_mainUrl';
                  }
                },
                child: Column(
                  children: [
                    const Text('Find us on'),
                    Text(_mainUrl.toString()),
                  ],
                ),
              ),
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SocialMediaButton.linkedin(
                    url: 'https://linkedin.com/in/brianwisti'),
                SocialMediaButton.twitter(
                    url: 'https://twitter.com/brianwisti'),
              ])
            ],
          ),
        ),
      ),
    );
  }
}