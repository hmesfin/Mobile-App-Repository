import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';

class NotificationSwitch extends StatelessWidget {
  final Function onChanged;
  final bool _switchOn;
  NotificationSwitch(
      {Key key, @required bool switchOn, @required this.onChanged})
      : _switchOn = switchOn,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomText(
          fontSize: 15,
          padding: EdgeInsets.only(right: 7),
          text: _switchOn ? 'Yes' : 'No',
        ),
        InkWell(
          onTap: () {
            onChanged();
            screenTracker.stopTimer();
            screenTracker.startTimer(context);
          },
          child: Container(
            padding: const EdgeInsets.all(3),
            width: 52,
            height: 26,
            decoration: buildBoxDecoration(),
            child: Row(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.decelerate,
                  width: _switchOn ? 26 : 0,
                ),
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: _switchOn ? CustomColors.yellow1 : Colors.grey[400],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(13),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
            color: CustomColors.grey1,
            offset: Offset(1.8369701987210297e-16, 3),
            blurRadius: 7,
            spreadRadius: 0)
      ],
    );
  }
}
