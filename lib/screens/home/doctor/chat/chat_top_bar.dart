import 'package:flutter/material.dart';
import 'package:virtudoc_app/custom-widgets/custom-text.dart';
import 'package:virtudoc_app/utils/common-widgets.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/styles.dart';

class ChatCustomTopBar extends StatelessWidget {
  const ChatCustomTopBar({
    Key key,
    this.custonBackButton = true,
    @required this.context,
    @required this.titleText,
    this.traling,
    this.backPress,
  }) : super(key: key);

  final BuildContext context;
  final String titleText;
  final Widget traling;
  final bool custonBackButton;
  final Function backPress;

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
            Container(
              margin: EdgeInsets.only(left: 1, bottom: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: backPress,
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
            ),
            Container(
              margin: EdgeInsets.only(
                top: CommonWidgets().getHeight(context) * 0.045,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: titleText,
                    color: CustomColors.white,
                    fontWeight: FontStyles.semiBoldFontWeight500,
                    fontSize: 22.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
