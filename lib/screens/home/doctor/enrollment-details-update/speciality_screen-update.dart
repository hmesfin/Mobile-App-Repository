import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/doctor/enrollment-details-update/enrollment-provider-update.dart';
import 'package:virtudoc_app/screens/home/doctor/enrollment-details-update/speciality_provider-update.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';
import 'package:virtudoc_app/utils/strings.dart';

class SpecialityScreenUpdate extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SpecialityScreenUpdate({Key key, @required this.scaffoldKey})
      : super(key: key);

  @override
  _SpecialityState createState() => _SpecialityState();
}

class _SpecialityState extends State<SpecialityScreenUpdate> {
  List<String> speciality = [];

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<SpecialityProviderUpdate>(context, listen: false)
          .getSpeciality();
      if (Provider
          .of<UserProvider>(context, listen: false)
          .enrollmentInformation !=
          null) {
        speciality = Provider
            .of<UserProvider>(context, listen: false)
            .enrollmentInformation
            .speciality;
        EnrollmentProviderUpdate.specialityController =
            Provider
                .of<UserProvider>(context, listen: false)
                .enrollmentInformation
                .speciality;

        EnrollmentProviderUpdate.subspecialityController.text =
            Provider
                .of<UserProvider>(context, listen: false)
                .enrollmentInformation
                .subSpeciality;
      }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
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
            Consumer<SpecialityProviderUpdate>(
                builder: (context, specialityModel, child) =>
                    Consumer<EnrollmentProviderUpdate>(
                      builder: (context, value, child) =>
                          CustomButton(
                              margin: EdgeInsets.only(top: 15, bottom: 10),
                              ontap: () async {
                                EnrollmentProviderUpdate.specialityController =
                                    speciality;

                                if (EnrollmentProviderUpdate
                                    .specialityController.length <=
                                    0) {
                                  CommonWidgets.showToast(context,
                                      'Please add speciality',
                                      widget.scaffoldKey);
                                } else {
                                  PreferenceUtils.putInt(
                                      PreferenceKeys.INDICATOR, 2);

                                  Provider.of<EnrollmentProviderUpdate>(context,
                                      listen: false)
                                      .nextPage();
                                }
                              },
                              buttonText: Strings.next.toUpperCase()),
                    ))
          ],
        ),
        Consumer<SpecialityProviderUpdate>(
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
                      EnrollmentProviderUpdate.subspecialityController.text =
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
                          EnrollmentProviderUpdate.subspecialityController,
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
      child:
      Consumer<SpecialityProviderUpdate>(builder: (context, model, child) {
        return GridView.count(
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
                    if (speciality.contains(item.specialty_name)) {
                      speciality.remove(item.specialty_name);
                    } else {
                      speciality.add(item.specialty_name);
                    }

                    setState(() {});
                  },
                  child: Center(
                    child: Stack(
                      children: [
                        Container(
                          child: Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: CustomText(
                                        maxLines: 2,
                                        text: item?.specialty_name
                                            ?.toUpperCase() ?? '',
                                        color:
                                        (speciality.contains(
                                            item.specialty_name))
                                            ? CustomColors.white
                                            : CustomColors.grey2,
                                        fontSize: 13.0,
                                      ),
                                    )),
                              ],
                            ),
                            elevation: 3,
                            color: (speciality.contains(item.specialty_name))
                                ? CustomColors.blue
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(
                                color: (speciality.contains(
                                    item.specialty_name))
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
        );
      }),
    );
  }
}
