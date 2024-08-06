import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_bank/domain/Model/Contacts/contactModel.dart';
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
import 'package:infinity_bank/presentation/screens/moveview.dart';
import 'package:infinity_bank/presentation/widgets/Recentlypeople.dart';
import 'package:infinity_bank/presentation/widgets/card.dart';
import 'package:infinity_bank/presentation/widgets/movesinformation.dart';

class CreditCard extends StatefulWidget {
  const CreditCard({super.key});

  @override
  State<CreditCard> createState() => _CreditCardState();
}

class _CreditCardState extends State<CreditCard> {
  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  void _loadInitialData() {
    context.read<AccountBloc>().add(GetAccountEvent());
    context.read<ContactBloc>().add(GetContactsEvent());
    context.read<TransferenceBloc>().add(GetTransferencesEvent());
  }

  void _reloadData() {
    context.read<AccountBloc>().add(GetAccountEvent());
    context.read<ContactBloc>().add(GetContactsEvent());
    context.read<TransferenceBloc>().add(GetTransferencesEvent());
  }

  String formatCardNumber(String cardNumber) {
    if (cardNumber.length > 2) {
      final trimmedCardNumber = cardNumber.substring(2);

      if (trimmedCardNumber.length > 4) {
        final lastFourDigits =
            trimmedCardNumber.substring(trimmedCardNumber.length - 4);
        final maskedSection = '*' * (trimmedCardNumber.length - 4);
        final maskedCardNumber = '$maskedSection$lastFourDigits';
        final buffer = StringBuffer();
        for (int i = maskedCardNumber.length - 1; i >= 0; i--) {
          buffer.write(maskedCardNumber[i]);
          if ((maskedCardNumber.length - i) % 4 == 0 && i != 0) {
            buffer.write(' ');
          }
        }
        return buffer.toString().split('').reversed.join('');
      } else {
        return trimmedCardNumber;
      }
    } else {
      return cardNumber;
    }
  }

