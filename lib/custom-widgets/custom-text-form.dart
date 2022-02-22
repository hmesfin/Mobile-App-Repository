import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    Key key,
    this.height,
    this.width,
    this.radius,
    this.padding,
    this.margin,
    this.textAlign,
  }) : super(key: key);

  final double height, width, radius;
  final EdgeInsetsGeometry padding, margin;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? null,
      padding: padding ?? null,
      decoration: BoxDecoration(
          color: CustomColors.white,
          border: Border.all(color: CustomColors.yellow1),
          borderRadius: BorderRadius.circular(radius ?? 20)),
      child: Center(
        child: TextFormField(
          onTap: () {
            screenTracker.stopTimer();
            screenTracker.startTimer(context);
          },
          textAlign: textAlign ?? TextAlign.center,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
      height: height ?? CommonWidgets().getWidth(context) * 0.15,
      width: width ?? CommonWidgets().getWidth(context) * 0.32,
    );
  }
}
