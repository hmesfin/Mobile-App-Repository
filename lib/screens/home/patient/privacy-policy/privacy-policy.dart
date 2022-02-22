import 'package:virtudoc_app/index.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class PrivacyPolicy extends StatefulWidget {
  PrivacyPolicy({Key key}) : super(key: key);

  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  var _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            body: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: CommonWidgets().getHeight(context) * 0.07),
                  child: WebView(
                    onPageFinished: (str) {
                      setState(() {
                        _isLoading = false;
                      });
                    },
                    initialUrl: ApiUrl.privacyPolicy,
                  ),
                ),
                CustomTopBar(
                  context: context,
                  custonBackButton: true,
                  titleText: Strings.privacyPolicy,
                ),
                if (_isLoading)
                  Container(
                    color: Colors.black12,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
