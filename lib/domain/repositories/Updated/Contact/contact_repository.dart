import 'package:infinity_bank/domain/models/Updated/Contact/contactModel.dart';

abstract class ContactRepository {
  Future<Contact> loadContactData();
}
