import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);
  final Widget icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 50,
          height: 50,
          margin: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: icon,
        ),
      );
}
