
import 'package:infinity_bank/domain/models/Updated/Contact/contactModel.dart';
import 'package:infinity_bank/domain/repositories/Updated/Contact/contact_repository.dart';

class LoadContactData {
  final ContactRepository repository;

  LoadContactData(this.repository);

  Future<Contact> call() async {
    final contactData = await repository.loadContactData();

    if (contactData.contactName.isEmpty || !RegExp(r'^[a-zA-Z\s]+$' ).hasMatch(contactData.contactName) && contactData.contactName.length > 4) {
      throw Exception("Contact name cannot be empty or invalid");
    }
    if (contactData.contactAccountNumber.isEmpty || !RegExp(r'^\d{10}$').hasMatch(contactData.contactAccountNumber)) {
      throw Exception("Contact account number cannot be empty or invalid");
    }

    return contactData;
  }
}
