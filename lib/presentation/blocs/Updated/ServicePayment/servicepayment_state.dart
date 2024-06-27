import 'package:equatable/equatable.dart';
import 'package:infinity_bank/domain/models/Updated/ServicePayment/servicepaymentModel.dart';

class ServicePaymentState extends Equatable {
  final int id;
  final int accountId;
  final int serviceId;
  final double amount;
  final String description;

  const ServicePaymentState({
    this.id = 0,
    this.accountId = 0,
    this.serviceId = 0,
    this.amount = 0.0,
    this.description = '',
  });

  ServicePaymentState copyWith({
    int? id,
    int? accountId,
    int? serviceId,
    double? amount,
    DateTime? paymentDate,
    String? description,
  }) {
    return ServicePaymentState(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      serviceId: serviceId ?? this.serviceId,
      amount: amount ?? this.amount,
      description: description ?? this.description,
    );
  }

  @override
  List<Object> get props =>
      [id, accountId, serviceId, amount, description];

  factory ServicePaymentState.fromModel(ServicePayment model) {
    return ServicePaymentState(
      id: model.id,
      accountId: model.accountId,
      serviceId: model.serviceId,
      amount: model.amount,
      description: model.description,
    );
  }
}
