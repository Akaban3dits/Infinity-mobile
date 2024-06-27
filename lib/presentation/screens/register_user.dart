import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_bank/domain/repositories/Updated/Customer/customer_repository_impl.dart';
import 'package:infinity_bank/domain/usecases/Updated/Customer/loadcustomer.dart';
import 'package:infinity_bank/presentation/blocs/Updated/Customer/customer_bloc.dart';
import 'package:infinity_bank/presentation/blocs/Updated/Customer/customer_event.dart';
import 'package:infinity_bank/presentation/blocs/Updated/Customer/customer_state.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/widgets/texfld.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rfcController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rfcController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerBloc(
        LoadCustomerData(CustomerRepositoryImpl()),
      )..add(LoadCustomerDataEvent()),
      child: Scaffold(
        backgroundColor: AppColorStyle.primary,
        body: Center(
          child: BlocBuilder<CustomerBloc, CustomerState>(
            builder: (BuildContext context, CustomerState state) {
              nameController.text = state.firstName;
              lastNameController.text = state.lastName;
              emailController.text = state.email;
              passwordController.text = state.password;
              rfcController.text = state.rfc;
              phoneNumberController.text = state.phoneNumber;

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50.0,
                    child: TextfUs(
                      onChanged: (value) {
                        context
                            .read<CustomerBloc>()
                            .add(FirstNameChanged(value));
                      },
                      controller: nameController,
                      hintText: "Nombre",
                      obscureText: false,
                      icon: AppIconStyle.person,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    height: 50.0,
                    child: TextfUs(
                      onChanged: (value) {
                        context
                            .read<CustomerBloc>()
                            .add(LastNameChanged(value));
                      },
                      controller: lastNameController,
                      hintText: "Apellido",
                      obscureText: false,
                      icon: AppIconStyle.person,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    height: 50.0,
                    child: TextfUs(
                      onChanged: (value) {
                        context.read<CustomerBloc>().add(EmailChanged(value));
                      },
                      controller: emailController,
                      hintText: "Correo",
                      obscureText: false,
                      icon: AppIconStyle.email,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    height: 50.0,
                    child: TextfUs(
                      onChanged: (value) {
                        context
                            .read<CustomerBloc>()
                            .add(PasswordChanged(value));
                      },
                      controller: passwordController,
                      hintText: "Contraseña",
                      obscureText: true,
                      icon: AppIconStyle.password,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    height: 50.0,
                    child: TextfUs(
                      onChanged: (value) {
                        context
                            .read<CustomerBloc>()
                            .add(PhoneNumberChanged(value));
                      },
                      controller: phoneNumberController,
                      hintText: "Teléfono",
                      obscureText: false,
                      icon: AppIconStyle.phone,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    height: 50.0,
                    child: TextfUs(
                      onChanged: (value) {
                        context.read<CustomerBloc>().add(RFCChanged(value));
                      },
                      controller: rfcController,
                      hintText: "RFC",
                      obscureText: false,
                      icon: AppIconStyle.file,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    width: double.infinity,
                    height: 40.0,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AppColorStyle.secundary),
                      ),
                      onPressed: () {
                        // Implementa la lógica de registro aquí
                      },
                      child: const Text(
                        "Registrar",
                        style: TextStyle(color: AppColorStyle.white),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
