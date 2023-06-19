import 'package:flutter/material.dart';

class CustomSwitchListTile extends StatelessWidget {
  //variables
  final String title;
  final bool value;
  final Function(bool) onChanged;

  //constructor
  const CustomSwitchListTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }
}
