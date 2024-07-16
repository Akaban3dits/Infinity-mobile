import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_bank/domain/repositories/Updated/Customer/customer_repository_impl.dart';
import 'package:infinity_bank/domain/usecases/Updated/Customer/loadcustomer.dart';
import 'package:infinity_bank/presentation/blocs/Updated/Customer/customer_bloc.dart';
import 'package:infinity_bank/presentation/blocs/Updated/Customer/customer_event.dart';
import 'package:infinity_bank/presentation/blocs/Updated/Customer/customer_state.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/widgets/texfld.dart';
import 'package:infinity_bank/domain/models/Updated/Customers/api_provider.dart';
class EditUserScreen extends StatefulWidget {
  const EditUserScreen({super.key});

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
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
    phoneController.dispose();
    rfcController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerBloc(
        LoadCustomerData(CustomerRepositoryImpl()),
        ApiProvider(),
      )..add(const LoadUserDataEvent()),
      child: Scaffold(
        backgroundColor: AppColorStyle.primary,
        body: Center(
          child: BlocListener<CustomerBloc, CustomerState>(
            listener: (context, state) {
              if (state is UserUpdated) {
                print("User updated successfully");
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('User updated successfully!'),
                ));
              } else if (state is CustomerError) {
                print("Error: ${state.message}");
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.message),
                ));
              }
            },
            child: BlocBuilder<CustomerBloc, CustomerState>(
              builder: (BuildContext context, CustomerState state) {
                if (state is CustomerLoading) {
                  return const CircularProgressIndicator();
                } else if (state is CustomerState) {
                  // Actualiza los controladores de texto cuando se carga el estado
                  if (state.firstName.isNotEmpty) {
                    nameController.text = state.firstName;
                  }
                  if (state.lastName.isNotEmpty) {
                    lastNameController.text = state.lastName;
                  }
                  if (state.email.isNotEmpty) {
                    emailController.text = state.email;
                  }
                  if (state.phoneNumber.isNotEmpty) {
                    phoneController.text = state.phoneNumber;
                  }
                  if (state.rfc.isNotEmpty) {
                    rfcController.text = state.rfc;
                  }
                  if (state.password.isNotEmpty) {
                    passwordController.text = state.password;
                  }

                  return Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50.0,
                          child: TextfUs(
                            onChanged: (value) {
                              context.read<CustomerBloc>().add(FirstNameChanged(value));
                            },
                            controller: nameController,
                            hintText: "Nombre",
                            obscureText: false,
                            icon: AppIconStyle.person,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        SizedBox(
                          height: 50.0,
                          child: TextfUs(
                            onChanged: (value) {
                              context.read<CustomerBloc>().add(LastNameChanged(value));
                            },
                            controller: lastNameController,
                            hintText: "Apellido",
                            obscureText: false,
                            icon: AppIconStyle.person,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your lastname';
                              }
                              return null;
                            },
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        SizedBox(
                          height: 50.0,
                          child: TextfUs(
                            onChanged: (value) {
                              context.read<CustomerBloc>().add(PhoneNumberChanged(value));
                            },
                            controller: phoneController,
                            hintText: "Teléfono",
                            obscureText: false,
                            icon: AppIconStyle.phone,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your phone';
                              }
                              return null;
                            },
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your RFC';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        SizedBox(
                          height: 50.0,
                          child: TextfUs(
                            onChanged: (value) {
                              context.read<CustomerBloc>().add(PasswordChanged(value));
                            },
                            controller: passwordController,
                            hintText: "Contraseña",
                            obscureText: true,
                            icon: AppIconStyle.password,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 70),
                          width: double.infinity,
                          height: 40.0,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(AppColorStyle.secundary),
                            ),
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                final userData = {
                                  'id': state.id,
                                  'name': nameController.text,
                                  'lastname': lastNameController.text,
                                  'email': emailController.text,
                                  'rfc': rfcController.text,
                                  'phone': phoneController.text,
                                  'password': passwordController.text,
                                  'id_bank': state.idbank,
                                };
                                print("Updating user data: $userData");
                                context.read<CustomerBloc>().add(UpdateUserEvent(userData));
                              }
                            },
                            child: const Text(
                              "Actualizar",
                              style: TextStyle(color: AppColorStyle.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
