import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_bank/domain/Model/Contacts/contactModel.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/ContactBLoC/contactbloc.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/ContactBLoC/contactevent.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/ContactBLoC/contactstate.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/widgets/texfld.dart';

class RegisterContact extends StatefulWidget {
  const RegisterContact({super.key});

  @override
  State<RegisterContact> createState() => _RegisterContactState();
}

class _RegisterContactState extends State<RegisterContact> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nicknameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController bankNameController;
  late TextEditingController accountController;

  @override
  void initState() {
    super.initState();
    nicknameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    bankNameController = TextEditingController();
    accountController = TextEditingController();
  }

  @override
  void dispose() {
    nicknameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    bankNameController.dispose();
    accountController.dispose();
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
    if (nicknameController.text.isEmpty) {
      _showValidationError(context, 'Por favor, ingrese el nickname');
      return;
    }
    if (emailController.text.isEmpty) {
      _showValidationError(context, 'Por favor, ingrese el correo');
      return;
    }
    if (phoneController.text.isEmpty) {
      _showValidationError(context, 'Por favor, ingrese el teléfono');
      return;
    }
    if (bankNameController.text.isEmpty) {
      _showValidationError(context, 'Por favor, ingrese el nombre del banco');
      return;
    }
    if (accountController.text.isEmpty) {
      _showValidationError(context, 'Por favor, ingrese el número de cuenta');
      return;
    }

    final newContact = Contact(
      nickname: nicknameController.text,
      email: emailController.text,
      phone: phoneController.text,
      bankname: bankNameController.text,
      account: accountController.text,
    );

    context.read<ContactBloc>().add(CreateContactEvent(newContact));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 80.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Center(
                    child: Image.asset(
                      "assets/images/InfinityVerticalLogo 1.png",
                      width: 100.0, // Ajusta el tamaño de la imagen si es necesario
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: BlocListener<ContactBloc, ContactState>(
                    listener: (context, state) {
                      if (state is ContactCreated) {
                        // Mostrar diálogo de éxito
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Registro Exitoso'),
                              content: const Text(
                                  'El contacto fue registrado exitosamente.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    // Limpiar los campos del formulario
                                    nicknameController.clear();
                                    emailController.clear();
                                    phoneController.clear();
                                    bankNameController.clear();
                                    accountController.clear();

                                    // Cerrar el diálogo
                                    Navigator.of(context).pop();

                                    // Volver a la página anterior o realizar otra acción si es necesario
                                    Navigator.pop(context);
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      } else if (state is ContactError) {
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
                    child: BlocBuilder<ContactBloc, ContactState>(
                      builder: (BuildContext context, ContactState state) {
                        return Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              _buildTextField("Nickname", nicknameController,
                                  AppIconStyle.person),
                              _buildTextField("Correo", emailController,
                                  AppIconStyle.email),
                              _buildTextField("Teléfono", phoneController,
                                  AppIconStyle.phone,
                                  keyboardType: TextInputType.phone),
                              _buildTextField("Nombre del Banco",
                                  bankNameController, Icons.account_balance),
                              _buildTextField(
                                "Número de Cuenta",
                                accountController,
                                Icons.account_balance_wallet_outlined,
                                maxLength: 16,
                                keyboardType: TextInputType.number,
                              ),
                              const SizedBox(height: 20.0),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 70),
                                width: double.infinity,
                                height: 40.0,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: WidgetStateProperty.all(
                                        AppColorStyle.secundary),
                                  ),
                                  onPressed: _validateAndSubmit,
                                  child: const Text(
                                    "Registrar",
                                    style:
                                        TextStyle(color: AppColorStyle.white),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, IconData icon,
      {bool obscureText = false, bool ocultar = false, int? maxLength, TextInputType? keyboardType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Text(label,
              style: AppTextStyles.h4s1.copyWith(color: AppColorStyle.white)),
        ),
        SizedBox(
          height: 50.0,
          child: TextfUs(
            controller: controller,
            hintText: label,
            obscureText: obscureText,
            icon: icon,
            ocultar: ocultar,
            maxLength: maxLength, // Pasar el valor de maxLength aquí
            keyboardType: keyboardType, // Pasar el valor de keyboardType aquí
          ),
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
