import 'package:equatable/equatable.dart';

abstract class ServiceEvent extends Equatable {
  const ServiceEvent();
  @override
  List<Object> get props => [];
}

class LoadServiceDataEvent extends ServiceEvent {}
