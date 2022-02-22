import 'package:virtudoc_app/index.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class NotificationSetting extends StatefulWidget {
  @override
  _NotificationSettingState createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bg_app,
      body: SingleChildScrollView(
        child: _buildWidget(context),
      ),
    );
  }

  _buildWidget(BuildContext context) {
    double appbarheight = appBar.preferredSize.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: CustomColors.bg_app,
          height: screenHeight + appbarheight,
          width: screenWidth,
          child: Column(
            children: <Widget>[
              CustomTopBar(
                context: context,
                custonBackButton: true,
                titleText: Strings.notificationSetting,
              ),
              Container(
                padding: EdgeInsets.only(
                    left: screenWidth / 20,
                    right: screenWidth / 20,
                    bottom: 43,
                    top: 27),
                child: AutoSizeText(
                  Strings.changeNotification,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontWeight: FontStyles.semiBoldFontWeight400,
                    fontFamily: FontStyles.fontFamly,
                    package: FontStyles.package,
                    fontSize: 18,
                    // color: CustomColors.yellow1,
                    fontStyle: FontStyle.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 9, right: 11),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(Strings.pushNotification,
                              style: const TextStyle(
                                  color: CustomColors.black1,
                                  fontWeight: FontStyles.semiBoldFontWeight500,
                                  fontFamily: "Roboto",
                                  package: 'assets/fonts/Roboto-Regular',
                                  fontStyle: FontStyle.normal,
                                  fontSize: FontStyles.medium)),
                          Consumer<UserProvider>(
                            builder: (context, user, child) =>
                                NotificationSwitch(
                              switchOn: user.isNotify,
                              onChanged: () async {
                                setState(() {
                                  user.isNotify = !user.isNotify;
                                });
                                final response = await Provider.of<
                                            NotificationSettingProvider>(
                                        context,
                                        listen: false)
                                    .setnotification(NotificationSettingModel(
                                        isNotify: user.isNotify));

                                if (!response.success) {
                                  CommonWidgets.showToast(
                                      context, response.message, _scaffoldKey);
                                } else {
                                  CommonWidgets().navigateBack(context);
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Divider()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
