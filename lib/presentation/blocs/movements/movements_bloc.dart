
import 'package:infinity_bank/domain/usecases/movements/loadmovements.dart'    as usecase;
import 'package:infinity_bank/presentation/blocs/movements/movements_event.dart';
import 'package:infinity_bank/presentation/blocs/movements/movements_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovementsBloc extends Bloc<MovementsEvent, MovementsState> {
  final usecase.Loadmovementsdata loadMovementsdata;
  MovementsBloc(this.loadMovementsdata) : super(MovementsState()) {
    on<LoadMovementsDataEvent>((event, emit) async {
      final movementData = await loadMovementsdata();
      emit(MovementsState.fromModel(movementData));
    });
  }
}
