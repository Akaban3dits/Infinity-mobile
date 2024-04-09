import 'package:flutter/material.dart';
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
  double monto; // Cambiado de String a double
  DateTime fecha; // Cambiado de String a DateTime
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
            Wrap(
              spacing: 8.0,
              runSpacing: 15.0,
              alignment: WrapAlignment.spaceBetween,
              children: [
                _buildDataContainer(
                    AppIconStyle.person, "Usuario", widget.usuario),
                _buildDataContainer(
                    AppIconStyle.money, "Monto", "\$${widget.monto}"),
                _buildDataContainer(AppIconStyle.date, "Fecha",
                    widget.fecha.toIso8601String().split('T').first),
                _buildDataContainer(AppIconStyle.info, "Estado", widget.estado),
                _buildDataContainer(
                    AppIconStyle.details, "Detalle", widget.detalle),
                _buildDataContainer(AppIconStyle.key, "ID", widget.id),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Enviar reclamo"),
                            content: Text(
                                "¿Estas seguro que deseas enviar un reclamo por el movimiento con id ${widget.id}?"),
                            actions: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: const Text("Si, envialo.")),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("No, cancelar."))
                                ],
                              )
                            ],
                          );
                        });
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
    return Container(
      width: (MediaQuery.of(context).size.width - 36) / 2,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColorStyle.secundary2,
        border: Border.all(color: AppColorStyle.secundary2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColorStyle.white),
          Text(label,
              style: AppTextStyles.h3s1.copyWith(color: AppColorStyle.white)),
          Text(
            data,
            style: AppTextStyles.h4s1.copyWith(color: AppColorStyle.white)
          ),
        ],
      ),
    );
  }
}
