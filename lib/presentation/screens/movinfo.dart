import 'package:flutter/material.dart';
import 'package:infinity_bank/presentation/blocs/notifservice.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';

// ignore: must_be_immutable
class Infomoves extends StatefulWidget {
  Infomoves({
    super.key,
    required this.usuario,
    required this.monto,
    required this.fecha,
    required this.tipo,
    required this.estado,
    required this.detalle,
    required this.id,
  });

  String usuario;
  double monto; 
  DateTime fecha;
  String tipo;
  String estado;
  String detalle;
  String id;

  @override
  State<Infomoves> createState() => _InfomovesState();
}

class _InfomovesState extends State<Infomoves> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorStyle.primary,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColorStyle.white),
        title: Row(
          children: [
            const Icon(AppIconStyle.info, color: AppColorStyle.white),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text("Informacion del movimiento",
                  style:
                      AppTextStyles.h3s1.copyWith(color: AppColorStyle.white)),
            )
          ],
        ),
        backgroundColor: AppColorStyle.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: AppColorStyle.secundary2,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Wrap(
                spacing: 8.0,
                runSpacing: 15.0,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/InfinityVerticalLogo 1.png",
                              width: 100.0,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          height: 1.0,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                  _buildDataContainer(AppIconStyle.key, "ID", widget.id),
                  _buildDataContainer(
                      AppIconStyle.person, "Usuario", widget.usuario),
                  _buildDataContainer(
                      AppIconStyle.money, "Monto", "\$${widget.monto}"),
                  _buildDataContainer(AppIconStyle.date, "Fecha",
                      widget.fecha.toIso8601String().split('T').first),
                  _buildDataContainer(
                      AppIconStyle.info, "Estado", widget.estado),
                  _buildDataContainer(
                      AppIconStyle.details, "Detalle", widget.detalle),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {
                    _showConfirmationDialog(context);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColorStyle.red)),
                  child: Text("Enviar Reclamo",
                      style: AppTextStyles.h3s1
                          .copyWith(color: AppColorStyle.white)),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDataContainer(IconData icon, String label, String data) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = (screenWidth - 60) / 2;

    return Container(
      width: containerWidth,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: AppColorStyle.secundary2,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColorStyle.white),
          Text(label,
              style: AppTextStyles.h3s1.copyWith(color: AppColorStyle.white)),
          Text(data,
              textAlign: TextAlign.center,
              style: AppTextStyles.h4s1.copyWith(color: AppColorStyle.white)),
        ],
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColorStyle.primary,
          title: Text('Confirmación', style: AppTextStyles.h3s1.copyWith(color: AppColorStyle.white)),
          content: Text('¿Deseas reclamar el siguiente movimiento?', style: AppTextStyles.h4s1.copyWith(color: AppColorStyle.white)),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                String body = "El reclamo al movimiento con id ${widget.id} fue enviado exitosamente";
                
                Navigator.of(context).pop(); 
                NotificationService.showNotification(body);
                
              },
              child: Text('Sí', style: AppTextStyles.h4s1.copyWith(color: AppColorStyle.white)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: Text('No', style: AppTextStyles.h4s1.copyWith(color: AppColorStyle.white)),
            ),
          ],
        );
      },
    );
  }
}
