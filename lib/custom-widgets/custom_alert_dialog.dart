import 'package:virtudoc_app/index.dart';

class CustomAlertDialog extends StatelessWidget {
  final message;
  const CustomAlertDialog({
    @required this.message,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircularProgressIndicator(),
          Text(
            message,
            style: TextStyle(
                fontSize: 16, fontWeight: FontStyles.semiBoldFontWeight500),
          )
        ],
      ),
    );
  }
}
