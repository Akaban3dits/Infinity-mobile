import 'package:infinity_bank/domain/usecases/Updated/Account/loadaccount.dart' as usecase;
import 'package:infinity_bank/presentation/blocs/Updated/Account/account_event.dart';
import 'package:infinity_bank/presentation/blocs/Updated/Account/account_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final usecase.LoadAccountData loadAccountData;
  AccountBloc(this.loadAccountData)
      : super(AccountState(
            createdAt: DateTime.now())) {
    on<LoadAccountDataEvent>((event, emit) async {
      final accountData = await loadAccountData();
      emit(AccountState.fromModel(accountData));
    });
  }
}
