import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_bank/presentation/screens/splashscreen.dart';
import 'package:infinity_bank/domain/repositories/Updated/Customer/customer_repository_impl.dart';
import 'package:infinity_bank/domain/usecases/Updated/Customer/loadcustomer.dart';
import 'package:infinity_bank/presentation/blocs/Updated/Customer/customer_bloc.dart';
import 'package:infinity_bank/domain/models/Updated/Customers/api_provider.dart';
import 'package:intl/date_symbol_data_local.dart'; 
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
        BlocProvider<CustomerBloc>(
          create: (context) => CustomerBloc(
            LoadCustomerData(CustomerRepositoryImpl()),
            ApiProvider(),
          ),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Infinity',
        home: SplashScreen(),
      ),
    );
  }
}
