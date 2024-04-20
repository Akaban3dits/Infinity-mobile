import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/screens/movinfo.dart';

class MovesData extends StatefulWidget {
  const MovesData({
    super.key,
    required this.usuario,
    required this.monto,
    required this.fecha,
    required this.tipo,
    required this.estado,
    required this.detalle,
    required this.id,
    required this.url,
  });

  final String usuario, tipo, estado, detalle, id, url;
  final double monto;
  final DateTime fecha;

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
              ),
            ),
          );
        },
        child: SizedBox(
          height: 80,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: widget.url,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
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
                    )
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
