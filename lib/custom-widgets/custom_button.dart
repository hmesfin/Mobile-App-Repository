import 'package:flutter/material.dart';
import 'package:virtudoc_app/custom-widgets/custom-text.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';
import 'package:virtudoc_app/utils/styles.dart';

class CustomButton extends StatelessWidget {
  final Function ontap;
  final String buttonText;
  final double height;
  final double width;
  final EdgeInsetsGeometry margin;
  final Color color;
  const CustomButton({
    Key key,
    @required this.ontap,
    @required this.buttonText,
    this.height,
    this.width,
    this.color,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ontap();
        screenTracker.stopTimer();
        screenTracker.startTimer(context);
      },
      onDoubleTap: () {
        screenTracker.stopTimer();
        screenTracker.startTimer(context);
      },
      onVerticalDragStart: (dragDetails) {
        screenTracker.stopTimer();
        screenTracker.startTimer(context);
      },
      onHorizontalDragStart: (dragDetails) {
        screenTracker.stopTimer();
        screenTracker.startTimer(context);
      },
      child: Container(
        margin: margin ?? EdgeInsets.only(top: 20, bottom: 20),
        width: width ?? 200,
        height: height ?? 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          color: color ?? CustomColors.yellow1,
        ),
        child: Center(
            child: CustomText(
                text: buttonText,
                color: CustomColors.white,
                fontWeight: FontStyles.semiBoldFontWeight500,
                fontSize: 14.0)),
      ),
    );
  }
}
