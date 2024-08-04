import 'package:flutter/material.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';

class TextfUs extends StatefulWidget {
  const TextfUs({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.icon,
    this.controller,
    this.onChanged,
    this.keyboard,
    this.validator,
    this.ocultar = false, 
  });

  final String hintText;
  final bool obscureText;
  final IconData icon;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboard;
  final String? Function(String?)? validator;
  final bool ocultar; 

  @override
  // ignore: library_private_types_in_public_api
  _TextfUsState createState() => _TextfUsState();
}

class _TextfUsState extends State<TextfUs> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextFormField(
        keyboardType: widget.keyboard,
        onChanged: widget.onChanged,
        obscureText: _obscureText,
        controller: widget.controller,
        validator: widget.validator,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: AppColorStyle.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: AppColorStyle.white),
          ),
          fillColor: AppColorStyle.white,
          filled: true,
          hintText: widget.hintText,
          prefixIcon: Icon(widget.icon),
          suffixIcon: widget.ocultar
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}
