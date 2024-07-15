import 'package:first_app/app.anonymous_page/anonymous_page.dart';
import 'package:first_app/app.sign_in/social_sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:first_app/common_widgets/custom_elevated_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign In',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
          
          ),
          ),
        centerTitle: true,
        elevation: 2.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
            color: Colors.purple,
            child: const SizedBox(
              height: 100.0,
              width: 100.0,
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          Container(
            color: Colors.blue,
            child: const SizedBox(
              height: 100.0,
              width: 100.0,
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          Container(
            color: Colors.red,
            child: const SizedBox(
              height: 100.0,
              width: 100.0,
            ),
          ),
          const SizedBox(
            height: 50.0,
          ),
          SocialSignInButton(
            assetName: 'images/google.logo.png',
            text: 'Sign in with Google',
            color: Colors.white,
            textColor: Colors.black87,
            onPressed: () {
              print('Button pressed');
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
          SocialSignInButton(
            assetName: 'images/facebook.logo.png',
            text: 'Sign in with Facebook',
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () {
              print('Button pressed');
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
          CustomElevatedButton(
            child: const Text('Sign in with Twitch'),
            color: Colors.purple,
            onPressed: () {
              print('Button pressed');
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            'or',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.black87,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          CustomElevatedButton(
            child: const Text('Go anonymous'),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => const AnonymousPage()
                ));
            },
          ),
        ])
      )
    )
    ;
  }
}