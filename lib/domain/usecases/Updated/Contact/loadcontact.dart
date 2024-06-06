import 'package:infinity_bank/domain/models/Updated/Contact/contactModel.dart';

class LoadContactData {
  Future<Contact> call() async {
    return Contact(
      id: 1,
      customerId: 1,
      contactName: "Jane Doe",
      contactAccountNumber: "9876543210",
      createdAt: DateTime.now(),
    );
  }
}
