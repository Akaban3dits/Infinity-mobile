import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_bank/domain/ApiProvider/Account/accountProvider.dart';
import 'package:infinity_bank/domain/ApiProvider/Contacts/contactProvider.dart';
import 'package:infinity_bank/domain/ApiProvider/Customer/customerProvider.dart';
import 'package:infinity_bank/domain/ApiProvider/Log_Service/logserviceprovider.dart';
import 'package:infinity_bank/domain/ApiProvider/Service/serviceProvider.dart';
import 'package:infinity_bank/domain/ApiProvider/Transference/transferenceProvider.dart';
import 'package:infinity_bank/domain/Repository/Account/account_repository_impl.dart';
import 'package:infinity_bank/domain/Repository/Contacts/contact_repository_impl.dart';
import 'package:infinity_bank/domain/Repository/Customer/customer_repository_impl.dart';
import 'package:infinity_bank/domain/Repository/Log_Service/logservice_repository_impl.dart';
import 'package:infinity_bank/domain/Repository/Service/service_repository_impl.dart';
import 'package:infinity_bank/domain/Repository/Transference/transference_repository_impl.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/AccountBLoC/accountbloc.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/ContactBLoC/contactbloc.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/CustomerBLoC/customerbloc.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/LogserviceBLoC/logservicebloc.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/ServiceBLoC/servicebloc.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/TransferenceBLoC/transferencebloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:infinity_bank/presentation/screens/splashscreen.dart';
import 'package:infinity_bank/presentation/blocs/notifservice.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('es_ES', null);
  NotificationService.initializeNotifications();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const InfinityApp());
  });
}

class InfinityApp extends StatelessWidget {
  const InfinityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AccountBloc(
                repository: AccountRepositoryImpl(AccountProvider()))),
        BlocProvider(
            create: (context) => CustomerBloc(
                repository: CustomerRepositoryImpl(CustomerProvider()))),
        BlocProvider(
            create: (context) => ServiceBloc(
                  repository: ServiceRepositoryImpl(ServiceProvider()),
                )),
        BlocProvider(
            create: (context) => TransferenceBloc(
                repository:
                    TransferenceRepositoryImpl(TransferenceProvider()))),
        BlocProvider(
            create: (context) => ContactBloc(
                repository: ContactRepositoryImpl(ContactProvider()))),
        BlocProvider(
            create: (context) => LogServiceBloc(
                repository: LogServiceRepositoryImpl(LogServiceProvider())))
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Infinity',
        home: SplashScreen(),
      ),
    );
  }
}
