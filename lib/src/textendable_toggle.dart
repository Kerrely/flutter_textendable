import 'package:flutter/material.dart';

class TextendableToggle extends StatelessWidget {
  final EdgeInsets? padding;
  final VoidCallback onToggle;

  const TextendableToggle({
    required this.onToggle,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(8.0),
      child: OutlinedButton(
        onPressed: onToggle,
        child: Text('Toggle'),
      ),
    );
  }
}
