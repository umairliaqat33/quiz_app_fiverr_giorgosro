import 'package:flutter/material.dart';

import 'package:quiz_app/config/size_config.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.buttonColor,
    required this.title,
    required this.onPressed,
    this.textColor,
  });
  final Color? buttonColor;
  final String title;
  final Function onPressed;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: buttonColor ?? Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10.0),
      elevation: 5.0,
      child: MaterialButton(
        onPressed: () => onPressed(),
        minWidth: 200.0,
        height: 60.0,
        child: Text(
          title,
          style: TextStyle(
            color: textColor ?? Colors.black,
            fontSize: SizeConfig.font18(context),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
