import 'package:flutter/material.dart';
import 'colors.dart';
import 'screenutil.dart';

class CustomProfile extends StatelessWidget {
  final IconData? iconData;
  final Positioned? positionedWidget;
  final String image;

  const CustomProfile(
      {super.key, this.iconData, this.positionedWidget, required this.image});

  @override
  Widget build(BuildContext context) {
    final screenHeight = ScreenUtil.screenHeight(context);
    final screenWidth = ScreenUtil.screenWidth(context);
    return Stack(children: [
      Container(
        //color: Colors.red,
        width: screenWidth * .18,
        height: screenHeight * .11,
        decoration: BoxDecoration(
          border: Border.all(
            color: BgColor.withOpacity(0.6), // Border color with opacity
            width: 1.0,
            // Border width
          ),
          borderRadius: BorderRadius.circular(22),
        ),
        padding: EdgeInsets.all(3),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
      if (positionedWidget != null) positionedWidget!,
    ]);
  }
}
