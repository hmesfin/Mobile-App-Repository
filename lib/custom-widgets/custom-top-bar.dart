import 'package:flutter/material.dart';
import 'package:virtudoc_app/custom-widgets/custom-text.dart';
import 'package:virtudoc_app/utils/common-widgets.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';
import 'package:virtudoc_app/utils/styles.dart';

class CustomTopBar extends StatelessWidget {
  final onTap;
  const CustomTopBar({
    Key key,
    this.custonBackButton = true,
    @required this.context,
    this.onTap,
    @required this.titleText,
    this.traling,
  }) : super(key: key);

  final BuildContext context;
  final String titleText;
  final Widget traling;
  final bool custonBackButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 10,
      ),
      child: Container(
        margin: EdgeInsets.only(
          bottom: 5,
        ),
        width: CommonWidgets().getWidth(context),
        height: CommonWidgets().getHeight(context) * 0.145,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg_header.png"),
              fit: BoxFit.fill),
        ),
        child: Stack(
          children: <Widget>[
            custonBackButton
                ? CustonBackButton(
                    context: context,
                    onTap: onTap,
                  )
                : SizedBox(),
            AppBarText(
              text: titleText,
            ),
            traling ?? Container()
          ],
        ),
      ),
    );
  }
}

class CustonBackButton extends StatelessWidget {
  final onTap;
  const CustonBackButton({
    Key key,
    @required this.context,
    this.onTap,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 1, bottom: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap ??
              () {
                Navigator.pop(context);
              },
          child: Container(
            height: 50,
            width: 40,
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(color: Colors.transparent),
            child: Image.asset(
              "assets/images/ic_back.png",
            ),
          ),
        ),
      ),
    );
  }
}

class AppBarText extends StatelessWidget {
  const AppBarText({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: CommonWidgets().getHeight(context) * 0.045,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: text,
            color: CustomColors.white,
            fontWeight: FontStyles.semiBoldFontWeight500,
            fontSize: 22.0,
          ),
        ],
      ),
    );
  }
}