  String getUsuario(String account, List<Contact> contacts) {
    for (var contact in contacts) {
      if (contact.account == account) {
        return contact.nickname;
      }
    }
    return account; // Si no encuentra un contacto, devuelve la cuenta
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
          builder: (context, state) {
            if (state is AccountLoaded) {
              final usuario = state.account.usuario;
              final cards = state.account.cards;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Bienvenido, ${usuario?.firstName}",
                        style: AppTextStyles.h1s1
                            .copyWith(color: AppColorStyle.white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Cuentas",
                        style: AppTextStyles.h3s1
                            .copyWith(color: AppColorStyle.white)),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 200,
                    child: Center(
                      child: CCard(
                          name: "${usuario?.firstName} ${usuario?.lastName}",
                          email: usuario!.email,
                          phone: usuario.phoneNumber,
                          formattedCard: cards != null && cards.isNotEmpty
                              ? formatCardNumber(cards[0].card)
                              : "No card available",
                          cardNumber: cards != null && cards.isNotEmpty
                              ? cards[0].card
                              : "No card available",
                          accountNumber: cards != null && cards.isNotEmpty
                              ? cards[0].cardAccount
                              : "No card available",
                          balance: state.account.balance),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: Text(
                          "Contactos recientes",
                          style: AppTextStyles.h3s1
                              .copyWith(color: AppColorStyle.white),
                        ),
                      )
                    ],
                  ),
                  BlocBuilder<ContactBloc, ContactState>(
                    builder: (context, contactState) {
                      if (contactState is ContactsLoaded) {
                        final contacts = contactState.contacts;
                        if (contacts.isEmpty) {
                          return SizedBox(
                            height: 120,
                            child: Center(
                              child: Text(
                                'No se encontró ningún contacto',
                                style: AppTextStyles.h3s1
                                    .copyWith(color: AppColorStyle.white),
                              ),
                            ),
                          );
                        }

                        const maxContacts = 6;
                        final displayedContacts = contacts.length > maxContacts
                            ? maxContacts
                            : contacts.length;
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(width: 10),
                              ...List<Widget>.generate(
                                  displayedContacts * 2 - 1, (index) {
                                if (index % 2 == 0) {
                                  Contact contact = contacts[index ~/ 2];
                                  return ButtonPearson(
                                    name: contact.nickname,
                                    linkImageProfile:
                                        'https://i.pinimg.com/564x/e2/41/db/e241dbae7142883c41e5a3e8ef6156eb.jpg',
                                    accountNum: contact.account,
                                    owner: usuario.firstName,
                                    accountowner: cards?[0].cardAccount ?? "",
                                    onSuccess: _reloadData,
                                  );
                                } else {
                                  return const SizedBox(width: 10);
                                }
                              }),
                            ],
                          ),
                        );
                      } else if (contactState is ContactLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (contactState is ContactError) {
                        return Center(
                          child: Text(
                            'Error: ${contactState.message}',
                            style:
                                AppTextStyles.h3s1.copyWith(color: Colors.red),
                          ),
                        );
                      } else {
                        return const Center(child: Text('Estado desconocido'));
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColorStyle.secundary2,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Movimientos Recientes",
                                    style: AppTextStyles.h3s1
                                        .copyWith(color: AppColorStyle.white)),
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Moveview()),
                                    );
                                  },
                                  icon:
                                      const Icon(Icons.remove_red_eye_outlined),
                                  color: AppColorStyle.white,
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Expanded(
                              child: BlocBuilder<TransferenceBloc,
                                  TransferenceState>(
                                builder: (context, transferenceState) {
                                  if (transferenceState
                                      is TransferencesLoaded) {
                                    final transferences =
                                        transferenceState.transferences;
                                    if (transferences.isEmpty) {
                                      return Center(
                                          child: Text(
                                              'No existen movimientos realizados o recibidos.',
                                              style: AppTextStyles.h4s1
                                                  .copyWith(
                                                      color: AppColorStyle
                                                          .white)));
                                    }

                                    final userAccounts = cards
                                        ?.expand((card) =>
                                            [card.card, card.cardAccount])
                                        .toList();
                                    final recentTransferences =
                                        transferences.reversed.take(5).toList();

                                    return BlocBuilder<ContactBloc,
                                        ContactState>(
                                      builder: (context, contactState) {
                                        if (contactState is ContactsLoaded) {
                                          final contacts =
                                              contactState.contacts;

                                          return ListView.builder(
                                            itemCount:
                                                recentTransferences.length,
                                            itemBuilder: (context, index) {
                                              final transference =
                                                  recentTransferences[index];

                                              bool isSent =
                                                  userAccounts != null &&
                                                      userAccounts.contains(
                                                          transference
                                                              .senderAccount);
                                              bool isReceived =
                                                  userAccounts != null &&
                                                      userAccounts.contains(
                                                          transference
                                                              .receptorAccount);

                                              String type;
                                              String estado;

                                              if (isSent) {
                                                type = "Transferencia enviada";
                                                estado = "Enviado";
                                              } else if (isReceived) {
                                                type = "Transferencia recibida";
                                                estado = "Recibido";
                                              } else {
                                                type = "Desconocido";
                                                estado = "Desconocido";
                                              }

                                              String usuario = getUsuario(
                                                isSent
                                                    ? transference
                                                        .receptorAccount
                                                    : transference
                                                        .senderAccount,
                                                contacts,
                                              );

                                              return MovesData(
                                                usuario: usuario,
                                                monto: transference.amount,
                                                tipo: type,
                                                estado: estado,
                                                detalle: transference.concept,
                                                id: isSent
                                                    ? transference
                                                        .receptorAccount
                                                    : transference
                                                        .senderAccount,
                                                enviado: isSent,
                                              );
                                            },
                                          );
                                        } else if (contactState
                                            is ContactLoading) {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        } else if (contactState
                                            is ContactError) {
                                          return Center(
                                            child: Text(
                                              'Error al cargar contactos: ${contactState.message}',
                                              style: AppTextStyles.h3s1
                                                  .copyWith(color: Colors.red),
                                            ),
                                          );
                                        } else {
                                          return const Center(
                                              child: Text(
                                                  'Estado desconocido de contactos.'));
                                        }
                                      },
                                    );
                                  } else if (transferenceState
                                      is TransferenceLoading) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else if (transferenceState
                                      is TransferenceError) {
                                    return Center(
                                      child: Text(
                                        'Error al cargar transferencias: ${transferenceState.message}',
                                        style: AppTextStyles.h3s1
                                            .copyWith(color: Colors.red),
                                      ),
                                    );
                                  } else {
                                    return const Center(
                                        child: Text(
                                            'Estado desconocido de transferencias.'));
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is AccountLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AccountError) {
              return Center(
                child: Text(
                  'Error: ${state.message}',
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
