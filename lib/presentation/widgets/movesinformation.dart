import 'package:flutter/material.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/screens/movinfo.dart';

// ignore: must_be_immutable
class MovesData extends StatefulWidget {
  MovesData({
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
  State<MovesData> createState() => _MovesDataState();
}

class _MovesDataState extends State<MovesData> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Infomoves(
                        usuario: widget.usuario,
                        monto: widget.monto,
                        fecha: widget.fecha,
                        tipo: widget.tipo,
                        estado: widget.estado,
                        detalle: widget.detalle,
                        id: widget.id,
                      )));
        },
        // ignore: sized_box_for_whitespace
        child: Container(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          'https://i.pinimg.com/564x/b6/af/36/b6af36fc4de4e73288a3eca57101e5b7.jpg',
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.usuario,
                              style: AppTextStyles.h4s1
                                  .copyWith(color: AppColorStyle.white),
                            ),
                            Text(
                              widget.tipo,
                              style: AppTextStyles.h4s1
                                  .copyWith(color: AppColorStyle.white),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "\$${widget.monto}",
                    style:
                        AppTextStyles.h4s1.copyWith(color: AppColorStyle.white),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Icon(
                      AppIconStyle.arrowforward,
                      color: AppColorStyle.white,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
