import 'package:flutter/material.dart';
import 'package:virtudoc_app/custom-widgets/custom-text.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';

class ModelOptionSelect extends StatelessWidget {
  const ModelOptionSelect({
    Key key,
    @required this.modalSelected,
    @required this.onTap,
    @required this.text,
  }) : super(key: key);

  final String modalSelected;
  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
        screenTracker.stopTimer();
        screenTracker.startTimer(context);
      },
      child: Container(
        height: 69,
        color: modalSelected == text ? CustomColors.white : CustomColors.grey1,
        child: Center(
          child: CustomText(
            text: text,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
