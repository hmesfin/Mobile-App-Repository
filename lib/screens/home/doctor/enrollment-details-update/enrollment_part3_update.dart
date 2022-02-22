import 'package:flutter/material.dart';
import 'package:virtudoc_app/custom-widgets/custom_button.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/doctor/bottom-navbar.dart';
import 'package:virtudoc_app/screens/home/doctor/enrollment-details-update/enrollment-provider-update.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/utils/styles.dart';

class EnrollMent3Update extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const EnrollMent3Update({Key key, @required this.scaffoldKey})
      : super(key: key);

  @override
  _EnrollMent3State createState() => _EnrollMent3State();
}

class _EnrollMent3State extends State<EnrollMent3Update> {
  File medicalSchoolImage,
      resicencyInfoImage,
      specialityImage,
      subspecialityImage;

  String medicalSchoolImageup,
      resicencyInfoImageup,
      specialityImageup,
      subspecialityImageup;

  EnrollStepModel3 enrollmentData;

  @override
  void initState() {
    super.initState();

    medicalSchoolImageup = Provider
        .of<UserProvider>(context, listen: false)
        ?.documents
        ?.medicalSchoolDegreeDoc ??
        '';
    resicencyInfoImageup = Provider
        .of<UserProvider>(context, listen: false)
        ?.documents
        ?.residencyDoc ??
        '';
    specialityImageup = Provider
        .of<UserProvider>(context, listen: false)
        ?.documents
        ?.specialityDoc ??
        '';
    subspecialityImageup = Provider
        .of<UserProvider>(context, listen: false)
        ?.documents
        ?.subspecialityDoc ??
        '';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: <Widget>[
              uploadRequiredDocument(),
              SizedBox(height: 20),

              // medical school degree
              commonDocWidget(
                title: Strings.medicalSchoolDegree,
                ontap: () async {
                  medicalSchoolImage = await CommonWidgets.getPhoto(context);
                  setState(() {});
                },
                child: medicalSchoolImage != null
                    ? Image.file(
                  medicalSchoolImage,
                  fit: BoxFit.fill,
                )
                    : CommonWidgets.loadDocImage(image: medicalSchoolImageup),
              ),

              // residency info
              commonDocWidget(
                title: Strings.residency,
                ontap: () async {
                  resicencyInfoImage = await CommonWidgets.getPhoto(context);
                  setState(() {});
                },
                child: resicencyInfoImage != null
                    ? Image.file(
                  resicencyInfoImage,
                  fit: BoxFit.fill,
                )
                    : CommonWidgets.loadDocImage(image: resicencyInfoImageup),
              ),

              // speciality info
              commonDocWidget(
                title: Strings.speciality,
                ontap: () async {
                  specialityImage = await CommonWidgets.getPhoto(context);
                  setState(() {});
                },
                child: specialityImage != null
                    ? Image.file(
                  specialityImage,
                  fit: BoxFit.fill,
                )
                    : CommonWidgets.loadDocImage(image: specialityImageup),
              ),

              // subspeciality
              commonDocWidget(
                title: Strings.subSpeciality,
                ontap: () async {
                  subspecialityImage = await CommonWidgets.getPhoto(context);
                  setState(() {});
                },
                child: subspecialityImage != null
                    ? Image.file(
                  subspecialityImage,
                  fit: BoxFit.fill,
                )
                    : CommonWidgets.loadDocImage(image: subspecialityImageup),
              ),
              Consumer<EnrollmentProviderUpdate>(
                builder: (context, value, child) =>
                    CustomButton(
                        ontap: value.isSavePressed
                            ? null
                            : () async {
                          Map<String, String> filepaths = Map();
                          if (medicalSchoolImage == null &&
                              medicalSchoolImageup.isEmpty) {
                            CommonWidgets.showToast(
                                context,
                                Strings.pleaseAddMedicalSchool,
                                widget.scaffoldKey);
                          } else if (resicencyInfoImage == null &&
                              resicencyInfoImageup.isEmpty) {
                            CommonWidgets.showToast(
                                context,
                                Strings.pleaseAddResidency,
                                widget.scaffoldKey);
                          } else if (specialityImage == null &&
                              specialityImageup.isEmpty) {
                            CommonWidgets.showToast(
                                context,
                                Strings.pleaseAddSpeciality,
                                widget.scaffoldKey);
                          } else if (subspecialityImage == null &&
                              subspecialityImageup.isEmpty) {
                            CommonWidgets.showToast(
                                context,
                                Strings.pleaseAddSubSpeciality,
                                widget.scaffoldKey);
                          } else {
                            if (medicalSchoolImage != null)
                              filepaths[Strings.medicalSchoolDoc] =
                                  medicalSchoolImage.path;
                            if (resicencyInfoImage != null)
                              filepaths[Strings.residencyDoc] =
                                  resicencyInfoImage.path;
                            if (specialityImage != null)
                              filepaths[Strings.specialityDoc] =
                                  specialityImage.path;
                            if (subspecialityImage != null)
                              filepaths[Strings.subspecialityDoc] =
                                  subspecialityImage.path;

                            value.isPressed(true);
                            var responseImage = await EnrollmentProviderUpdate
                                .uploadMultiImage(filepaths)
                                .catchError((onError) {
                              CommonWidgets.showToast(
                                  context,
                                  Strings.errorUploadingImages,
                                  widget.scaffoldKey);
                            });
                            value.isPressed(false);
                            if (responseImage != null) {
                              if (responseImage.success) {
                                enrollmentData = EnrollStepModel3(
                                  action: Strings.actionEnroll3,
                                  enrollmentStep3: EnrollmentStep3(
                                    undergraduateDegreeDoc: '',
                                    medicalSchoolDegreeDoc: responseImage
                                        .body['data']
                                    ['medical_school_degree_doc'] ??
                                        medicalSchoolImageup,
                                    digitalSignatureDoc: '',
                                    fellowshipDoc: '',
                                    nationalLicenseDoc: '',
                                    specialityDoc: responseImage.body['data']
                                    [Strings.specialityDoc] ??
                                        specialityImageup,
                                    subspecialityDoc:
                                    responseImage.body['data']
                                    [Strings.subspecialityDoc] ??
                                        subspecialityImageup,
                                    residencyDoc: responseImage.body['data']
                                    ['residency_doc'] ??
                                        resicencyInfoImageup,
                                  ),
                                );

                                var responseuser =
                                await EnrollmentProviderUpdate
                                    .updateUserDetail3(enrollmentData);

                                if (responseuser.success) {
                                  PreferenceUtils.putBool(
                                      PreferenceKeys.IS_LOGIN, true);

                                  PreferenceUtils.putString(
                                      PreferenceKeys.ROLE,
                                      Strings.doctor.toUpperCase());
                                  CommonWidgets.showToast(
                                      context,
                                      responseuser.message,
                                      widget.scaffoldKey);
                                  await Future.delayed(
                                      Duration(milliseconds: 500));
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BottomNavbar()),
                                          (route) => false);
                                } else {
                                  CommonWidgets.showToast(
                                      context,
                                      responseuser.message,
                                      widget.scaffoldKey);
                                }
                              } else {
                                CommonWidgets.showToast(
                                    context,
                                    responseImage.message,
                                    widget.scaffoldKey);
                              }
                            } else {
                              CommonWidgets.showToast(context,
                                  Strings.noResponse, widget.scaffoldKey);
                            }
                          }
                        },
                        buttonText: Strings.done.toUpperCase()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding commonDocWidget({
    String title,
    Widget child,
    void Function() ontap,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 15,
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10, top: 10),
            child: FractionallySizedBox(
              widthFactor: 0.833,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: FontStyles.medium,
                ),
              ),
            ),
          ),
          FractionallySizedBox(
            widthFactor: 0.833,
            child: // Group 4 copy
            GestureDetector(
              onTap: () {
                ontap();
                screenTracker.stopTimer();
                screenTracker.startTimer(context);
              },
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                    color: CustomColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Center(child: child),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container uploadRequiredDocument() {
    return Container(
      alignment: Alignment.topCenter,
      child: Text(
        'Upload required documents',
        style: TextStyle(
          fontSize: FontStyles.medium,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Future<Response> getUser() async {
    return await ApiRequest.getApi(ApiUrl.getUser);
  }
}
