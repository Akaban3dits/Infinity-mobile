import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_bank/domain/repositories/Updated/Account/account_repository_impl.dart';
import 'package:infinity_bank/domain/usecases/Updated/Account/loadaccount.dart';
import 'package:infinity_bank/presentation/blocs/Updated/Account/account_bloc.dart';
import 'package:infinity_bank/presentation/blocs/Updated/Account/account_event.dart';
import 'package:infinity_bank/presentation/blocs/Updated/Account/account_state.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/widgets/texfld.dart';

class RegisterAccount extends StatefulWidget {
  const RegisterAccount({super.key});

  @override
  State<RegisterAccount> createState() => _RegisterAccountState();
}

class _RegisterAccountState extends State<RegisterAccount> {
  final accountNumberController = TextEditingController();
  final accountTypeController = TextEditingController();
  final photoController = TextEditingController();
  final passwordController = TextEditingController();
  final balanceController = TextEditingController();

  @override
  void dispose() {
    accountNumberController.dispose();
    accountTypeController.dispose();
    balanceController.dispose();
    photoController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountBloc(
        LoadAccountData(AccountRepositoryImpl()),
      )..add(LoadAccountDataEvent()),
      child: Scaffold(
        backgroundColor: AppColorStyle.primary,
        body: Center(
          child: BlocBuilder<AccountBloc, AccountState>(
            builder: (BuildContext context, AccountState state) {
              accountNumberController.text = state.accountNumber;
              accountTypeController.text = state.accountType;
              photoController.text = state.photo;
              passwordController.text = state.password;
              balanceController.text = state.balance.toString();

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50.0,
                    child: TextfUs(
                      onChanged: (value) {
                        context
                            .read<AccountBloc>()
                            .add(AccountTypeChanged(value));
                      },
                      controller: accountTypeController,
                      hintText: "Tipo de Cuenta",
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
                            .read<AccountBloc>()
                            .add(AccountNumberChanged(value));
                      },
                      controller: accountNumberController,
                      hintText: "Numero de cuenta",
                      obscureText: false,
                      icon: AppIconStyle.person,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    height: 50.0,
                    child: TextfUs(
                      onChanged: (value) {
                        context.read<AccountBloc>().add(BalanceChanged(double.parse(value)));
                      },
                      keyboard: TextInputType.number,
                      controller: balanceController,
                      hintText: "Balance",
                      obscureText: false,
                      icon: AppIconStyle.password,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    height: 50.0,
                    child: TextfUs(
                      onChanged: (value) {
                        context.read<AccountBloc>().add(PhotoChanged(value));
                      },
                      controller: photoController,
                      hintText: "Foto de perfil",
                      obscureText: false,
                      icon: AppIconStyle.password,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    height: 50.0,
                    child: TextfUs(
                      onChanged: (value) {
                        context.read<AccountBloc>().add(PasswordChanged(value));
                      },
                      controller: passwordController,
                      hintText: "Password",
                      obscureText: true,
                      icon: AppIconStyle.password,
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
