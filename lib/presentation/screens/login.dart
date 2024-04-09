import 'package:flutter/material.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
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
          gradient: LinearGradient(
              colors: [AppColorStyle.primary, AppColorStyle.secundary])),
      child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        // ignore: avoid_unnecessary_containers
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: Image.asset(
            "assets/images/InfinityVerticalLogo 1.png",
            width: 180.0,
          ),
        ),
        const SizedBox(
            height: 50.0,
            child: TextfUs(
              hintText: "User",
              obscureText: false,
              icon: AppIconStyle.person,
            )),
        const SizedBox(height: 10.0),
        const SizedBox(
            height: 50.0,
            child: TextfUs(
                hintText: "Password",
                obscureText: true,
                icon: AppIconStyle.password)),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            alignment: Alignment.centerRight,
            height: 30.0,
            child: TextButton(
                onPressed: () {},
                child: Text(
                  "Olvide mi contraseña",
                  style:
                      AppTextStyles.h4s1.copyWith(color: AppColorStyle.white),
                ))),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          width: double.infinity,
          height: 40.0,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColorStyle.secundary)),
              onPressed: () {},
              child: const Text(
                "Log In",
                style: TextStyle(color: AppColorStyle.white),
              )),
        ),
        const SizedBox(
          height: 20,
        ),
        IconButton(
            onPressed: () {
              _auth();
            },
            icon: const Icon(AppIconStyle.fingercheck),
            iconSize: 50,
            color: AppColorStyle.white)
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
          MaterialPageRoute<void>(builder: ((context) => const HomePage())));
    }
  }
}
