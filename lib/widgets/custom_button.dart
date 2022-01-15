import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function() onPressed;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
      color: Color(0xFF2B637B),
      height: 53,
      minWidth: MediaQuery.of(context).size.width,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      onPressed: onPressed,
    );
  }
}
