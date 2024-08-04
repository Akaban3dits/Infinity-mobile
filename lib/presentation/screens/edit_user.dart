import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_bank/domain/ApiProvider/Customer/customerProvider.dart';
import 'package:infinity_bank/domain/Model/Customer/customerModel.dart';
import 'package:infinity_bank/domain/Repository/Customer/customer_repository_impl.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/CustomerBLoC/customerbloc.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/CustomerBLoC/customerevent.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/CustomerBLoC/customerstate.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/widgets/texfld.dart';

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
      create: (context) =>
          CustomerBloc(repository: CustomerRepositoryImpl(CustomerProvider()))
            ..add(GetCustomerEvent()),
      child: Scaffold(
        backgroundColor: AppColorStyle.primary,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80.0),
          child: Column(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/InfinityVerticalLogo 1.png',
                      width: 150,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Center(
                  child: BlocListener<CustomerBloc, CustomerState>(
                    listener: (context, state) {
                      if (state is CustomerUpdated) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Actualización Exitosa'),
                              content: const Text(
                                  'El usuario fue actualizado exitosamente.'),
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
                        if (state is CustomerLoading) {
                          return const CircularProgressIndicator();
                        } else if (state is CustomerLoaded) {
                          nameController.text = state.customer.firstName;
                          lastNameController.text = state.customer.lastName;
                          emailController.text = state.customer.email;
                          phoneController.text = state.customer.phoneNumber;
                          rfcController.text = state.customer.rfc;
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your name';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your lastname';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your email';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your phone';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                      context
                                          .read<CustomerBloc>()
                                          .add(RFCChanged(value));
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
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 70),
                                  width: double.infinity,
                                  height: 40.0,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: WidgetStateProperty.all(
                                          AppColorStyle.secundary),
                                    ),
                                    onPressed: () async {
                                      if (_formKey.currentState?.validate() ??
                                          false) {
                                        final customerData = Customer(
                                          id: state.customer.id,
                                          firstName: nameController.text,
                                          lastName: lastNameController.text,
                                          email: emailController.text,
                                          rfc: rfcController.text,
                                          phoneNumber: phoneController.text,
                                          password: state.customer.password,
                                          idbank: state.customer.idbank,
                                        );

                                        final customerBloc =
                                            context.read<CustomerBloc>();
                                        final errorMessage = await customerBloc
                                            .updateCustomerUseCase
                                            .call(customerData);

                                        if (errorMessage == null) {
                                          customerBloc.add(UpdateCustomerEvent(
                                              customerData));
                                        } else {
                                          showDialog(
                                            // ignore: use_build_context_synchronously
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text('Error'),
                                                content: Text(errorMessage),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('OK'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        }
                                      }
                                    },
                                    child: Text(
                                      "Actualizar",
                                      style: AppTextStyles.h3s1
                                          .copyWith(color: AppColorStyle.white),
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
            ],
          ),
        ),
      ),
    );
  }
}
