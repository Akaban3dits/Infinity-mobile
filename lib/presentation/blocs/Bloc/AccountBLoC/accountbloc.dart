import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_bank/domain/Repository/Account/account_repository.dart';
import 'package:infinity_bank/domain/Usecases/Account/deleteaccount.dart';
import 'package:infinity_bank/domain/Usecases/Account/getaccount.dart';
import 'package:infinity_bank/domain/Usecases/Account/updateaccount.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/AccountBLoC/accountevent.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/AccountBLoC/accountstate.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final AccountRepository repository;
  final GetAccountUseCase? getAccountUseCase;
  final UpdateAccountUseCase? updateAccountUseCase;
  final DeleteAccountUseCase? deleteAccountUseCase;

  AccountBloc({
    required this.repository,
    this.getAccountUseCase,
    this.updateAccountUseCase,
    this.deleteAccountUseCase,
  }) : super(AccountInitial()) {
    on<GetAccountEvent>(_onGetAccountEvent);
    on<UpdateAccountEvent>(_onUpdateAccountEvent);
    on<DeleteAccountEvent>(_onDeleteAccountEvent);
    on<AccountDataChanged>(_onAccountDataChanged);
  }

  Future<void> _onGetAccountEvent(
      GetAccountEvent event, Emitter<AccountState> emit) async {
    emit(AccountLoading());
    try {
      final account = await repository.getAccount();
      emit(AccountLoaded(account));
    } catch (e) {
      emit(AccountError("Error obteniendo la cuenta: $e"));
    }
  }

  Future<void> _onUpdateAccountEvent(
      UpdateAccountEvent event, Emitter<AccountState> emit) async {
    try {
      emit(AccountLoading());
      final success = await updateAccountUseCase!.call(event.account);
      if (success) {
        emit(AccountUpdated());
        final account = await getAccountUseCase!.call();
        emit(AccountLoaded(account));
      } else {
        emit(const AccountError("Error actualizando la cuenta"));
      }
    } catch (e) {
      emit(AccountError("Error actualizando la cuenta: $e"));
    }
  }

  Future<void> _onDeleteAccountEvent(
      DeleteAccountEvent event, Emitter<AccountState> emit) async {
    try {
      emit(AccountLoading());
      final success = await repository.deleteAccount(event.accountId);
      if (success) {
        emit(AccountDeleted());
      } else {
        emit(const AccountError("Error eliminando la cuenta"));
      }
    } catch (e) {
      emit(AccountError("Error eliminando la cuenta: $e"));
    }
  }

  void _onAccountDataChanged(
      AccountDataChanged event, Emitter<AccountState> emit) {
    if (state is AccountLoaded) {
      final updatedAccount = (state as AccountLoaded).account;
      emit(AccountLoaded(updatedAccount));
    }
  }
}
