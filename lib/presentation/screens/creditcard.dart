import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_bank/domain/Model/Contacts/contactModel.dart';
import 'package:infinity_bank/domain/entities/movements.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/AccountBLoC/accountbloc.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/AccountBLoC/accountevent.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/AccountBLoC/accountstate.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/ContactBLoC/contactbloc.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/ContactBLoC/contactevent.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/ContactBLoC/contactstate.dart';
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
    context.read<AccountBloc>().add(GetAccountEvent());
    context.read<ContactBloc>().add(GetContactsEvent());
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorStyle.primary,
      body: SafeArea(
        child: BlocBuilder<AccountBloc, AccountState>(
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
                        money: state.account.balance,
                        names: "${usuario?.firstName} ${usuario?.lastName}",
                        account: cards != null && cards.isNotEmpty
                            ? formatCardNumber(cards[0].cardAccount)
                            : "No card available",
                        accountF: cards![0].cardAccount,
                      ),
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
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(width: 10),
                                ...List<Widget>.generate(
                                    contacts.length * 2 - 1, (index) {
                                  if (index % 2 == 0) {
                                    Contact contact = contacts[index ~/ 2];
                                    return ButtonPearson(
                                      link_image_profile:
                                          'https://cdn.icon-icons.com/icons2/37/PNG/512/contacts_3695.png',
                                      name: contact.nickname,
                                      account_num: contact.account,
                                    );
                                  } else {
                                    return const SizedBox(width: 10);
                                  }
                                }),
                              ]),
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
                              child: ListView.builder(
                                itemCount:
                                    MoveList.length > 5 ? 5 : MoveList.length,
                                itemBuilder: (context, index) {
                                  final cl = MoveList[index];
                                  return MovesData(
                                    usuario: cl.usuario,
                                    monto: cl.monto,
                                    fecha: cl.fecha,
                                    tipo: cl.tipo,
                                    estado: cl.estado,
                                    detalle: cl.detalle,
                                    id: cl.id,
                                    url: cl.url,
                                  );
                                },
                              ),
                            ),
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
