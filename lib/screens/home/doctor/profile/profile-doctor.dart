import 'package:flutter/scheduler.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/doctor/doctor-transactions/doctor-transactions.dart';
import 'package:virtudoc_app/screens/home/doctor/enrollment-details-update/enrollment-detail-update.dart';
import 'package:virtudoc_app/screens/home/doctor/enrollment-details-update/enrollment-provider-update.dart';
import 'package:virtudoc_app/screens/home/doctor/rating-feedback/rating-feedback.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:virtudoc_app/screens/home/patient/help/faqs.dart';
import 'package:virtudoc_app/screens/home/patient/help/help.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class ProfileDoctor extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProfileDoctorState();
}

class _ProfileDoctorState extends State<ProfileDoctor> {
  var isPatientEnable = false;
  var isDoctorEnable = false;

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<LocationProvider>(context, listen: false).getCountry();
    });
  }

  AppBar appBar = AppBar(
    title: AutoSizeText(Strings.appName),
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: CustomColors.blue, //or set color with: Color(0xFF0000FF)
    ));
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.bg_app,
        body: SingleChildScrollView(
          child: _buildWidget(context),
        ),
      ),
    );
  }

  _buildWidget(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Column(
      children: <Widget>[
        Consumer<UserProvider>(
          builder: (context, provider, widget) =>
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  userDetails(screenHeight, screenWidth, provider),
                  Positioned(
                    child: CustomTopBar(
                      context: context,
                      custonBackButton: false,
                      titleText: Strings.profile,
                    ),
                  ),
                  if (provider.isLoading)
                    Container(
                      height: CommonWidgets().getHeight(context),
                      color: Colors.black12,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                ],
              ),
        ),
        SizedBox(
          height: 10,
        ),
        SettingsButton(
            text: Strings.edit_profile,
            onpressed: () {
              Provider
                  .of<EnrollmentProviderUpdate>(context, listen: false)
                  .index = 0;
              CommonWidgets().navigateTO(
                context,
                pageName: EnrollmentDetailUpdate(),
              );
            }),

        // TODO uncomment with new payment gateway implementation
        // SettingsButton(
        //   text: Strings.transaction_history,
        //   onpressed: () => CommonWidgets().navigateTO(
        //     context,
        //     pageName: DoctorTransactions(),
        //   ),
        // ),
        SettingsButton(
          text: Strings.invitefriend,
          onpressed: () =>
              CommonWidgets().navigateTO(
                context,
                pageName: InviteAFriend(),
              ),
        ),
        SettingsButton(
          text: Strings.help,
          onpressed: () async {
            var url = Strings.helpUrl;
            {
              if (await canLaunch(url)) {
                await launch(
                  url,
                  forceSafariVC: false,
                  forceWebView: false,
                  // headers: <String, String>{
                  //   'my_header_key': 'my_header_value'
                  // },
                );
              } else {
                throw 'Could not launch $url';
              }
            }
          },
        ),
        SettingsButton(
            text: Strings.faqs,
            onpressed: () {
              CommonWidgets().navigateTO(context, pageName: Faqs());
            }),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }

  Positioned userDetails(double screenHeight, double screenWidth,
      UserProvider provider) {
    return Positioned(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 80, 0, 0),
        alignment: Alignment.bottomCenter,
        height: CommonWidgets().getHeight(context) * 0.3,
        width: screenWidth * .95,
        decoration: BoxDecoration(
            color: CustomColors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              userImage(provider),
              Flexible(
                child: Container(
                  margin: EdgeInsets.only(
                      left: screenWidth * .05, top: screenHeight * .01),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      name(provider),
                      SizedBox(height: 5),
                      email(provider),
                      SizedBox(height: 5),
                      profilePercentage(provider),
                      SizedBox(height: 5),
                      rating(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AutoSizeText name(UserProvider provider) {
    return AutoSizeText(
      provider.firstname != null || provider.lastname != null
          ? "Dr. ${provider.firstname} ${provider.lastname}"
          : "N.A.",
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(
        fontWeight: FontStyles.semiBoldFontWeight400,
        fontFamily: FontStyles.fontFamly,
        package: FontStyles.package,
        color: CustomColors.black1,
        fontStyle: FontStyle.normal,
      ),
      presetFontSizes: [19, 18, 17],
      textAlign: TextAlign.start,
    );
  }

  AutoSizeText profilePercentage(UserProvider provider) {
    return AutoSizeText.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Profile: ',
            style: TextStyle(
                fontWeight: FontStyles.regularFontWeight300,
                fontFamily: FontStyles.fontFamly,
                package: FontStyles.package,
                color: CustomColors.grey2,
                fontStyle: FontStyle.normal,
                fontSize: 11),
          ),
          TextSpan(
            text: provider?.completeness == null
                ? "N.A."
                : "${provider?.completeness}% Complete",
            style: TextStyle(
                fontWeight: FontStyles.semiBoldFontWeight500,
                fontFamily: FontStyles.fontFamly,
                package: FontStyles.package,
                color: provider.completeness == "100"
                    ? CustomColors.green
                    : CustomColors.yellow1,
                fontStyle: FontStyle.normal,
                fontSize: 11),
          ),
        ],
      ),
    );
  }

  AutoSizeText email(UserProvider provider) {
    return AutoSizeText(
      provider?.email ?? "N.A.",
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: TextStyle(
        fontWeight: FontStyles.regularFontWeight300,
        fontFamily: FontStyles.fontFamly,
        package: FontStyles.package,
        color: CustomColors.grey2,
        fontStyle: FontStyle.normal,
      ),
      presetFontSizes: [14, 12, 11],
      textAlign: TextAlign.left,
    );
  }

  Padding userImage(UserProvider provider) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: CommonWidgets.userImgeLoader(imageUrl: provider.profileImage),
    );
  }

  Widget rating() {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RatingFeedback(),
              ));
        },
        child: Row(
          children: [
            CustomText(
              text: Provider
                  .of<UserProvider>(context)
                  .rating
                  .toString(),
              color: CustomColors.grey2,
              fontSize: 16.0,
            ),
            SizedBox(
              width: 10,
            ),
            RatingBarIndicator(
              rating: Provider
                  .of<UserProvider>(context)
                  .rating,
              itemBuilder: (context, index) =>
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
              itemCount: 5,
              itemSize: 16.0,
              direction: Axis.horizontal,
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
