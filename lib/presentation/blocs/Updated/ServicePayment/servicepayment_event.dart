import 'package:equatable/equatable.dart';

abstract class ServicePaymentEvent extends Equatable {
  const ServicePaymentEvent();
  @override
  List<Object> get props => [];
}

class LoadServicePaymentDataEvent extends ServicePaymentEvent {}
