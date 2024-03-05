import 'package:flutter/material.dart';
import 'colors.dart';
import 'screenutil.dart';

class BlueButton extends StatefulWidget {
  final String tapText;

  BlueButton(this.tapText);
  @override
  _BlueButtonState createState() => _BlueButtonState();
}

class _BlueButtonState extends State<BlueButton> {
  bool isButtonClicked = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = ScreenUtil.screenHeight(context);
    final screenWidth = ScreenUtil.screenWidth(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          isButtonClicked = !isButtonClicked;
        });
      },
      child: Container(
        width: screenWidth * .27,
        height: screenHeight * .06,
        decoration: BoxDecoration(
          color: isButtonClicked ? BgColor : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            widget.tapText,
            style: TextStyle(
              color: isButtonClicked ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
