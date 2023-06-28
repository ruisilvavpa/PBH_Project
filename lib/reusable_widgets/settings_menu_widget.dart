import 'package:flutter/material.dart';

class SettingsMenuWidget extends StatelessWidget {
  const SettingsMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.hideArrow,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool? hideArrow;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress, // Atribui a função ao onTap do InkWell
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.grey.withOpacity(0.1),
          ),
          child: Icon(
            icon,
            color: Colors.lightBlue,
          ),
        ),
        title: Text(title),
        trailing: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: (hideArrow ?? false)
                ? Colors.transparent
                : Colors.grey.withOpacity(0.1),
          ),
          child:
              (hideArrow ?? false) ? null : const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
