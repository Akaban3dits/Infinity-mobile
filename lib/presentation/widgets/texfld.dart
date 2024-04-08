import 'package:flutter/material.dart';

class TextfUs extends StatelessWidget {
  const TextfUs({super.key, required this.hintText, required this.obscureText, required this.icon});

  final String hintText;
  final bool obscureText;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
            
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: Colors.white)),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: Colors.white)),
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            prefixIcon: Icon(icon),),
      ),
    );
  }
  
}
