import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_bank/domain/ApiProvider/AuthProvider/authprovider.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/AuthBLoC/AuthBloc.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/AuthBLoC/AuthEvent.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/AuthBLoC/AuthState.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/screens/home.dart';
import 'package:local_auth/local_auth.dart';
import 'package:infinity_bank/presentation/widgets/texfld.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthBloc(authProvider: AuthProvider()),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthAuthenticated) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            } else if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColorStyle.primary,
                      AppColorStyle.secundary,
                    ],
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Image.asset(
                          "assets/images/InfinityVerticalLogo 1.png",
                          width: 180.0,
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                        child: TextfUs(
                          controller: _phoneController,
                          hintText: "Phone",
                          obscureText: false,
                          icon: AppIconStyle.person,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      SizedBox(
                        height: 50.0,
                        child: TextfUs(
                          controller: _passwordController,
                          hintText: "Password",
                          obscureText: true,
                          icon: AppIconStyle.password,
                          ocultar: true,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        alignment: Alignment.centerRight,
                        height: 35.0,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot my password",
                            style: AppTextStyles.h4s1
                                .copyWith(color: AppColorStyle.white),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 70),
                        width: double.infinity,
                        height: 40.0,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                                AppColorStyle.secundary),
                          ),
                          onPressed: state is! AuthLoading
                              ? () {
                                  final phone = _phoneController.text;
                                  final password = _passwordController.text;

                                  if (phone.isNotEmpty &&
                                      password.isNotEmpty) {
                                    context.read<AuthBloc>().add(
                                        AuthLoginRequested(
                                            phone, password));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Please enter both phone and password'),
                                      ),
                                    );
                                  }
                                }
                              : null,
                          child: state is AuthLoading
                              ? const CircularProgressIndicator()
                              : const Text(
                                  "Log In",
                                  style: TextStyle(color: AppColorStyle.white),
                                ),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // IconButton(
                      //   onPressed: _auth,
                      //   icon: const Icon(AppIconStyle.fingercheck),
                      //   iconSize: 50,
                      //   color: AppColorStyle.white,
                      // ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  final LocalAuthentication _localAuthentication = LocalAuthentication();
  // ignore: unused_element
  Future<void> _auth() async {
    bool authenticated = false;
    try {
      authenticated = await _localAuthentication.authenticate(
        localizedReason: 'Verify your identity',
        options: const AuthenticationOptions(
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );
    } catch (e) {
      print(e);
    }
    if (authenticated) {
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }
}
