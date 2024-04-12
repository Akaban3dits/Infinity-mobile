import 'package:flutter/material.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';

class Btnservice extends StatefulWidget {
  final String url;
  final String name;
  final VoidCallback funcion;

  const Btnservice({super.key, required this.name, required this.url, required this.funcion});

  @override
  State<Btnservice> createState() => _BtnserviceState();
}

class _BtnserviceState extends State<Btnservice> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.funcion,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        fixedSize: const Size(102, 90),
        backgroundColor: AppColorStyle.secundary2,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 12),
          widget.url.isNotEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: Image.network(
                    widget.url,
                    height: 50,
                    fit: BoxFit.fitHeight,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.error,
                        color: AppColorStyle.white.withOpacity(0.6),
                        size: 50,
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return SizedBox(
                        width: 50,
                        height: 50,
                        child: Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Icon(
                  Icons.image_not_supported,
                  color: AppColorStyle.white.withOpacity(0.6),
                  size: 50,
                ),
          const SizedBox(height: 5),
          Text(
            widget.name,
            style: AppTextStyles.h4s1.copyWith(color: AppColorStyle.white),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
