import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_bank/domain/Model/Contacts/contactModel.dart';
import 'package:infinity_bank/domain/Model/Transference/transferenceModel.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/AccountBLoC/accountevent.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/ContactBLoC/contactevent.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/TransferenceBLoC/transferencebloc.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/TransferenceBLoC/transferenceevent.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/TransferenceBLoC/transferencestate.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/ContactBLoC/contactbloc.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/ContactBLoC/contactstate.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/AccountBLoC/accountbloc.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/AccountBLoC/accountstate.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/widgets/movesinformation.dart';

class Moveview extends StatefulWidget {
  const Moveview({super.key});

  @override
  State<Moveview> createState() => _MoveviewState();
}

class _MoveviewState extends State<Moveview> {
  TextEditingController searchController = TextEditingController();
  List<Transference> filteredList = [];
  List<String> userAccounts = []; // Aquí se incluirán las cuentas del usuario

  @override
  void initState() {
    super.initState();
    context.read<TransferenceBloc>().add(GetTransferencesEvent());
    context.read<ContactBloc>().add(GetContactsEvent());
    context.read<AccountBloc>().add(GetAccountEvent());
  }

  void filterSearchResults(
      String query, List<Transference> transferences, List<Contact> contacts) {
    if (query.isEmpty) {
      setState(() {
        filteredList = transferences;
      });
      return;
    }

    List<Transference> dummyListData = [];
    for (var item in transferences) {
      final contactName = getUsuario(item.receptorAccount, contacts);
      final contactAccount = item.receptorAccount;

      if (contactName.toLowerCase().contains(query.toLowerCase()) ||
          contactAccount.toLowerCase().contains(query.toLowerCase())) {
        dummyListData.add(item);
      }
    }

    setState(() {
      filteredList = dummyListData;
    });
  }

  String getUsuario(String account, List<Contact> contacts) {
    for (var contact in contacts) {
      if (contact.account == account) {
        return contact.nickname;
      }
    }
    return account;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColorStyle.primary,
        title: Text(
          "Movimientos",
          style: AppTextStyles.h2s1.copyWith(color: AppColorStyle.white),
        ),
        iconTheme: const IconThemeData(color: AppColorStyle.white),
      ),
      backgroundColor: AppColorStyle.primary,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (query) {
                final transferences = context.read<TransferenceBloc>().state
                        is TransferencesLoaded
                    ? (context.read<TransferenceBloc>().state
                            as TransferencesLoaded)
                        .transferences
                    : <Transference>[];
                final contacts =
                    context.read<ContactBloc>().state is ContactsLoaded
                        ? (context.read<ContactBloc>().state as ContactsLoaded)
                            .contacts
                        : <Contact>[];

                filterSearchResults(query, transferences, contacts);
              },
              controller: searchController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blueGrey[900],
                labelText: "Buscar",
                labelStyle: const TextStyle(color: Colors.white70),
                hintText: "Buscar por usuario",
                hintStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: Colors.blueGrey.shade700),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: Colors.blueGrey.shade800),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide:
                      BorderSide(color: AppColorStyle.secundary, width: 2.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: AppColorStyle.secundary2,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<AccountBloc, AccountState>(
                  builder: (context, accountState) {
                    return BlocBuilder<TransferenceBloc, TransferenceState>(
                      builder: (context, transferenceState) {
                        return BlocBuilder<ContactBloc, ContactState>(
                          builder: (context, contactState) {
                            if (accountState is AccountLoaded &&
                                transferenceState is TransferencesLoaded &&
                                contactState is ContactsLoaded) {
                              filteredList = filteredList.isEmpty
                                  ? transferenceState.transferences
                                  : filteredList;

                              final contacts = contactState.contacts;
                              userAccounts = accountState.account.cards!
                                  .expand(
                                      (card) => [card.card, card.cardAccount])
                                  .toList();

                              if (filteredList.isEmpty) {
                                return Center(
                                  child: Text(
                                    'No existen movimientos realizados o recibidos',
                                    style: AppTextStyles.h3s1
                                        .copyWith(color: Colors.white),
                                  ),
                                );
                              }

                              return ListView.separated(
                                itemCount: filteredList.length,
                                itemBuilder: (context, index) {
                                  final Transference cl = filteredList[index];
                                  bool isSent =
                                      userAccounts.contains(cl.senderAccount);
                                  userAccounts.contains(cl.receptorAccount);
                                  String usuario = getUsuario(
                                    isSent
                                        ? cl.receptorAccount
                                        : cl.senderAccount,
                                    contacts,
                                  );

                                  return MovesData(
                                    usuario: usuario,
                                    monto: cl.amount,
                                    tipo: "Transferencia",
                                    estado: isSent ? "Enviado" : "Recibido",
                                    detalle: cl.concept,
                                    id: isSent
                                        ? cl.receptorAccount
                                        : cl.senderAccount,
                                    enviado: isSent,
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    const Divider(),
                              );
                            } else if (transferenceState
                                    is TransferenceLoading ||
                                contactState is ContactLoading ||
                                accountState is AccountLoading) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (transferenceState is TransferenceError) {
                              return Center(
                                child: Text(
                                  'Error: ${transferenceState.message}',
                                  style: AppTextStyles.h3s1
                                      .copyWith(color: Colors.red),
                                ),
                              );
                            } else {
                              return const Center(
                                  child: Text('Estado desconocido.'));
                            }
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
