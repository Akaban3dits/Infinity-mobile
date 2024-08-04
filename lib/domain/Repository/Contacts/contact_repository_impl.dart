import 'package:infinity_bank/domain/ApiProvider/Contacts/contactProvider.dart';
import 'package:infinity_bank/domain/Model/Contacts/contactModel.dart';
import 'package:infinity_bank/domain/Repository/Contacts/contact_repository.dart';

class ContactRepositoryImpl implements ContactRepository {
  final ContactProvider _provider;

  ContactRepositoryImpl(this._provider);

  @override
  Future<Contact> createContact(Contact contact) async {
    try {
      final createdContact = await _provider.createContact(contact.toJson());
      return createdContact;
    } catch (e) {
      throw Exception("Failed to create contact: $e");
    }
  }

  @override
  Future<List<Contact>> getContacts() async {
    try {
      final contacts = await _provider.getContacts();
      return contacts;
    } catch (e) {
      throw Exception("Failed to get contacts: $e");
    }
  }

  @override
  Future<Contact> getContact(int id) async {
    try {
      final contact = await _provider.getContact(id);
      return contact;
    } catch (e) {
      throw Exception("Failed to get contact: $e");
    }
  }

  @override
  Future<bool> updateContact(int id, Contact contact) async {
    try {
      await _provider.updateContact(id, contact.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> deleteContact(int id) async {
    try {
      await _provider.deleteContact(id);
      return true;
    } catch (e) {
      return false;
    }
  }
}
