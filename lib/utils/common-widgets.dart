import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:interval_time_picker/interval_time_picker.dart';
import 'package:jiffy/jiffy.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';

class CommonWidgets {
  double getHeight(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .height;
  }

  static Widget singleField({
    @required BuildContext context,
    String title,
    String subTitle,
    String activeOrders,
    String imageAssetAddress,
    @required void Function() ontap,
  }) {
    return GestureDetector(
      onTap: () {
        ontap();
        screenTracker.stopTimer();
        screenTracker.startTimer(context);
      },
      onDoubleTap: () {
        screenTracker.stopTimer();
        screenTracker.startTimer(context);
      },
      onVerticalDragStart: (dragDetails) {
        screenTracker.stopTimer();
        screenTracker.startTimer(context);
      },
      onHorizontalDragStart: (dragDetails) {
        screenTracker.stopTimer();
        screenTracker.startTimer(context);
      },
      child: Container(
        height: 80,
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: CustomColors.blue5, width: 1),
            boxShadow: [
              BoxShadow(
                  color: CustomColors.grey1,
                  offset: Offset(1.8369701987210297e-16, 3),
                  blurRadius: 7,
                  spreadRadius: 0)
            ],
            color: CustomColors.white),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Image(
                image: AssetImage(imageAssetAddress),
                fit: BoxFit.none,
                height: 100,
                width: 45,
              ),
            ),
            SizedBox(width: CommonWidgets().getWidth(context) * 0.08),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AutoSizeText(
                  title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    color: CustomColors.grey2,
                    fontWeight: FontStyles.semiBoldFontWeight500,
                    fontFamily: FontStyles.fontFamly,
                    package: FontStyles.package,
                    fontStyle: FontStyle.normal,
                  ),
                  presetFontSizes: [18, 16, 14],
                  textAlign: TextAlign.left,
                ),
                if (subTitle != null)
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: AutoSizeText(
                      subTitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        color: CustomColors.grey2,
                        fontWeight: FontStyles.semiBoldFontWeight500,
                        fontFamily: FontStyles.fontFamly,
                        package: FontStyles.package,
                        fontStyle: FontStyle.normal,
                      ),
                      presetFontSizes: [8, 8, 8],
                      textAlign: TextAlign.center,
                    ),
                  ),
                if (activeOrders != null)
                  AutoSizeText(activeOrders,
                      style: const TextStyle(
                          color: CustomColors.red,
                          fontWeight: FontStyles.boldFontWeight700,
                          fontFamily: FontStyles.fontFamly,
                          package: FontStyles.package,
                          fontStyle: FontStyle.normal,
                          fontSize: FontStyles.size13),
                      textAlign: TextAlign.center)
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget divider = Divider(
    thickness: 1,
    indent: 20,
    endIndent: 20,
    color: CustomColors.grey1,
  );

  double getWidth(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .width;
  }

  Image getImage(String name, {double height, double width, Color color}) {
    return Image.asset(
      "assets/images/$name",
      height: height ?? 20,
      width: width ?? 20,
      color: color ?? CustomColors.black1,
    );
  }

  navigateTO(BuildContext context, {@required Widget pageName}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => pageName),
    );
  }

  navigateReplacement(BuildContext context, {@required Widget pageName}) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => pageName),
    );
  }

  navigateBack(BuildContext context) {
    Navigator.pop(context);
  }

  static showToast(BuildContext context, String message,
      GlobalKey<ScaffoldState> scaffoldKey,
      {int duration}) {
    return scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: duration ?? 4),
    ));
  }

  static showLoadingDialog(BuildContext context, String message) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) =>
            AlertDialog(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularProgressIndicator(),
                  Text(
                    message,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontStyles.semiBoldFontWeight500),
                  )
                ],
              ),
            ));
  }

  static Container showLoader(BuildContext context) {
    return Container(
      height: CommonWidgets().getHeight(context),
      width: CommonWidgets().getWidth(context),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  static Container showError(BuildContext context, String message) {
    return Container(
      height: CommonWidgets().getHeight(context),
      width: CommonWidgets().getWidth(context),
      color: Colors.black12,
      child: Center(
          child: AlertDialog(
            title: Text(
              message,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          )),
    );
  }

  static Future<bool> isCurrentRouteFirst(BuildContext context) {
    var completer = new Completer<bool>();
    Navigator.popUntil(context, (route) {
      completer.complete(route.isFirst);
      return true;
    });
    return completer.future;
  }

  static Future<File> getPhoto(BuildContext context) async {
    final _picker = ImagePicker();
    File file;
    await showDialog(
        context: context,
        builder: (context) =>
            Center(
              child: AlertDialog(
                title: CustomText(
                  text: Strings.selectSource,
                ),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomButton(
                        margin: EdgeInsets.all(5),
                        ontap: () async {
                          final pickedFile = await _picker.getImage(
                              source: ImageSource.camera,
                              imageQuality: 50,
                              maxHeight: 480,
                              maxWidth: 640);
                          file = File(pickedFile.path);
                          Navigator.pop(context);
                        },
                        buttonText: Strings.camera),
                    CustomButton(
                        margin: EdgeInsets.all(10),
                        ontap: () async {
                          final pickedFile = await _picker.getImage(
                              source: ImageSource.gallery,
                              imageQuality: 50,
                              maxHeight: 480,
                              maxWidth: 640);
                          file = File(pickedFile.path);
                          Navigator.pop(context);
                        },
                        buttonText: Strings.gallery),
                  ],
                ),
              ),
            ));

    return file;
  }

  Container customTextFormField(BuildContext context, String hintText,
      {IconData iconData,
        double height,
        double width,
        EdgeInsets edgeInsets,
        bool readOnly,
        bool showCursor,
        int maxlines,
        List<TextInputFormatter> inputformatters,
        double radius,
        bool isEnable = true,
        TextEditingController controller,
        inputType,
        Function onChanged}) {
    return Container(
      margin: edgeInsets ?? EdgeInsets.only(top: 10, bottom: 5),
      padding: EdgeInsets.only(left: 15),
      height: height ?? CommonWidgets().getHeight(context) * 0.06,
      width: width ?? CommonWidgets().getWidth(context) * 0.65,
      decoration: BoxDecoration(
        border: Border.all(color: CustomColors.grey1),
        borderRadius: BorderRadius.circular(radius ?? 50),
        color: CustomColors.white,
      ),
      child: Center(
        child: Container(
          child: TextFormField(
            onChanged: onChanged,
            onTap: () {
              screenTracker.stopTimer();
              screenTracker.startTimer(context);
            },
            controller: controller,
            enabled: isEnable,
            inputFormatters: inputformatters ?? null,
            keyboardType: inputType,
            maxLines: maxlines ?? 1,
            readOnly: readOnly ?? true,
            showCursor: showCursor ?? false,
            decoration: InputDecoration(
              suffixIcon: iconData != null
                  ? Icon(
                iconData,
                color: CustomColors.grey2,
              )
                  : null,
              hintText: hintText,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  static String timeAgoSinceDate(String createdAt) {
    var dateM = DateFormat(Strings.dateFormatMM)
        .format(DateTime.parse(createdAt).toLocal());
    var dateY = DateFormat(Strings.dateFormatYY)
        .format(DateTime.parse(createdAt).toLocal());
    var dateD = DateFormat(Strings.dateFormatDD)
        .format(DateTime.parse(createdAt).toLocal());
    var dateHH = DateFormat(Strings.dateFormatHH)
        .format(DateTime.parse(createdAt).toLocal());
    var datemin = DateFormat(Strings.dateFormatmin)
        .format(DateTime.parse(createdAt).toLocal());
    var dateAA = DateFormat(Strings.dateFormataa)
        .format(DateTime.parse(createdAt).toLocal());
    return Jiffy("$dateM $dateD $dateY, $dateHH:$datemin $dateAA",
        "MMMM dd yyyy, h:mm a")
        .fromNow();
  }

  Widget indicatorCircle({int indicator, int currentIndex}) {
    Color textColor = CustomColors.black1;
    Color containerColor = CustomColors.grey1;
    return Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            color: currentIndex == indicator - 1 || indicator - 1 < currentIndex
                ? CustomColors.blue
                : containerColor,
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: CustomText(
                text: "$indicator",
                color: currentIndex == indicator - 1 ||
                    indicator - 1 < currentIndex
                    ? CustomColors.white
                    : textColor,
                fontSize: FontStyles.normal)));
  }

  Container topBar(BuildContext context, {int indicator, int currentIndex}) {
    return Container(
      width: CommonWidgets().getWidth(context) * 0.30,
      height: 6,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2.5)),
          color: currentIndex == indicator - 1 || indicator - 1 < currentIndex
              ? CustomColors.blue
              : CustomColors.grey1),
    );
  }

  Widget roundButton(text, context, {Function onTap}) {
    return SizedBox(
      width: 192,
      height: 46,
      child: RaisedButton(
          child: Text(text,
              style: const TextStyle(
                  color: CustomColors.white,
                  fontWeight: FontStyles.semiBoldFontWeight500,
                  fontFamily: "Roboto",
                  package: 'assets/fonts/Roboto-Medium',
                  fontStyle: FontStyle.normal,
                  fontSize: FontStyles.medium),
              textAlign: TextAlign.center),
          onPressed: () {
            onTap();
            screenTracker.stopTimer();
            screenTracker.startTimer(context);
          },
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
          color: CustomColors.yellow1),
    );
  }

  void navigateTo(context, page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  Widget customFormField(context, hint, textInputAction, onChanged,
      {inputType = TextInputType.text, inital, maxLength = 30}) =>
      Container(
        height: 50,
        padding: EdgeInsets.only(left: 15.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            border: Border.all(color: CustomColors.grey3, width: 1),
            color: CustomColors.white),
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(left: 5, right: 5),
            child: TextFormField(
              onTap: () {
                screenTracker.stopTimer();
                screenTracker.startTimer(context);
              },
              initialValue: inital ?? null,
              keyboardType: inputType,
              textInputAction: textInputAction ?? TextInputAction.done,
              maxLength: maxLength ?? 30,
              decoration: InputDecoration(
                counterText: '',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                hintText: hint,
                border: InputBorder.none,
              ),
              maxLines: 1,
              onChanged: onChanged,
            ),
          ),
        ),
      );

  Future showOkPopup(BuildContext context, String mainHeading,
      String subheading,
      {Function onTapp}) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) =>
            Builder(
                builder: (context) =>
                    Dialog(
                      backgroundColor: CustomColors.bg_app,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: WillPopScope(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Container(
                                margin: EdgeInsets.all(10),
                                width: 50,
                                height: 50,
                                child: Image.asset(
                                  'assets/images/ic_green_tick.png',
                                ),
                              ),
                            ),
                            CustomText(
                              text: mainHeading,
                              fontSize: 20,
                            ),
                            Container(
                              height: 50,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              margin: EdgeInsets.symmetric(vertical: 20),
                              child: CustomText(
                                text: subheading,
                                maxLines: 5,
                                color: CustomColors.black1,
                                fontWeight: FontStyles.semiBoldFontWeight400,
                                fontFamily: "Roboto",
                                fontSize: 16.0,
                              ),
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(8),
                                    bottomLeft: Radius.circular(8),
                                  )),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        onTapp();
                                        screenTracker.stopTimer();
                                        screenTracker.startTimer(context);
                                      },
                                      onDoubleTap: () {
                                        screenTracker.stopTimer();
                                        screenTracker.startTimer(context);
                                      },
                                      onVerticalDragStart: (dragDetails) {
                                        screenTracker.stopTimer();
                                        screenTracker.startTimer(context);
                                      },
                                      onHorizontalDragStart: (dragDetails) {
                                        screenTracker.stopTimer();
                                        screenTracker.startTimer(context);
                                      },
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                            color: CustomColors.yellow1,
                                            borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(8),
                                              bottomLeft: Radius.circular(8),
                                            )),
                                        child: Center(
                                          child: CustomText(
                                            text: Strings.ok,
                                            color: CustomColors.white,
                                            fontSize: 16,
                                            fontWeight:
                                            FontStyles.semiBoldFontWeight500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        onWillPop: () => Future.value(false),
                      ),
                    )));
  }

  internetCheck() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on Exception catch (_) {
      return false;
    }
  }

  Widget customFormFieldController(context, hint, textInputAction,
      {Function onChanged,
        inputType = TextInputType.text,
        controller,
        maxLines = 2,
        maxLenghth = 30,
        paddingLeft = 5.0,
        readOnly = false,
        inPutFormatters}) =>
      Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            border: Border.all(color: CustomColors.grey3, width: 1),
            color: CustomColors.white),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(left: paddingLeft, right: 5),
            child: TextFormField(
              onTap: () {
                screenTracker.stopTimer();
                screenTracker.startTimer(context);
              },
              readOnly: readOnly,
              controller: controller,
              inputFormatters: inPutFormatters ?? null,
              keyboardType: inputType,
              textInputAction: textInputAction ?? TextInputAction.done,
              maxLength: maxLenghth,
              decoration: InputDecoration(
                counterText: '',
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                hintText: hint,
                border: InputBorder.none,
              ),
              maxLines: maxLines,
              onChanged: onChanged,
            ),
          ),
        ),
      );

  static Widget hintText() {
    return Center(
      child: CustomText(
        text: '',
        fontSize: 15,
        color: CustomColors.grey2,
      ),
    );
  }

  static Container userImgeLoader({String imageUrl, double size}) {
    return Container(
      width: size ?? 80,
      height: size ?? 80,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: Border.all(color: CustomColors.blue3, width: 1),
          color: CustomColors.white),
      child: Container(
        width: 80,
        height: 80,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(80),
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: imageUrl ??
                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
            placeholder: (context, url) =>
            new Icon(
              Icons.person_rounded,
              color: Colors.grey,
              size: size ?? 80,
            ),
            errorWidget: (context, url, error) =>
            new Icon(
              Icons.person_rounded,
              color: Colors.grey,
              size: size ?? 80,
            ),
          ),
        ),
      ),
    );
  }

  static loadDocImage({String image, double size}) {
    return CachedNetworkImage(
      fit: BoxFit.fill,
      imageUrl: image ??
          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
      placeholder: (context, url) =>
      new Icon(
        Icons.book,
        color: Colors.grey,
        size: size ?? 80,
      ),
      errorWidget: (context, url, error) =>
      new Icon(
        Icons.book,
        color: Colors.grey,
        size: size ?? 80,
      ),
    );
  }

  static Column dropDownSelection({String value,
    Function(int) onchanged,
    bool status,
    BuildContext context}) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          alignment: Alignment.topLeft,
        ),
        dropDownDuration(
            context: context,
            onchanged: onchanged,
            value: value,
            status: status),
      ],
    );
  }

  static BoxDecoration boxDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(22)),
        border: Border.all(
          color: CustomColors.grey1,
          width: 1,
        ),
        color: CustomColors.white);
  }

  static dropDownDuration({BuildContext context,
    String value,
    Function(int) onchanged,
    bool status}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(top: status ? 20 : 1),
      width: CommonWidgets().getWidth(context) * 0.70,
      height: status ? 44 : 0,
      decoration: boxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          hintText(),
          CustomText(
            text: value,
            color: CustomColors.grey2,
            fontSize: 15,
          ),
          monthDropDown(onchanged: onchanged)
        ],
      ),
    );
  }

  static Widget monthDropDown({Function(int) onchanged}) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<int>(
        isDense: true,
        icon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/ic_drop_down_big.png",
            height: 8,
            width: 15,
            color: CustomColors.grey2,
          ),
        ),
        style: TextStyle(
          fontSize: 14,
          color: CustomColors.white,
        ),
        items: Strings.monthsFullList.map((int value) {
          return new DropdownMenuItem<int>(
            value: value,
            child: new CustomText(
              text: "$value",
              fontSize: 14,
            ),
          );
        }).toList(),
        onChanged: onchanged,
      ),
    );
  }

  Future<DateTime> datePicker(context, {onSelected}) =>
      DatePicker.showDatePicker(context,
          showTitleActions: true,
          minTime: DateTime(
              DateTime
                  .now()
                  .year, DateTime
              .now()
              .month, DateTime
              .now()
              .day),
          maxTime: DateTime(3050, 12, 29),
          theme: DatePickerTheme(
              headerColor: Colors.white,
              backgroundColor: Colors.white,
              itemStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              doneStyle: TextStyle(color: Colors.black, fontSize: 16)),
          onChanged: (date) {},
          onConfirm: (date) {
            FocusScope.of(context).requestFocus(FocusNode());
            onSelected(date.toUtc());
          },
          currentTime: DateTime.now(),
          locale: LocaleType.en);

  Future timePicker(context, {onSelected}) =>
      DatePicker.showTimePicker(context,
          showTitleActions: true,
          onChanged: (date) {},
          onConfirm: (date) {
            FocusScope.of(context).requestFocus(FocusNode());
            onSelected(DateFormat("HH:mm").format(date));
          },
          currentTime: DateTime.now(),
          showSecondsColumn: false);

  Future<TimeOfDay> slotTimePicker(context) =>
      showIntervalTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(DateTime(00, 00, 00)),
        interval: 15,
        visibleStep: VisibleStep.Fifths,
      );

  static showCustomDialog(BuildContext context, String title, String message,
      {Function onYes, IconData iconData, bool showButton = true}) {
    return showDialog(
      context: context,
      builder: (context) =>
          Builder(
            builder: (context) =>
                Dialog(
                  backgroundColor: CustomColors.bg_app,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      image(
                          icon: Icon(iconData, color: Colors.white),
                          color: CustomColors.green),
                      CustomText(text: title, fontSize: 20),
                      description(description: message),
                      if (showButton)
                        buttons(context,
                            leftButtontext: Strings.no,
                            ontap: onYes,
                            rightButtonText: Strings.yes)
                    ],
                  ),
                ),
          ),
    );
  }

  static showPaymentPopUp(BuildContext context, [ontap]) {
    showDialog(
      context: context,
      builder: (context) =>
          Builder(
            builder: (context) =>
                Dialog(
                  backgroundColor: CustomColors.bg_app,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      image(),
                      CustomText(
                        text: Strings.paymentRequest,
                        fontSize: 20,
                      ),
                      description(),
                      buttons(context, ontap: ontap)
                    ],
                  ),
                ),
          ),
    );
  }

  static Container buttons(BuildContext context, {
    Function ontap,
    String leftButtontext,
    String rightButtonText,
  }) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          )),
      child: Row(
        children: [
          CommonWidgets.bottomButton(
              context: context,
              color: CustomColors.grey2,
              onTap: () {
                Navigator.pop(context);
              },
              text: leftButtontext ?? Strings.reject),
          CommonWidgets.bottomButton(
              context: context,
              color: CustomColors.yellow1,
              onTap: ontap,
              text: rightButtonText ?? Strings.accept),
        ],
      ),
    );
  }

  static Container description({String description}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      child: description == null
          ? RichText(
        text: TextSpan(children: [
          TextSpan(
              style: TextStyle(
                  color: CustomColors.grey2,
                  fontWeight: FontStyles.semiBoldFontWeight400,
                  fontFamily: "Roboto",
                  fontStyle: FontStyle.normal,
                  fontSize: 16.0),
              text: Strings.dialogText1),
          TextSpan(
              style: TextStyle(
                  color: CustomColors.black1,
                  fontWeight: FontStyles.semiBoldFontWeight400,
                  fontFamily: "Roboto",
                  fontSize: 16.0),
              text: "\$69.50 "),
          TextSpan(
              style: const TextStyle(
                  color: CustomColors.grey2,
                  fontWeight: FontStyles.semiBoldFontWeight400,
                  fontFamily: "Roboto",
                  fontStyle: FontStyle.normal,
                  fontSize: 16.0),
              text: Strings.dialogText2)
        ]),
        textAlign: TextAlign.center,
      )
          : Center(
        child: CustomText(
            padding: EdgeInsets.symmetric(horizontal: 20),
            maxLines: 3,
            text: description,
            textAlign: TextAlign.center,
            color: CustomColors.grey2,
            fontWeight: FontStyles.semiBoldFontWeight400,
            fontSize: 16.0),
      ),
    );
  }

  static Container image({Icon icon, Color color}) {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.only(top: 40, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: color ?? CustomColors.greenDark,
      ),
      child: icon ??
          Container(
            margin: EdgeInsets.all(10),
            child: Image.asset(
              'assets/images/ic_dollar.png',
            ),
          ),
    );
  }

  static Widget bottomButton({
    BuildContext context,
    Color color,
    Function() onTap,
    String text,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onTap();
          screenTracker.stopTimer();
          screenTracker.startTimer(context);
        },
        onDoubleTap: () {
          screenTracker.stopTimer();
          screenTracker.startTimer(context);
        },
        onVerticalDragStart: (dragDetails) {
          screenTracker.stopTimer();
          screenTracker.startTimer(context);
        },
        onHorizontalDragStart: (dragDetails) {
          screenTracker.stopTimer();
          screenTracker.startTimer(context);
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                bottomRight: text == Strings.accept || text == Strings.yes
                    ? Radius.circular(8)
                    : Radius.circular(0),
                bottomLeft: text == Strings.reject || text == Strings.no
                    ? Radius.circular(8)
                    : Radius.circular(0),
              )),
          child: Center(
            child: CustomText(
              text: text,
              color: CustomColors.white,
              fontSize: 16,
              fontWeight: FontStyles.semiBoldFontWeight500,
            ),
          ),
        ),
      ),
    );
  }

  String utcTimeSTamp(date) => DateFormat(Strings.utcFormat).format(date) + "Z";
}
