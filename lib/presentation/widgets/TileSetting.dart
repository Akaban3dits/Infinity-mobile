// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';

class BtnTileSetts extends StatelessWidget {
  const BtnTileSetts(
      {super.key,
      required this.icon,
      required this.subtitle,
      this.trailing,
      required this.title,
      this.onTap});

  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: AppColorStyle.white),
      title: Text(title, style: AppTextStyles.h3s1.copyWith(color:  AppColorStyle.white)),
      subtitle: Text(subtitle, style: AppTextStyles.h4s1.copyWith(color: AppColorStyle.white),),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
