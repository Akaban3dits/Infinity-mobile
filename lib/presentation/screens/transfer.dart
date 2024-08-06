import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_bank/domain/Model/Contacts/contactModel.dart';
import 'package:infinity_bank/domain/Model/Transference/transferenceModel.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/AccountBLoC/accountbloc.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/AccountBLoC/accountevent.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/AccountBLoC/accountstate.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/ContactBLoC/contactbloc.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/ContactBLoC/contactevent.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/ContactBLoC/contactstate.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/TransferenceBLoC/transferencebloc.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/TransferenceBLoC/transferenceevent.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/TransferenceBLoC/transferencestate.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/screens/services.dart';
import 'package:infinity_bank/presentation/widgets/Recentlypeople.dart';
import 'package:infinity_bank/presentation/widgets/buttontransfer.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final TextEditingController accountController = TextEditingController();
  final TextEditingController conceptController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  void _loadInitialData() {
    context.read<ContactBloc>().add(GetContactsEvent());
    context.read<AccountBloc>().add(GetAccountEvent());
  }

  void _reloadData() {
    context.read<ContactBloc>().add(GetContactsEvent());
  }

  Future<void> _display(BuildContext context, String label) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: AppColorStyle.secundary2,
      barrierColor: Colors.black38.withOpacity(0),
      isDismissible: true,
      isScrollControlled: true,
      builder: (context) => BlocConsumer<AccountBloc, AccountState>(
        listener: (context, state) {
          // Aquí puedes manejar acciones adicionales cuando la cuenta se carga.
        },
        builder: (context, accountState) {
          String accountNumber = "Desconocido";
          String owner = "Desconocido";

          if (accountState is AccountLoaded) {
            accountNumber = accountState.account.cards!.isNotEmpty
                ? accountState.account.cards![0].cardAccount
                : "No card available";
            owner = accountState.account.usuario?.firstName ?? "Owner";
          }

          return BlocListener<TransferenceBloc, TransferenceState>(
            listener: (context, state) {
              if (state is TransferenceCreated) {
                _clearFields();
                Navigator.pop(context); // Cerrar el modal
                _showResponseDialog(
                    context, 'La transferencia se ha realizado con éxito.');
              } else if (state is TransferenceError) {
                _showErrorDialog(context, state.message);
              }
            },
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 10),
                  _buildLabel(label),
                  _buildTextField(
                    accountController,
                    'Ingresa tu $label',
                    (value) => context
                        .read<TransferenceBloc>()
                        .add(AccountChanged(value)),
                  ),
                  _buildLabel("Concepto"),
                  _buildTextField(
                    conceptController,
                    'Ingresa el concepto',
                    (value) => context
                        .read<TransferenceBloc>()
                        .add(ConceptChanged(value)),
                  ),
                  _buildLabel("Monto"),
                  _buildAmountField(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: Text(
                            "Cancelar operación",
                            style: AppTextStyles.h4s1
                                .copyWith(color: AppColorStyle.white),
                          ),
                        ),
                        const SizedBox(width: 12),
                        ElevatedButton(
                          onPressed: () {
                            if (conceptController.text.isNotEmpty &&
                                amountController.text.isNotEmpty) {
                              _showConfirmationDialog(context, () {
                                final concept = conceptController.text;
                                final amountStr = amountController.text;
                                final receptorAccount = accountController.text;

                                if (receptorAccount.isNotEmpty) {
                                  double amount =
                                      double.tryParse(amountStr) ?? 0.00;

                                  if (accountNumber != "No card available") {
                                    final transference = Transference(
                                      owner: owner,
                                      amount: amount,
                                      concept: concept,
                                      senderAccount: accountNumber,
                                      receptorAccount: receptorAccount,
                                    );

                                    context.read<TransferenceBloc>().add(
                                          CreateTransferenceEvent(transference),
                                        );
                                  } else {
                                    _showErrorDialog(context,
                                        'No se encontró una cuenta válida para el envío.');
                                  }
                                } else {
                                  _showErrorDialog(context,
                                      'El número de cuenta no debe estar vacío');
                                }
                              });
                            } else {
                              _showErrorDialog(context,
                                  'Por favor complete los campos de concepto y monto');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColorStyle.primary,
                          ),
                          child: Text(
                            "Enviar",
                            style: AppTextStyles.h4s1
                                .copyWith(color: AppColorStyle.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, VoidCallback onConfirm) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Transferencia'),
          content: const Text(
              '¿Estás seguro de que deseas enviar esta transferencia?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onConfirm(); // Llama a la función de confirmación
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLabel(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 30),
        Text(text,
            style: AppTextStyles.h3s1.copyWith(color: AppColorStyle.white)),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText,
      Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 6),
      child: SizedBox(
        height: 60,
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            fillColor: AppColorStyle.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: hintText,
            hintStyle: AppTextStyles.h4s1,
          ),
        ),
      ),
    );
  }

  Widget _buildAmountField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 6),
      child: SizedBox(
        height: 60,
        child: TextField(
          controller: amountController,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}'))
          ],
          keyboardType: TextInputType.number,
          onChanged: (value) {
            if (value.isNotEmpty) {
              double amount =
                  double.tryParse(value.replaceAll(',', '')) ?? 0.00;
              // Formatear y actualizar el controlador
              String formattedAmount = amount.toStringAsFixed(2);
              if (value != formattedAmount) {
                amountController.value = TextEditingValue(
                  text: formattedAmount,
                  selection: TextSelection.fromPosition(
                    TextPosition(offset: formattedAmount.length),
                  ),
                );
              }
              context.read<TransferenceBloc>().add(AmountChanged(amount));
            }
          },
          decoration: InputDecoration(
            fillColor: AppColorStyle.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            hintText: 'Ingresa tu monto',
            hintStyle: AppTextStyles.h4s1,
            prefixIcon: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.attach_money,
                color: Colors.grey,
              ),
            ),
            prefixText: ' ',
            prefixStyle: const TextStyle(color: Colors.black),
          ),
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              double amount = double.parse(value.replaceAll(',', ''));
              String formattedAmount = amount.toStringAsFixed(2);
              amountController.value = TextEditingValue(
                text: formattedAmount,
                selection: TextSelection.fromPosition(
                  TextPosition(offset: formattedAmount.length),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
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

  void _showResponseDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Resultado de la Operación'),
          content: Text(message),
        );
      },
    );

    Future.delayed(const Duration(seconds: 10), () {
      Navigator.of(context)
          .pop(true); // Cerrar el diálogo después de 10 segundos
    });
  }

  void _clearFields() {
    accountController.clear();
    amountController.clear();
    conceptController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorStyle.primary,
      body: SafeArea(
        child: BlocConsumer<AccountBloc, AccountState>(
          listener: (context, state) {
            if (state is AccountLoaded) {
              // Acciones adicionales cuando la cuenta se carga
            }
          },
          builder: (context, accountState) {
            if (accountState is AccountLoaded) {
              final usuario = accountState.account.usuario;
              final cards = accountState.account.cards;
              final accountOwner = "${usuario?.firstName} ${usuario?.lastName}";
              final accountNumber = cards != null && cards.isNotEmpty
                  ? cards[0].cardAccount
                  : "No card available";

              return Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Movimientos",
                        style: AppTextStyles.h2s1
                            .copyWith(color: AppColorStyle.white),
                      ),
                    ),
                    Row(
                      children: [
                        BtnTransfer(
                            iconname: AppIconStyle.send,
                            name: "Transferencia",
                            onPressed: () =>
                                _display(context, "Numero de cuenta")),
                        BtnTransfer(
                            iconname: Icons.compare_arrows_sharp,
                            name: "Entre cuentas",
                            onPressed: () => _display(context, "Referencia")),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Servicios",
                        style: AppTextStyles.h2s1
                            .copyWith(color: AppColorStyle.white),
                      ),
                    ),
                    Row(
                      children: [
                        BtnTransfer(
                            iconname: Icons.lightbulb_outline,
                            name: "Servicios",
                            onPressed: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ServicesArea()))
                                }),
                        BtnTransfer(
                            iconname: Icons.favorite,
                            name: "Donar",
                            onPressed: () => _display(context, "Referencia")),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Contactos",
                              style: AppTextStyles.h2s1
                                  .copyWith(color: AppColorStyle.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    BlocBuilder<ContactBloc, ContactState>(
                      builder: (context, contactState) {
                        if (contactState is ContactsLoaded) {
                          final contacts = contactState.contacts;
                          if (contacts.isEmpty) {
                            return Center(
                              child: Text(
                                'No se encontró ningún contacto.',
                                style: AppTextStyles.h3s1
                                    .copyWith(color: Colors.white),
                              ),
                            );
                          }
                          return Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    3, 
                                crossAxisSpacing:
                                    10, 
                                mainAxisSpacing:
                                    10,
                                childAspectRatio:
                                    1.0,
                              ),
                              itemCount: contacts.length,
                              itemBuilder: (context, index) {
                                Contact contact = contacts[index];
                                return Container(
                                  margin: const EdgeInsets.all(
                                      4.0), 
                                  child: ButtonPearson(
                                    linkImageProfile:
                                        'https://i.pinimg.com/564x/e2/41/db/e241dbae7142883c41e5a3e8ef6156eb.jpg',
                                    name: contact.nickname,
                                    accountNum: contact.account,
                                    owner: accountOwner,
                                    accountowner: accountNumber,
                                    onSuccess: _reloadData,
                                  ),
                                );
                              },
                            ),
                          );
                        } else if (contactState is ContactLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (contactState is ContactError) {
                          return Center(
                            child: Text(
                              'Error: ${contactState.message}',
                              style: AppTextStyles.h3s1
                                  .copyWith(color: Colors.red),
                            ),
                          );
                        } else {
                          return const Center(
                              child: Text('Estado desconocido'));
                        }
                      },
                    ),
                  ],
                ),
              );
            } else if (accountState is AccountLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (accountState is AccountError) {
              return Center(
                child: Text(
                  'Error: ${accountState.message}',
                  style: AppTextStyles.h3s1.copyWith(color: Colors.red),
                ),
              );
            } else {
              return const Center(child: Text('Estado desconocido'));
            }
          },
        ),
      ),
    );
  }
}
