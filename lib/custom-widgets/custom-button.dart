import 'package:flutter/material.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';

class ModalButton extends StatelessWidget {
  final Function onPress;
  final String text;
  final Color textColor;
  final Color color;
  const ModalButton(
      {Key key,
      @required this.onPress,
      @required this.color,
      @required this.text,
      @required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
        screenTracker.stopTimer();
        screenTracker.startTimer(context);
      },
      child: Container(
        width: 150,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          color: color,
        ),
        child: Center(
          child: Text(text,
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Roboto",
                  fontStyle: FontStyle.normal,
                  fontSize: 16.0),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
