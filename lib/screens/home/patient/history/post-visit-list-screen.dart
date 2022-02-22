import 'package:flutter/gestures.dart';
import 'package:flutter/scheduler.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/patient/history/history-provider.dart';
import 'package:virtudoc_app/screens/home/patient/history/post-visit-details-screen.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';

/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/
class PostVisitListScreen extends StatefulWidget {
  PostVisitListScreen({Key key}) : super(key: key);

  @override
  _PostVisitListScreenState createState() => _PostVisitListScreenState();
}

class _PostVisitListScreenState extends State<PostVisitListScreen> {
  var controller = ScrollController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<PostVisitListProvider>(context, listen: false)
          .getFeedbackList(
          Provider
              .of<PlaceOrderProvider>(context, listen: false)
              .patientId,
          Provider
              .of<PostVisitListProvider>(context, listen: false)
              .page);
    });

    controller.addListener(() {
      if (controller.position.pixels >
          controller.position.maxScrollExtent + 150) {
        Provider
            .of<PostVisitListProvider>(context, listen: false)
            .page++;
        Provider.of<PostVisitListProvider>(context, listen: false)
            .getFeedbackList(
            Provider
                .of<PlaceOrderProvider>(context, listen: false)
                .patientId,
            Provider
                .of<PostVisitListProvider>(context, listen: false)
                .page);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.bg_app,
        body: _buildWidget(context),
      ),
    );
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
    return Column(
      children: <Widget>[
        CustomTopBar(
          context: context,
          titleText: Strings.pastVisitList,
        ),
        Expanded(
          child: Consumer<PostVisitListProvider>(
            builder: (context, feedback, _) =>
            feedback.isLoading
                ? CommonWidgets.showLoader(context)
                : feedback.list.isEmpty
                ? Container(
              margin: EdgeInsets.only(
                  top: CommonWidgets().getHeight(context) * 0.3),
              child: Text(Strings.novisitforms),
            )
                : Container(
              margin: EdgeInsets.only(
                top: 20,
                left: 10,
                right: 10,
              ),
              child: ListView.builder(
                  controller: controller,
                  physics: BouncingScrollPhysics(),
                  itemCount: feedback.list.length,
                  itemBuilder: (context, index) =>
                      patientList(
                          context,
                          index,
                          screenHeight,
                          screenWidth,
                          feedback)),
            ),
          ),
        )
      ],
    );
  }

  Widget patientList(BuildContext context,
      int index,
      double screenHeight,
      double screenWidth,
      PostVisitListProvider postVisitListProvider,) {
    return patientCard(index, screenWidth, screenHeight, postVisitListProvider);
  }

  Container patientCard(int index,
      double screenWidth,
      double screenHeight,
      PostVisitListProvider postVisitListProvider,) {
    return Container(
      child: GestureDetector(
        onTap: () {
          screenTracker.stopTimer();
          screenTracker.startTimer(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PostVisitDetailsScreen(
                        postVisitListProvider.list[index].postVisitId),
              ));
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          width: 355,
          decoration: docCardDecoration(),
          child: Column(
            children: [
              topDocCard(
                index,
                screenWidth,
                postVisitListProvider,
              ),
              SizedBox(
                height: 16,
              ),
              bottomDocCard(
                index,
                screenWidth,
                postVisitListProvider,
              ),
            ],
          ),
        ),
      ),
    );
  }

  bottomDocCard(index,
      screenWidth,
      PostVisitListProvider postVisitListProvider,) {
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // docLocation(index),
          CustomText(
            maxLines: 2,
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            text:
            "${Strings.historyofPresentillness}: ${postVisitListProvider
                .list[index].historyAndPhysicalExamination
                .historyOfPresentIllness}",
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
          ),

          SizedBox(
            height: 13,
          ),
          CustomText(
            maxLines: 2,
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            text:
            "${Strings.hospitalizationHistory}: ${postVisitListProvider
                .list[index].historyAndPhysicalExamination
                .hospitalizationHistory}",
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
          ),
          SizedBox(
            height: 13,
          ),

          CustomText(
            maxLines: 2,
            textAlign: TextAlign.justify,
            overflow: TextOverflow.ellipsis,
            text:
            "${Strings.pastSurgicalHistory}: ${postVisitListProvider.list[index]
                .historyAndPhysicalExamination.pastSurgicalHistory}",
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
          ),
          // docTime(index),
        ],
      ),
    );
  }

  BoxDecoration docCardDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
              color: CustomColors.grey1,
              offset: Offset(1.8369701987210297e-16, 3),
              blurRadius: 7,
              spreadRadius: 0)
        ],
        color: Color(0xffffffff));
  }

  Row topDocCard(int index,
      screenwidth,
      PostVisitListProvider postVisitListProvider,) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10),
          child: Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            width: screenwidth * .60,
            height: 55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  // text: docModelList[index].name,
                  text: "${postVisitListProvider.list[index].name}",
                  // color: CustomColors.grey2,
                  fontSize: 17.0,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  // text: docModelList[index].name,
                  text:
                  "${postVisitListProvider.list[index]
                      .gender} ${postVisitListProvider.list[index]
                      .age} ${Strings.years.toLowerCase()} ${Strings.old
                      .toLowerCase()}",
                  color: CustomColors.grey2,
                  fontSize: 14.0,
                ),

                // CustomText(
                //   text: "${docModelList[index].exp} ${Strings.yearsExperience}",
                //   color: CustomColors.grey2,
                //   fontSize: 16.0,
                // ),
              ],
            ),
          ),
          // !widget.is_patient
          //     ? CommonWidgets.userImgeLoader(
          //         imageUrl: appointmentList[index].patientPic)
          //     : CommonWidgets.userImgeLoader(
          //         imageUrl: appointmentList[index].drPic),
        ),
        // docNameAndExp(index, screenwidth),
      ],
    );
  }
}
