import 'package:flutter/material.dart';
import 'package:infinity_bank/domain/entities/services.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/screens/servicepay.dart';
import 'package:infinity_bank/presentation/widgets/servicebuttons.dart';
import 'package:infinity_bank/presentation/widgets/Modalservice.dart';

class ServicesArea extends StatefulWidget {
  const ServicesArea({super.key});

  @override
  State<ServicesArea> createState() => _ServicesAreaState();
}

class _ServicesAreaState extends State<ServicesArea> {
  void navigateToPublicos(Services service, String ref) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              Payserv(image: service.url, name: service.servname, ref: ref),
        ));
  }

  void navigateToStore(Services service, String ref) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              Payserv(image: service.url, name: service.servname, ref: ref),
        ));
  }

  void navigateToStreaming(Services service, String ref) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              Paystr(image: service.url, name: service.servname, ref: ref),
        ));
  }

  void navigateToMovil(Services service, String ref) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              Paymovil(image: service.url, name: service.servname, ref: ref),
        ));
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            section("Servicios Públicos", publicos, navigateToPublicos,
                "Referencia"),
            section("Tiendas en línea", store, navigateToStore, "Referencia"),
            section("Streaming", streaming, navigateToStreaming,
                "Numero de cliente"),
            section("Recargas", movil, navigateToMovil, "Numero de telefono"),
          ],
        ),
      ),
    );
  }

  Widget section(String title, List<Services> services,
      void Function(Services, String) navigationFunction, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: AppTextStyles.h2s1.copyWith(color: AppColorStyle.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: services.length,
              itemBuilder: (context, index) {
                final svc = services[index];
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: Btnservice(
                        name: svc.servname,
                        url: svc.url,
                        funcion: () => ModalService.displayComprobante(
                            context,
                            label,
                            (ref) => navigationFunction(
                                svc, ref)))); // Actualizado para pasar 'ref'
              },
            ),
          ),
        ),
      ],
    );
  }
}
