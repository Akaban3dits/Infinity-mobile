import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_bank/domain/Repository/Contacts/contact_repository.dart';
import 'package:infinity_bank/domain/Usecases/Contacts/createcontact.dart';
import 'package:infinity_bank/domain/Usecases/Contacts/deletecontact.dart';
import 'package:infinity_bank/domain/Usecases/Contacts/getcontacts.dart';
import 'package:infinity_bank/domain/Usecases/Contacts/updatecontact.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/ContactBLoC/contactevent.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/ContactBLoC/contactstate.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final CreateContactUseCase createContactUseCase;
  final GetContactsUseCase getContactsUseCase;
  final UpdateContactUseCase updateContactUseCase;
  final DeleteContactUseCase deleteContactUseCase;

  ContactBloc({
    required ContactRepository repository,
  })  : createContactUseCase = CreateContactUseCase(repository),
        getContactsUseCase = GetContactsUseCase(repository),
        updateContactUseCase = UpdateContactUseCase(repository),
        deleteContactUseCase = DeleteContactUseCase(repository),
        super(ContactInitial()) {
    on<GetContactsEvent>(_onGetContactsEvent);
    on<CreateContactEvent>(_onCreateContactEvent);
    on<UpdateContactEvent>(_onUpdateContactEvent);
    on<DeleteContactEvent>(_onDeleteContactEvent);
  }

  Future<void> _onGetContactsEvent(
      GetContactsEvent event, Emitter<ContactState> emit) async {
    emit(ContactLoading());
    try {
      final contacts = await getContactsUseCase.call();
      emit(ContactsLoaded(contacts));
    } catch (e) {
      emit(ContactError("Error obtaining contacts: $e"));
    }
  }

  Future<void> _onCreateContactEvent(
      CreateContactEvent event, Emitter<ContactState> emit) async {
    emit(ContactLoading());
    try {
      final errorMessage = await createContactUseCase.call(event.contact);
      if (errorMessage == null) {
        emit(ContactCreated(event.contact));
      } else {
        emit(ContactError(errorMessage));
      }
    } catch (e) {
      emit(ContactError("Error creating contact: $e"));
    }
  }

  Future<void> _onUpdateContactEvent(
      UpdateContactEvent event, Emitter<ContactState> emit) async {
    emit(ContactLoading());
    try {
      final errorMessage = await updateContactUseCase.call(event.id, event.contact);
      if (errorMessage == null) {
        emit(ContactUpdated());
      } else {
        emit(ContactError(errorMessage));
      }
    } catch (e) {
      emit(ContactError("Error updating contact: $e"));
    }
  }

  Future<void> _onDeleteContactEvent(
      DeleteContactEvent event, Emitter<ContactState> emit) async {
    emit(ContactLoading());
    try {
      final errorMessage = await deleteContactUseCase.call(event.id);
      if (errorMessage == null) {
        emit(ContactDeleted());
      } else {
        emit(ContactError(errorMessage));
      }
    } catch (e) {
      emit(ContactError("Error deleting contact: $e"));
    }
  }
}
