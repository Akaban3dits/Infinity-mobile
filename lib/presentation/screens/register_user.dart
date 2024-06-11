import 'package:flutter/material.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/widgets/texfld.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorStyle.primary,
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(
            height: 50.0,
            child: TextfUs(
              hintText: "Nombre",
              obscureText: false,
              icon: AppIconStyle.person,
            )),
        const SizedBox(height: 10.0),
        const SizedBox(
            height: 50.0,
            child: TextfUs(
                hintText: "Apellido",
                obscureText: false,
                icon: AppIconStyle.person)),
        const SizedBox(height: 10.0),
        const SizedBox(
            height: 50.0,
            child: TextfUs(
                hintText: "Correo",
                obscureText: false,
                icon: AppIconStyle.email)),
        const SizedBox(height: 10.0),
        const SizedBox(
            height: 50.0,
            child: TextfUs(
                hintText: "Contraseña",
                obscureText: true,
                icon: AppIconStyle.password)),
        const SizedBox(height: 10.0),
        const SizedBox(
            height: 50.0,
            child: TextfUs(
                hintText: "Telefono",
                obscureText: false,
                icon: AppIconStyle.phone)),
        const SizedBox(height: 10.0),
        const SizedBox(
            height: 50.0,
            child: TextfUs(
                hintText: "RFC", obscureText: false, icon: AppIconStyle.file)),
        const SizedBox(height: 10.0),
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
                "Registrar",
                style: TextStyle(color: AppColorStyle.white),
              )),
        )
      ])),
    );
  }
}
