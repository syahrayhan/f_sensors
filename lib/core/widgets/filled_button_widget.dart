import 'package:flutter/material.dart';

class FilledButtonWidget extends StatelessWidget {
  const FilledButtonWidget({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);
  final String text;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: FilledButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      );
}
