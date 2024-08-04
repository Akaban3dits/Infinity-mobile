import 'package:infinity_bank/domain/Model/Contacts/contactModel.dart';

abstract class ContactRepository {
  Future<Contact> createContact(Contact contact);
  Future<List<Contact>> getContacts();
  Future<Contact> getContact(int id);
  Future<bool> updateContact(int id, Contact contact);
  Future<bool> deleteContact(int id);
}
