import 'package:flutter/material.dart';

class SimpleTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const SimpleTextButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: deviceWidth,
        child: Center(child: Text(title)),
      ),
    );
  }
}
