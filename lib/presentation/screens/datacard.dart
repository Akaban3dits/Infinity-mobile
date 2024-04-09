import 'package:flutter/material.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';

class DataCard extends StatefulWidget {
  const DataCard(
      {super.key,
      required this.money,
      required this.names,
      required this.vig,
      required this.vig1,
      required this.account});

  final String names;
  final double money;
  final int vig;
  final int vig1;
  final String account;

  @override
  State<DataCard> createState() => _DataCardState();
}

class _DataCardState extends State<DataCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorStyle.primary,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColorStyle.white),
        title: const Row(
          children: [
            Icon(Icons.info, color: AppColorStyle.white),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                "Informacion del movimiento",
                style: TextStyle(
                    fontFamily: 'Coolvetica',
                    color: AppColorStyle.white,
                    fontSize: 21),
              ),
            )
          ],
        ),
        backgroundColor: AppColorStyle.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 8.0, // Espacio horizontal entre los Containers
          runSpacing: 15.0, // Espacio vertical entre los Containers
          alignment: WrapAlignment.spaceBetween,
          children: [
            _buildDataContainer(AppIconStyle.user, "Usuario", widget.names),
            _buildDataContainer(
                AppIconStyle.money, "Saldo", "\$${widget.money}"),
            _buildDataContainer(
                AppIconStyle.accbox, "Numero de cuenta", widget.account),
            _buildDataContainer(
                AppIconStyle.date, "Mes", widget.vig.toString()),
            _buildDataContainer(
                AppIconStyle.date, "Año", widget.vig1.toString()),
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
          Icon(icon, color: Colors.white),
          Text(label,
              style: AppTextStyles.h2s1.copyWith(color: AppColorStyle.white)),
          Text(
            data,
            style: AppTextStyles.h4s1.copyWith(color: AppColorStyle.white),
          ),
        ],
      ),
    );
  }
}
