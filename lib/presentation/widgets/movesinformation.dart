import 'package:flutter/material.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/screens/movinfo.dart';

class MovesData extends StatefulWidget {
  const MovesData({
    super.key,
    required this.usuario,
    required this.monto,
    this.fecha,
    required this.tipo,
    required this.estado,
    required this.detalle,
    required this.id,
    required this.enviado,
  });

  final String usuario, tipo, estado, detalle, id;
  final double monto;
  final DateTime? fecha;
  final bool enviado; // Añadido para indicar si es enviado o recibido

  @override
  State<MovesData> createState() => _MovesDataState();
}

class _MovesDataState extends State<MovesData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          try {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Infomoves(
                  usuario: widget.usuario,
                  monto: widget.monto,
                  tipo: widget.tipo,
                  estado: widget.estado,
                  detalle: widget.detalle,
                  id: widget.id,
                ),
              ),
            );
          } catch (e) {
            print('Error al navegar a Infomoves: $e');
          }
        },
        child: SizedBox(
          height: 50,
          child: Row(
            children: [
              Icon(
                widget.enviado ? Icons.arrow_upward : Icons.arrow_downward,
                color: widget.enviado
                    ? Colors.red 
                    : Colors.green, 
                size: 50,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.usuario,
                      style: AppTextStyles.h2s1
                          .copyWith(color: AppColorStyle.white),
                    ),
                    Text(
                      widget.tipo,
                      style: AppTextStyles.h4s1
                          .copyWith(color: AppColorStyle.white),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Text(
                "\$${widget.monto.toStringAsFixed(2)}",
                style: AppTextStyles.h3s1.copyWith(color: AppColorStyle.white),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: AppColorStyle.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
