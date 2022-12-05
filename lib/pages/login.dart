import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:flutter/material.dart';
import 'package:proyectofinal/pages/home_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
              subtitleBuilder: (context, action) {
                return const Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    "Please sign in to continue.",
                  ),
                );
              },
              providerConfigs: const [
                EmailProviderConfiguration(),
                GoogleProviderConfiguration(
                    clientId:
                    "882169408481-srift6h3b9hi33ft59av3bq6fhvjf888.apps.googleusercontent.com"),
              ]);
        }
        return HomePage();
      },
    );
  }
}
