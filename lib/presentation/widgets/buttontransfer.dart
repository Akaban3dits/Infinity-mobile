import 'package:flutter/material.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';

class BtnTransfer extends StatefulWidget {
  const BtnTransfer(
      {super.key,
      required this.iconname,
      required this.name,
      required this.onPressed});
  final IconData iconname;
  final String name;
  final VoidCallback onPressed;
  @override
  State<BtnTransfer> createState() => _BtnTransferState();
}

class _BtnTransferState extends State<BtnTransfer> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColorStyle.secundary2,
                  ),
                  child: IconButton(
                    icon: Icon(widget.iconname),
                    iconSize: 30,
                    onPressed: widget.onPressed,
                    color: AppColorStyle.white,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(widget.name,
                    style:
                        AppTextStyles.h4s1.copyWith(color: AppColorStyle.white))
              ],
            )
          ],
        ),
      ),
    );
  }
}
