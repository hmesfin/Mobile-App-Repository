import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';
import 'package:virtudoc_app/utils/strings.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class SpecialityScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SpecialityScreen({Key key, @required this.scaffoldKey})
      : super(key: key);

  @override
  _SpecialityState createState() => _SpecialityState();
}

class _SpecialityState extends State<SpecialityScreen> {
  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<SpecialityProvider>(context, listen: false).getSpeciality();
    });

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: CustomColors.blue,
    ));
    return _buildWidget(context);
  }

  _buildWidget(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: <Widget>[
            specialityList(context),
            subspeciality(context),
            Consumer<SpecialityProvider>(
                builder: (context, specialityModel, child) =>
                    Consumer<EnrollmentProvider>(
                      builder: (context, value, child) =>
                          CustomButton(
                              margin: EdgeInsets.only(top: 15, bottom: 10),
                              ontap: () async {
                                if (EnrollmentProvider
                                    .specialityController.length <=
                                    0) {
                                  CommonWidgets.showToast(context,
                                      'Please add speciality',
                                      widget.scaffoldKey);
                                }
                                // else if (EnrollmentProvider
                                //     .subspecialityController.text.isEmpty) {
                                //   CommonWidgets.showToast(
                                //       context, 'Please add sub speciality');
                                // }
                                else {
                                  Provider.of<EnrollmentProvider>(context,
                                      listen: false)
                                      .nextPage();
                                }
                              },
                              buttonText: Strings.next.toUpperCase()),
                    ))
          ],
        ),
        Consumer<SpecialityProvider>(
            builder: (context, provider, child) =>
                Container(
                  height: CommonWidgets().getHeight(context) / 2,
                  child: Center(
                    child: provider.isLoading
                        ? CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          CustomColors.blue),
                    )
                        : Container(),
                  ),
                )),
      ],
    );
  }

  Padding subspeciality(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: FractionallySizedBox(
          widthFactor: 0.833,
          child: Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                border: Border.all(color: CustomColors.grey3, width: 1),
                color: CustomColors.white),
            child: Container(
                width: double.infinity,
                child: InkWell(
                  child: PopupMenuButton(
                    offset: Offset(0.1, 0),
                    onSelected: (subSpeciality) {
                      EnrollmentProvider.subspecialityController.text =
                          subSpeciality;
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 5, top: 2),
                      child: Focus(
                        child: TextFormField(
                          onTap: () {
                            screenTracker.stopTimer();
                            screenTracker.startTimer(context);
                          },
                          controller:
                          EnrollmentProvider.subspecialityController,
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: Strings.sub_speciality,
                            prefixIcon: SizedBox(
                              width: CommonWidgets().getWidth(context) / 200,
                            ),
                            suffixIcon: IconButton(
                              icon: ImageIcon(
                                AssetImage("assets/images/ic_drop_down1.png"),
                                color: CustomColors.grey2,
                              ),
                              onPressed: () {},
                            ),
                            border: InputBorder.none,
                          ),
                          maxLines: 1,
                        ),
                      ),
                    ),
                    itemBuilder: (context) =>
                        Strings.sepcialityList
                            .map((subSpeciality) =>
                            PopupMenuItem(
                                value: subSpeciality,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Text(subSpeciality),
                                )))
                            .toList(),
                  ),
                )),
          ),
        ));
  }

  Container specialityList(BuildContext context) {
    return Container(
      height: CommonWidgets().getHeight(context) * 0.55,
      child: Consumer<SpecialityProvider>(
          builder: (context, model, child) =>
              GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 2.0,
                padding: const EdgeInsets.all(2.0),
                mainAxisSpacing: 3.0,
                crossAxisSpacing: 3.0,
                children: List<Widget>.generate(model.allList.length, (index) {
                  var item = model.allList.elementAt(index);
                  return GridTile(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          if (EnrollmentProvider.specialityController
                              .contains(item.specialty_name)) {
                            EnrollmentProvider.specialityController
                                .remove(item.specialty_name);
                          } else {
                            EnrollmentProvider.specialityController
                                .add(item.specialty_name);
                          }

                          model.setSelected(
                              item?.selected = !(item?.selected ?? false),
                              index);
                        },
                        child: Center(
                          child: Stack(
                            children: [
                              Container(
                                child: Card(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Expanded(
                                          child: Padding(
                                            padding:
                                            EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            child: CustomText(
                                              maxLines: 2,
                                              text:
                                              item?.specialty_name
                                                  ?.toUpperCase() ??
                                                  '',
                                              color: (item?.selected ?? false)
                                                  ? CustomColors.white
                                                  : CustomColors.grey2,
                                              fontSize: 13.0,
                                            ),
                                          )),
                                    ],
                                  ),
                                  elevation: 3,
                                  color: (item?.selected ?? false)
                                      ? CustomColors.blue
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: BorderSide(
                                      color: (item?.selected ?? false)
                                          ? CustomColors.blue
                                          : Colors.white,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                height: 80.0,
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.45,
                              )
                            ],
                          ),
                        ),
                      ));
                }),
              )),
    );
  }
}
