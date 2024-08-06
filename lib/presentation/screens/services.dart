import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinity_bank/domain/Model/Service/serviceModel.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/ServiceBLoC/servicebloc.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/ServiceBLoC/serviceevent.dart';
import 'package:infinity_bank/presentation/blocs/Bloc/ServiceBLoC/servicestate.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/screens/servicepay.dart';
import 'package:infinity_bank/presentation/widgets/Modalservice.dart';
import 'package:infinity_bank/presentation/widgets/servicebuttons.dart';

class ServicesArea extends StatefulWidget {
  const ServicesArea({super.key});

  @override
  State<ServicesArea> createState() => _ServicesAreaState();
}

class _ServicesAreaState extends State<ServicesArea> {
  @override
  void initState() {
    super.initState();
    context.read<ServiceBloc>().add(GetServicesEvent());
  }

  void navigateToService(Service service, String ref) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Payserv(
          image: service.icono,
          name: service.name,
          ref: ref,
          idservice: service.id,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorStyle.primary,
      appBar: AppBar(
        backgroundColor: AppColorStyle.primary,
        title: Text(
          "Pago de servicios",
          style: AppTextStyles.h1s1.copyWith(color: AppColorStyle.white),
        ),
        iconTheme: const IconThemeData(color: AppColorStyle.white),
      ),
      body: BlocBuilder<ServiceBloc, ServiceState>(
        builder: (context, state) {
          if (state is ServiceLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ServicesLoaded) {
            final services = state.services;

            return GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Tres elementos por fila
                childAspectRatio: 1, // Relación de aspecto 1:1 para los botones
                crossAxisSpacing: 10, // Espacio horizontal entre botones
                mainAxisSpacing: 10, // Espacio vertical entre botones
              ),
              itemCount: services.length,
              itemBuilder: (context, index) {
                final svc = services[index];
                return Btnservice(
                  name: svc.name,
                  url: svc.icono,
                  funcion: () => ModalService.displayComprobante(
                    context,
                    'Referencia',
                    (ref) => navigateToService(svc, ref),
                  ),
                );
              },
            );
          } else if (state is ServiceError) {
            return Center(
              child: Text(
                'Error: ${state.message}',
                style: AppTextStyles.h2s1.copyWith(color: Colors.red),
              ),
            );
          } else {
            return const Center(child: Text('Estado desconocido'));
          }
        },
      ),
    );
  }
}
