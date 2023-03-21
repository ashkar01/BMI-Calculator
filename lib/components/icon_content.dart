import 'package:flutter/material.dart';
import 'package:bmi_flutter/constant.dart';

class IconContent extends StatelessWidget {
  const IconContent({super.key, required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.00,
        ),
        const SizedBox(
          height: 15.00,
        ),
        Text(label, style: labelTextstyle),
      ],
    );
  }
}
