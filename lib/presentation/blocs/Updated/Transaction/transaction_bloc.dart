import 'package:infinity_bank/domain/usecases/Updated/Transaction/loadtransaction.dart' as usecase;
import 'package:infinity_bank/presentation/blocs/Updated/Transaction/transaction_event.dart';
import 'package:infinity_bank/presentation/blocs/Updated/Transaction/transaction_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final usecase.LoadTransactionData loadTransactionData;
  TransactionBloc(this.loadTransactionData)
      : super(const TransactionState()) {
    on<LoadTransactionDataEvent>((event, emit) async {
      final transactionData = await loadTransactionData();
      emit(TransactionState.fromModel(transactionData));
    });
  }
}

