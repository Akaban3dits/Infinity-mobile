import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_bank/domain/Model/Log_Service/log_serviceModel.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/LogserviceBLoC/logservicebloc.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/LogserviceBLoC/logserviceevent.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/LogserviceBLoC/logservicestate.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/AccountBLoC/accountbloc.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/AccountBLoC/accountstate.dart';
import 'package:infinity_bank/presentation/blocs/notifservice.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:intl/intl.dart';

class Referencia extends StatefulWidget {
  const Referencia({
    super.key,
    required this.idService,
    required this.image,
    required this.name,
    required this.referencia,
  });

  final String name;
  final String image;
  final String referencia;
  final int idService;

  @override
  State<Referencia> createState() => _ReferenciaState();
}

class _ReferenciaState extends State<Referencia> {
  late double montoPagar;

  @override
  void initState() {
    super.initState();
    montoPagar = Random().nextInt(301) + 400;
  }

  void _createLogService(int idAccount, int idUsers) {
    final logServiceBloc = context.read<LogServiceBloc>();
    final logService = LogService(
      amount: montoPagar,
      reference: widget.referencia,
      idService: widget.idService,
      idUsers: idUsers,
      idAccount: idAccount,
    );

    logServiceBloc.add(CreateLogServiceEvent(logService));
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);

    return BlocListener<LogServiceBloc, LogServiceState>(
      listener: (context, state) {
        if (state is LogServiceLoading) {
        } else if (state is LogServiceCreated) {
          String body =
              "El pago a ${widget.name} con referencia a ${widget.referencia} de \$${montoPagar.toStringAsFixed(2)} ha sido exitoso";
          NotificationService.showNotification(body);
        } else if (state is LogServiceError) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text(
                  "Error",
                  style: AppTextStyles.h3s1,
                ),
                content: Text(
                  state.message,
                  style: AppTextStyles.h4s1,
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text(
                      "Aceptar",
                      style: AppTextStyles.h4s1
                          .copyWith(color: AppColorStyle.primary),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      },
      child: BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          if (state is AccountLoaded) {
            return Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          widget.image,
                          fit: BoxFit.fill,
                          width: 200,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColorStyle.secundary2,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18),
                          topRight: Radius.circular(18),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.name,
                                    style: AppTextStyles.h1s1
                                        .copyWith(color: AppColorStyle.white),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Referencia",
                                          style: AppTextStyles.h3s1.copyWith(
                                              color: AppColorStyle.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          widget.referencia,
                                          style: AppTextStyles.h4s1.copyWith(
                                              color: AppColorStyle.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 0.5,
                              color: AppColorStyle.white.withOpacity(0.5),
                              width: double.infinity,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Concepto",
                                          style: AppTextStyles.h3s1.copyWith(
                                              color: AppColorStyle.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Servicio",
                                          style: AppTextStyles.h4s1.copyWith(
                                              color: AppColorStyle.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 0.5,
                              color: AppColorStyle.white.withOpacity(0.5),
                              width: double.infinity,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Monto a pagar",
                                          style: AppTextStyles.h3s1.copyWith(
                                              color: AppColorStyle.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          "\$${montoPagar.toStringAsFixed(2)}",
                                          style: AppTextStyles.h4s1.copyWith(
                                              color: AppColorStyle.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 0.5,
                              color: AppColorStyle.white.withOpacity(0.5),
                              width: double.infinity,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Fecha",
                                          style: AppTextStyles.h3s1.copyWith(
                                              color: AppColorStyle.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          formattedDate,
                                          style: AppTextStyles.h4s1.copyWith(
                                              color: AppColorStyle.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(child: Container(color: Colors.transparent)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () => _createLogService(
                                          state.account.id, state.account.idUser),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColorStyle.primary,
                                      ),
                                      child: Text(
                                        "Pagar",
                                        style: AppTextStyles.h3s1.copyWith(
                                            color: AppColorStyle.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is AccountLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text("Error al cargar la cuenta"));
          }
        },
      ),
    );
  }
}
