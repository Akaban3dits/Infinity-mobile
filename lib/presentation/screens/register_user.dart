import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_bank/domain/Model/Customer/customerModel.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/CustomerBLoC/customerbloc.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/CustomerBLoC/customerevent.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/CustomerBLoC/customerstate.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/widgets/texfld.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController rfcController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    rfcController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rfcController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void _showValidationError(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error de validación'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _validateAndSubmit() {
    if (nameController.text.isEmpty) {
      _showValidationError(context, 'Por favor, ingrese su nombre');
      return;
    }
    if (lastNameController.text.isEmpty) {
      _showValidationError(context, 'Por favor, ingrese su apellido');
      return;
    }
    if (emailController.text.isEmpty) {
      _showValidationError(context, 'Por favor, ingrese su correo');
      return;
    }
    if (passwordController.text.isEmpty) {
      _showValidationError(context, 'Por favor, ingrese su contraseña');
      return;
    }
    if (phoneController.text.isEmpty) {
      _showValidationError(context, 'Por favor, ingrese su teléfono');
      return;
    }
    if (rfcController.text.isEmpty) {
      _showValidationError(context, 'Por favor, ingrese su RFC');
      return;
    }

    final customerData = Customer(
      firstName: nameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      rfc: rfcController.text,
      phoneNumber: phoneController.text,
      password: passwordController.text,
      idbank: 3,
    );

    context.read<CustomerBloc>().add(CreateCustomerEvent(customerData));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorStyle.primary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Center(
                  child: BlocListener<CustomerBloc, CustomerState>(
                    listener: (context, state) {
                      if (state is CustomerCreated) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Registro Exitoso'),
                              content: const Text(
                                  'El usuario fue registrado exitosamente.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      } else if (state is CustomerError) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content: Text(state.message),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: BlocBuilder<CustomerBloc, CustomerState>(
                      builder: (BuildContext context, CustomerState state) {
                        return Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Nombre",
                                          style: AppTextStyles.h4s1.copyWith(
                                              color: AppColorStyle.white)),
                                    ],
                                  ),
                                ),
                              ),
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
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Apellido",
                                          style: AppTextStyles.h4s1.copyWith(
                                              color: AppColorStyle.white)),
                                    ],
                                  ),
                                ),
                              ),
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
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Correo",
                                          style: AppTextStyles.h4s1.copyWith(
                                              color: AppColorStyle.white)),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50.0,
                                child: TextfUs(
                                  onChanged: (value) {
                                    context
                                        .read<CustomerBloc>()
                                        .add(EmailChanged(value));
                                  },
                                  controller: emailController,
                                  hintText: "Correo",
                                  obscureText: false,
                                  icon: AppIconStyle.email,
                                ),
                              ),
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Password",
                                          style: AppTextStyles.h4s1.copyWith(
                                              color: AppColorStyle.white)),
                                    ],
                                  ),
                                ),
                              ),
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
                                  ocultar: true,
                                ),
                              ),
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("Teléfono",
                                          style: AppTextStyles.h4s1.copyWith(
                                              color: AppColorStyle.white)),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50.0,
                                child: TextfUs(
                                  onChanged: (value) {
                                    context
                                        .read<CustomerBloc>()
                                        .add(PhoneNumberChanged(value));
                                  },
                                  controller: phoneController,
                                  hintText: "Teléfono",
                                  obscureText: false,
                                  icon: AppIconStyle.phone,
                                ),
                              ),
                              SizedBox(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("RFC",
                                          style: AppTextStyles.h4s1.copyWith(
                                              color: AppColorStyle.white)),
                                    ],
                                  ),
                                ),
                              ),
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
                                    backgroundColor: WidgetStateProperty.all(AppColorStyle.secundary),
                                  ),
                                  onPressed: _validateAndSubmit,
                                  child: const Text(
                                    "Registrar",
                                    style: TextStyle(color: AppColorStyle.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
