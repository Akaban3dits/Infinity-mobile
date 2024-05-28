import 'package:equatable/equatable.dart';

abstract class MovementsEvent extends Equatable {
  const MovementsEvent();
  @override
  List<Object> get props => [];
}

class LoadMovementsDataEvent extends MovementsEvent {}

class MovementsChanged extends MovementsEvent {
  final double cantRetirar;

  const MovementsChanged(this.cantRetirar);

  @override
  List<Object> get props => [cantRetirar];
}
