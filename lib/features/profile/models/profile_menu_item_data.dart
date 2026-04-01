import 'package:flutter/material.dart';

class ProfileMenuItemData {
  const ProfileMenuItemData({
    required this.icon,
    required this.title,
    this.iconColor,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final Color? iconColor;
  final Widget? trailing;
}
