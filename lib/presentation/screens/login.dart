import 'package:flutter/material.dart';
import 'package:infinity_bank/presentation/screens/home.dart';
import 'package:infinity_bank/presentation/widgets/texfld.dart';

import 'package:local_auth/local_auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xff6717CD), Color(0xff16035C)])),
      child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        // ignore: avoid_unnecessary_containers
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Container(
            child: Image.asset(
              "assets/images/InfinityVerticalLogo 1.png",
              width: 180.0,
            ),
          ),
        ),
        // ignore: sized_box_for_whitespace
        Container(
            height: 50.0,
            child: const TextfUs(
              hintText: "User",
              obscureText: false,
              icon: Icons.person,
            )),
        const SizedBox(height: 10.0),
        // ignore: sized_box_for_whitespace
        Container(
            height: 50.0,
            child: const TextfUs(
              hintText: "Password",
              obscureText: true,
              icon: Icons.lock,
            )),

        // ignore: avoid_unnecessary_containers
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            alignment: Alignment.centerRight,
            height: 30.0,
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Olvide mi contraseña",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ))),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          width: double.infinity,
          height: 40.0,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xff0386D0))),
              onPressed: () {},
              child: const Text(
                "Log In",
                style: TextStyle(color: Colors.white),
              )),
        ),
        const SizedBox(
          height: 20,
        ),
        // ignore: avoid_unnecessary_containers
        Container(
            child: IconButton(
                onPressed: () {
                  _auth();
                },
                icon: const Icon(Icons.fingerprint),
                iconSize: 50,
                color: Colors.white))
      ])),
    ));
  }

  final LocalAuthentication _localAuthentication = LocalAuthentication();
  Future<void> _auth() async {
    bool authenticated = false;
    try {
      authenticated = await _localAuthentication.authenticate(
          localizedReason: 'Comprueba tu identidad',
          options: const AuthenticationOptions(
              stickyAuth: true, useErrorDialogs: true));
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    if (authenticated) {
      Navigator.pushReplacement<void, void>(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute<void>(
              builder: ((context) => const HomePage())));
    }
  }
}
