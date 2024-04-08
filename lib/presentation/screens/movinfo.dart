import 'package:flutter/material.dart';

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
      backgroundColor: const Color(0xff6717CD),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Row(
          children: [
            Icon(Icons.info, color: Colors.white),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                "Informacion del movimiento",
                style: TextStyle(
                    fontFamily: 'Coolvetica',
                    color: Colors.white,
                    fontSize: 21),
              ),
            )
          ],
        ),
        backgroundColor: const Color(0xff6717CD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          spacing: 8.0, // Espacio horizontal entre los Containers
          runSpacing: 15.0, // Espacio vertical entre los Containers
          alignment: WrapAlignment.spaceBetween,
          children: [
            _buildDataContainer(Icons.person, "Usuario", widget.usuario),
            _buildDataContainer(Icons.attach_money, "Monto", "\$${widget.monto}"),
            _buildDataContainer(Icons.date_range, "Fecha", widget.fecha.toIso8601String().split('T').first),
            _buildDataContainer(Icons.info_outline, "Estado", widget.estado),
            _buildDataContainer(Icons.details, "Detalle", widget.detalle),
            _buildDataContainer(Icons.vpn_key, "ID", widget.id),
          ],
        ),
      ),
    );
  }

  Widget _buildDataContainer(IconData icon, String label, String data) {
    return Container(
      width: (MediaQuery.of(context).size.width - 36) / 2,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xff16045D),
        border: Border.all(color: Color(0xff16045D)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white),
          Text(label, style: TextStyle(color: Colors.white, fontFamily: 'Coolvetica',fontSize: 25)),
          Text(data, style: TextStyle(color: Colors.white, fontFamily: 'Coolvetica', fontSize: 14),),
        ],
      ),
    );
  }
}


