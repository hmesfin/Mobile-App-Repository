import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';

class SettingsButton extends StatelessWidget {
  final String text;
  final Function onpressed;
  final bool showArrow;
  SettingsButton(
      {Key key,
      @required this.text,
      @required this.onpressed,
      this.showArrow = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        onpressed();
        screenTracker.stopTimer();
        screenTracker.startTimer(context);
      },
      padding: const EdgeInsets.all(0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 9, right: 11),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("$text",
                      style: const TextStyle(
                          color: CustomColors.black1,
                          fontWeight: FontStyles.semiBoldFontWeight500,
                          fontFamily: "Roboto",
                          package: 'assets/fonts/Roboto-Regular',
                          fontStyle: FontStyle.normal,
                          fontSize: FontStyles.medium)),
                  showArrow
                      ? Image.asset("assets/images/ic_right_arrow.png")
                      : Container()
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
