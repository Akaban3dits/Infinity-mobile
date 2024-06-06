import 'package:infinity_bank/domain/usecases/Updated/Contact/loadcontact.data.dart' as usecase;
import 'package:infinity_bank/presentation/blocs/Updated/Contact/contact_event.dart';
import 'package:infinity_bank/presentation/blocs/Updated/Contact/contact_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final usecase.LoadContactData loadContactData;
  ContactBloc(this.loadContactData)
      : super(ContactState(
            createdAt: DateTime.now())) {
    on<LoadContactDataEvent>((event, emit) async {
      final contactData = await loadContactData();
      emit(ContactState.fromModel(contactData));
    });
  }
}
