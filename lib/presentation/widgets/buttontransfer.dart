import 'package:flutter/material.dart';

class BtnTransfer extends StatefulWidget {
  const BtnTransfer({super.key, required this.iconname, required this.name});
  final IconData iconname;
  final String name;
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
          children: [Row(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff16035C),
                    ),
                    child: IconButton(
                      icon: Icon(widget.iconname),iconSize: 30,
                      onPressed: () {},
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            Row(
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(color: Colors.white, fontFamily: 'Coolvetica', fontSize: 16),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
