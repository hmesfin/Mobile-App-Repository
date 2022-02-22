import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/patient/find-doctor/find-doctor.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/strings.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class SelectSpeciality extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SelectSpecialityState();
}

class _SelectSpecialityState extends State<SelectSpeciality> {
  var isPatientEnable = false;
  var isDoctorEnable = false;
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: CustomColors.blue, //or set color with: Color(0xFF0000FF)
    ));
    return SafeArea(
      child: Scaffold(
          backgroundColor: CustomColors.bg_app, body: _buildWidget(context)),
    );
  }

  _buildWidget(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: <Widget>[
            // Header
            CustomTopBar(
              context: context,
              titleText: Strings.select_speciality,
            ),
            SizedBox(
              height: 20,
            ),
            // upcoming appointment
            Consumer<SelectSpecialityProvider>(
                builder: (context, model, child) => Flexible(
                        child: GridView.count(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 1,
                      childAspectRatio: 5.0,
                      padding: const EdgeInsets.all(2.0),
                      mainAxisSpacing: 3.0,
                      crossAxisSpacing: 3.0,
                      children: List<Widget>.generate(
                          model.isPrimaryList.length, (index) {
                        var item = model.isPrimaryList.elementAt(index);
                        return GridTile(
                            child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            model.specialty_id = item.specialty_id;
                            model.speciality_name = item.specialty_name;
                            CommonWidgets()
                                .navigateTO(context, pageName: FindDoctor());
                          },
                          child: Center(
                            child: Stack(
                              children: [
                                Container(
                                  child: Card(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 20.0, right: 10),
                                          child: Image(
                                              color: CustomColors.blue,
                                              height: 50.0,
                                              width: 50.0,
                                              image: AssetImage(item?.image ??
                                                  "assets/images/neuro_care.png"),
                                              fit: BoxFit.contain),
                                        ),
                                        SizedBox(
                                            width: CommonWidgets()
                                                    .getWidth(context) *
                                                0.1),
                                        CustomText(
                                          maxLines: 1,
                                          text: item?.specialty_name
                                                  ?.toUpperCase() ??
                                              '',
                                          color: CustomColors.grey2,
                                          fontSize: 13.0,
                                        ),
                                      ],
                                    ),
                                    elevation: 3,
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                        color: Colors.white,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  height: 90.0,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                )
                              ],
                            ),
                          ),
                        ));
                      }),
                    ))),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.0, vertical: 10.0),
              child: specialityDropDown(context),
            )
          ],
        ),
        Consumer<SelectSpecialityProvider>(
            builder: (context, provider, child) => Center(
                  child: provider.isLoading
                      ? CircularProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation<Color>(
                              CustomColors.blue),
                        )
                      : Container(),
                )),
      ],
    );
  }

  Widget specialityDropDown(context) {
    return Consumer<SelectSpecialityProvider>(
      builder: (context, model, child) => model.isLoading
          ? Container()
          : CustomButton(
              width: CommonWidgets().getWidth(context) * 0.6,
              buttonText: Strings.selectOtherSpecialties.toUpperCase(),
              ontap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Stack(
                      children: [
                        listOfSpeciality(model),
                        crossButton(),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  Widget listOfSpeciality(SelectSpecialityProvider model) {
    return Container(
      height: double.infinity,
      width: 300.0,
      child: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: model.notPrimaryStringList.length,
          itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {});
                Navigator.pop(context);
                model.setSpecialityString(model.notPrimaryStringList[index],
                    success: () {
                  CommonWidgets().navigateTO(context, pageName: FindDoctor());
                }, failure: () {
                  CommonWidgets.showToast(
                      context, Strings.selectSpeciality, _scaffoldKey);
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  model.notPrimaryStringList[index],
                  textAlign: TextAlign.start,
                ),
              ))),
    );
  }

  Container crossButton() {
    return Container(
      alignment: Alignment(1, -1),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.cancel,
          color: Colors.red,
        ),
      ),
    );
  }
}
