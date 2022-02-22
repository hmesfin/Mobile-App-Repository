import 'package:after_layout/after_layout.dart';
import 'package:bubble/bubble.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:virtudoc_app/screens/home/doctor/chat/SizeProviderWidget.dart';
import 'package:virtudoc_app/screens/home/doctor/chat/chat_top_bar.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';
import 'package:virtudoc_app/utils/strings.dart';

import '../../../../index.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class ChatDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> with AfterLayoutMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  AppBar appBar = AppBar(
    title: Text(Strings.appName),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Provider.of<ChatProvider>(context, listen: false).socketConfig(
        notConnected: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) =>
                  Builder(
                      builder: (context) =>
                          Dialog(
                              backgroundColor: CustomColors.bg_app,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: WillPopScope(
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      children: [
                                        Container(
                                            child: Container(
                                                margin: EdgeInsets.all(10),
                                                width: 50,
                                                height: 50,
                                                child: Icon(
                                                  Icons.warning,
                                                  color: Colors.yellow,
                                                  size: 50,
                                                ))),
                                        CustomText(text: "Error", fontSize: 20),
                                        Container(
                                            height: 50,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20),
                                            margin: EdgeInsets.symmetric(
                                                vertical: 20),
                                            child: CustomText(
                                                text:
                                                "Can not connect to the user. Please try again later!!",
                                                maxLines: 5,
                                                color: CustomColors.black1,
                                                fontWeight:
                                                FontStyles
                                                    .semiBoldFontWeight400,
                                                fontFamily: "Roboto",
                                                fontSize: 16.0)),
                                        Container(
                                            height: 50,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius: BorderRadius.only(
                                                    bottomRight: Radius
                                                        .circular(8),
                                                    bottomLeft: Radius.circular(
                                                        8))),
                                            child: Row(children: [
                                              Expanded(
                                                  child: GestureDetector(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .popUntil(
                                                                (route) =>
                                                            route.isFirst);
                                                        screenTracker
                                                            .stopTimer();
                                                        screenTracker
                                                            .startTimer(
                                                            context);
                                                      },
                                                      behavior: HitTestBehavior
                                                          .translucent,
                                                      onDoubleTap: () {
                                                        screenTracker
                                                            .stopTimer();
                                                        screenTracker
                                                            .startTimer(
                                                            context);
                                                      },
                                                      onVerticalDragStart: (
                                                          dragDetails) {
                                                        screenTracker
                                                            .stopTimer();
                                                        screenTracker
                                                            .startTimer(
                                                            context);
                                                      },
                                                      onHorizontalDragStart: (
                                                          dragDetails) {
                                                        screenTracker
                                                            .stopTimer();
                                                        screenTracker
                                                            .startTimer(
                                                            context);
                                                      },
                                                      child: Container(
                                                          height: 50,
                                                          decoration: BoxDecoration(
                                                              color: CustomColors
                                                                  .yellow1,
                                                              borderRadius:
                                                              BorderRadius.only(
                                                                  bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                      8),
                                                                  bottomLeft:
                                                                  Radius
                                                                      .circular(
                                                                      8))),
                                                          child: Center(
                                                              child: CustomText(
                                                                  text: Strings
                                                                      .ok,
                                                                  color: CustomColors
                                                                      .white,
                                                                  fontSize: 16,
                                                                  fontWeight: FontStyles
                                                                      .semiBoldFontWeight500)))))
                                            ]))
                                      ]),
                                  onWillPop: () => Future.value(false)))));
        });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: CustomColors.blue,
    ));

    return WillPopScope(
        child: SafeArea(
            child: Scaffold(
                key: scaffoldKey,
                backgroundColor: CustomColors.bg_app,
                body: _buildWidget(context))),
        onWillPop: _willPopScope);
  }

  Future<bool> _willPopScope() async {
    await Provider.of<ChatProvider>(context, listen: false).disconnect();
    return Future.value(true);
  }

  _buildWidget(BuildContext context) {
    double appbarheight = appBar.preferredSize.height;
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height - appbarheight;
    return Consumer<ChatProvider>(builder: (context, model, child) {
      return ModalProgressHUD(
          inAsyncCall: model.isLoading,
          opacity: 0.3,
          child: Stack(children: [
            SizeProviderWidget(
              child: Align(
                  alignment: Alignment.topCenter,
                  child: ChatCustomTopBar(
                    context: context,
                    titleText: '${model.otherUsername}',
                    backPress: () async {
                      await Provider.of<ChatProvider>(context, listen: false)
                          .disconnect();

                      await PreferenceUtils.putBool(
                          PreferenceKeys.IS_CHATTING, false);
                      Navigator.pop(context);
                    },
                  )),
              onChildSize: (size) {
                model.setSize(size.height / 6);
              },
            ),
            Container(
              child: Column(
                children: [
                  Expanded(
                      flex: 8,
                      child: Column(
                        children: <Widget>[
                          Expanded(
                              child: Consumer<ChatProvider>(
                                  builder: (context, model, child) =>
                                      ListView.builder(
                                          shrinkWrap: true,
                                          reverse: true,
                                          physics: BouncingScrollPhysics(),
                                          scrollDirection: Axis.vertical,
                                          itemBuilder: (context, index) {
                                            var item =
                                            model.chatList.elementAt(index);
                                            if (item?.timestamp == null) {
                                              return Container();
                                            }
                                            final df = new DateFormat(
                                                'dd,MMM hh:mm a');
                                            var timeS = df
                                                .format(new DateTime
                                                .fromMillisecondsSinceEpoch(
                                                item?.timestamp * 1000)
                                                .toLocal())
                                                .toString();
                                            if ((item?.text ?? "")
                                                .replaceAll(' ', '')
                                                .contains("${model
                                                ?.otherUsername} has joined the chat"
                                                .replaceAll(' ', '')) ||
                                                (item?.text ?? "")
                                                    .replaceAll(' ', '')
                                                    .contains("${model
                                                    ?.otherUsername} has left the chat"
                                                    .replaceAll(' ', '')) ||
                                                (item?.text ?? "")
                                                    .replaceAll(' ', '')
                                                    .contains("${model
                                                    ?.username} has joined the chat"
                                                    .replaceAll(' ', '')) ||
                                                (item?.text ?? "")
                                                    .replaceAll(' ', '')
                                                    .contains("${model
                                                    ?.username} has left the chat"
                                                    .replaceAll(' ', '')) ||
                                                (item?.text ?? "")
                                                    .replaceAll(' ', '')
                                                    .contains("Welcome ${model
                                                    ?.otherUsername}"
                                                    .replaceAll(' ', '')) ||
                                                (item?.text ?? "").replaceAll(
                                                    ' ', '').contains(
                                                    "Welcome ${model?.username}"
                                                        .replaceAll(' ', '')))
                                              return Container();
                                            else if (item?.self ?? false)
                                              return Container(
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                      children: [
                                                        Bubble(
                                                            margin:
                                                            BubbleEdges.only(
                                                                top: 10),
                                                            alignment: Alignment
                                                                .topCenter,
                                                            padding: BubbleEdges
                                                                .fromLTRB(
                                                                screenWidth *
                                                                    .06,
                                                                screenHeight *
                                                                    .020,
                                                                screenWidth *
                                                                    .06,
                                                                screenHeight *
                                                                    .020),
                                                            stick: true,
                                                            nip: BubbleNip
                                                                .rightTop,
                                                            color: CustomColors
                                                                .blue,
                                                            child: Container(
                                                                child: ConstrainedBox(
                                                                    constraints: BoxConstraints(
                                                                        minWidth: screenWidth *
                                                                            .5,
                                                                        maxWidth: screenWidth *
                                                                            .5),
                                                                    child: AutoSizeText(
                                                                        item
                                                                            .text ??
                                                                            "N/A",
                                                                        maxLines:
                                                                        9,
                                                                        style: TextStyle(
                                                                            fontSize: 15.0,
                                                                            color: CustomColors
                                                                                .white))))),
                                                        Container(
                                                          width: 50,
                                                          height: 50,
                                                          margin:
                                                          EdgeInsets.only(
                                                              right: 10,
                                                              top: 5,
                                                              left: 10),
                                                          decoration:
                                                          BoxDecoration(
                                                            shape:
                                                            BoxShape.circle,
                                                            color: CustomColors
                                                                .white,
                                                          ),
                                                          child: userImgeLoader(
                                                              imageUrl:
                                                              item?.userpic,
                                                              size: 60),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left:
                                                          screenWidth * .4,
                                                          top: 8),
                                                      child: AutoSizeText(
                                                        timeS ?? "N/A",
                                                        style: TextStyle(
                                                            color: CustomColors
                                                                .grey2),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            else
                                              return Container(
                                                  child: Column(children: [
                                                    Row(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                              width: 50,
                                                              height: 50,
                                                              margin:
                                                              EdgeInsets.only(
                                                                  right: 10,
                                                                  top: 5,
                                                                  left: 10),
                                                              decoration: BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color:
                                                                  CustomColors
                                                                      .white),
                                                              child: userImgeLoader(
                                                                  imageUrl:
                                                                  item?.userpic,
                                                                  size: 60)),
                                                          Bubble(
                                                              margin:
                                                              BubbleEdges.only(
                                                                  top: 10),
                                                              alignment: Alignment
                                                                  .topCenter,
                                                              padding: BubbleEdges
                                                                  .fromLTRB(
                                                                  screenWidth *
                                                                      .06,
                                                                  screenHeight *
                                                                      .020,
                                                                  screenWidth *
                                                                      .06,
                                                                  screenHeight *
                                                                      .020),
                                                              stick: true,
                                                              nip:
                                                              BubbleNip.leftTop,
                                                              color: CustomColors
                                                                  .white,
                                                              child: Container(
                                                                  child: ConstrainedBox(
                                                                      constraints: BoxConstraints(
                                                                          minWidth:
                                                                          screenWidth *
                                                                              .5,
                                                                          maxWidth:
                                                                          screenWidth *
                                                                              .5),
                                                                      child: AutoSizeText(
                                                                          item
                                                                              .text ??
                                                                              "N/A",
                                                                          maxLines:
                                                                          9,
                                                                          style:
                                                                          TextStyle(
                                                                              fontSize: 15.0)))))
                                                        ]),
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            right: screenWidth *
                                                                .4,
                                                            top: 8),
                                                        child: AutoSizeText(
                                                            timeS ?? "N/A",
                                                            style: TextStyle(
                                                                color: CustomColors
                                                                    .grey2)))
                                                  ]));
                                          },
                                          itemCount: model.chatList.length))),
                          SizedBox(height: 10),
                          Container(
                              color: CustomColors.white,
                              padding: EdgeInsets.only(top: 12.0, bottom: 20.0),
                              child: Consumer<ChatProvider>(
                                  builder: (context, model, child) =>
                                      Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Expanded(
                                                child: Row(children: <Widget>[
                                                  SizedBox(width: 10),
                                                  Expanded(
                                                      child: TextField(
                                                          maxLengthEnforced: true,
                                                          controller: model
                                                              .messageController,
                                                          onChanged: (string) {
                                                            //checkling the legnth
                                                            if (string.length >
                                                                255) {
                                                              //setting the string value by substring
                                                              model
                                                                  .messageController
                                                                  .text =
                                                                  model
                                                                      .messageController
                                                                      .text
                                                                      .substring(
                                                                      0, 255);

                                                              //setting the cursor position
                                                              model
                                                                  .messageController
                                                                  .selection =
                                                                  TextSelection
                                                                      .fromPosition(
                                                                      TextPosition(
                                                                          offset: model
                                                                              .messageController
                                                                              .text
                                                                              .length));
                                                            }
                                                          },
                                                          style: TextStyle(
                                                              fontFamily:
                                                              'SourceSansPro',
                                                              color: CustomColors
                                                                  .black1),
                                                          keyboardType:
                                                          TextInputType.text,
                                                          cursorColor: Colors
                                                              .grey,
                                                          decoration: InputDecoration(
                                                              hintText:
                                                              'Type a message...',
                                                              hintStyle: TextStyle(
                                                                  fontFamily:
                                                                  'SourceSansPro',
                                                                  color:
                                                                  Colors.grey),
                                                              border: OutlineInputBorder(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      5),
                                                                  borderSide: BorderSide(
                                                                      color:
                                                                      CustomColors
                                                                          .grey1,
                                                                      width: 0,
                                                                      style:
                                                                      BorderStyle
                                                                          .none)),
                                                              contentPadding:
                                                              EdgeInsets.only(
                                                                  bottom: 16,
                                                                  left: 8,
                                                                  right: 8),
                                                              fillColor:
                                                              CustomColors
                                                                  .white))),
                                                  SizedBox(width: 10),
                                                  Container(
                                                      width: 45.0,
                                                      height: 45.0,
                                                      decoration: BoxDecoration(
                                                          shape: BoxShape
                                                              .circle,
                                                          color:
                                                          CustomColors.yellow1),
                                                      child: Center(
                                                          child: GestureDetector(
                                                              onTap: () async {
                                                                FocusScope.of(
                                                                    context)
                                                                    .requestFocus(
                                                                    FocusNode());

                                                                model
                                                                    .sendMessage();

                                                                screenTracker
                                                                    .stopTimer();
                                                                screenTracker
                                                                    .startTimer(
                                                                    context);
                                                              },
                                                              onDoubleTap: () {
                                                                screenTracker
                                                                    .stopTimer();
                                                                screenTracker
                                                                    .startTimer(
                                                                    context);
                                                              },
                                                              onVerticalDragStart:
                                                                  (
                                                                  dragDetails) {
                                                                screenTracker
                                                                    .stopTimer();
                                                                screenTracker
                                                                    .startTimer(
                                                                    context);
                                                              },
                                                              onHorizontalDragStart:
                                                                  (
                                                                  dragDetails) {
                                                                screenTracker
                                                                    .stopTimer();
                                                                screenTracker
                                                                    .startTimer(
                                                                    context);
                                                              },
                                                              child: Icon(
                                                                  Icons.send,
                                                                  color:
                                                                  CustomColors
                                                                      .white),
                                                              behavior:
                                                              HitTestBehavior
                                                                  .opaque))),
                                                  SizedBox(width: 10)
                                                ]))
                                          ])))
                        ],
                      ))
                ],
              ),
              margin: EdgeInsets.only(top: model.size),
            ),
          ]));
    });
  }

  Widget userImgeLoader({String imageUrl, double size}) {
    return Container(
        alignment: Alignment.center,
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
                    imageUrl: imageUrl ?? "",
                    errorWidget: (context, url, error) =>
                        Container(
                            child: Icon(Icons.person_rounded,
                                color: Colors.grey, size: 40))))));
  }
}
