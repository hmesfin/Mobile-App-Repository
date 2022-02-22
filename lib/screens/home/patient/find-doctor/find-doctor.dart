import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:virtudoc_app/custom-widgets/custom-button.dart';
import 'package:virtudoc_app/custom-widgets/custom-text.dart';
import 'package:virtudoc_app/custom-widgets/modal-option-select.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/patient/find-doctor/filter.model.dart';
import 'package:virtudoc_app/screens/home/patient/find-doctor/models/doctor-model.dart';
import 'package:virtudoc_app/screens/home/patient/find-doctor/time-slot/time_slot.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/screen_tracker/screen_tracker.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/utils/styles.dart';

import '../../../../index.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class FindDoctor extends StatefulWidget {
  @override
  _FindDoctorState createState() => _FindDoctorState();
}

class _FindDoctorState extends State<FindDoctor> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  AppBar appBar = AppBar();
  String currenLocation = Strings.locationList[0];
  String modalSelected = Strings.experience;
  Map<String, bool> values = {
    Strings.year_0_5: false,
    Strings.year_5_10: false,
    Strings.year_10_15: false,
    Strings.year_15_20: false,
    Strings.year20: false,
  };
  Map<String, bool> speciality = {
    Strings.dental_care: false,
    Strings.ent_care: false,
    Strings.eye_care: false,
    Strings.child_care: false,
    Strings.ortho_care: false,
    Strings.neuro_care: false,
    Strings.skin_care: false,
    Strings.women_care: false,
    Strings.general_care: false,
    Strings.sex_care: false,
  };
  Map<String, bool> gender = {
    Strings.female: false,
    Strings.male: false,
  };
  Map<String, bool> language = {
    Strings.rating_0_1: false,
    Strings.rating_1_2: false,
    Strings.rating_2_3: false,
    Strings.rating_3_4: false,
    Strings.rating_4_5: false,
  };

  List<String> modalStrings = [
    Strings.speciality,
    Strings.rating,
    Strings.sex,
  ];

  List<DoctorModel> docModelList = [];
  int page = 1;
  int pageSize = 10;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() async {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels == 0) {} else {
          try {
            setState(() {
              _saving = true;
            });
            is_fetched = false;
            page = page + 1;

            url = url.replaceAll("&page=${page - 1}", "&page=$page");

            if (!url.contains('page')) {
              url = url + '&page=$page&page_size=$pageSize';
            }
            var response = await ApiRequest.getApi(url);

            Map decoded = jsonDecode(response.body);

            decoded['body']['data']['rows'].forEach((element) {
              docModelList.add(
                DoctorModel(
                    degree: element['user_profile']['enrollment_information']['post_grad'] ??
                        "",
                    user_id: (element['user_id'] ?? '1').toString(),
                    name: (element['first_name'] + ' ' ?? 'N.A') +
                        (element['last_name'] ?? 'N.A'),
                    type1: element['user_profile']['enrollment_information']
                    ['sub_speciality'] is String
                        ? element['user_profile']['enrollment_information']
                    ['sub_speciality']
                        : '',
                    exp: element['user_profile']['enrollment_information']
                    ['years_of_experience'] is int
                        ? element['user_profile']['enrollment_information']
                    ['years_of_experience']
                        : 0,
                    type2: element['user_profile']['enrollment_information']['speciality'] is List
                        ? element['user_profile']['enrollment_information']
                    ['speciality']
                        : ['N.A.'],
                    fee: element['consultation_fee'] ?? 0,
                    location: element['user_profile']['address'] != null
                        ? "${element['user_profile']['address']['region'] ==
                        null ? '' : element['user_profile']['address']['region']
                        .isEmpty
                        ? ''
                        : element['user_profile']['address']['region'] +
                        ', '}" +
                        "${element['user_profile']['address']['state'] == null
                            ? ''
                            : element['user_profile']['address']['state']
                            .isEmpty
                            ? ''
                            : element['user_profile']['address']['state'] +
                            ', '}" +
                        "${element['user_profile']['address']['country'] == null
                            ? ''
                            : element['user_profile']['address']['country']
                            .isEmpty
                            ? ''
                            : element['user_profile']['address']['country']}"
                        : 'N.A',
                    rating: element['user_profile']['avg_rating'] == null
                        ? 0.0
                        : double.parse(
                        element['user_profile']['avg_rating'].toString()),
                    totalReviews: element['total_reviews'] == null
                        ? ''
                        : element['total_reviews'].toString(),
                    availability: '',
                    pic: element['user_profile']['profile_image'] is String
                        ? element['user_profile']['profile_image'].toString()
                        : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
              );
            });
            is_fetched = true;
            // }
            setState(() {
              _saving = false;
              // docModelList;
            });
          } catch (err) {
            setState(() {
              _saving = false;
            });
          }
        }
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => afterLayout());
  }

  FilterModel filterModel;
  var specialityName;

  afterLayout() {
    filterModel = FilterModel(
        experience: [],
        lang: [],
        sex: [],
        speciality: [],
        name: '');

    var selectSpecialityProvider =
    Provider.of<SelectSpecialityProvider>(context, listen: false);
    specialityName = selectSpecialityProvider.speciality_name;

    filterModel.speciality
        .add(Speciality(isSelected: true, specialityType: specialityName));
    speciality = {};

    selectSpecialityProvider.allList.forEach((element) {
      speciality.addAll({
        element.specialty_name:
        element.specialty_name == specialityName ? true : false
      });
    });
    fetchList();
  }

  bool is_fetched = false;

  fetchList() async {
    try {
      setState(() {
        _saving = true;
      });
      is_fetched = false;
      url = ApiUrl.approvedDoctorList +
          'speciality=$specialityName&page=$page&page_size=$pageSize';
      var response = await ApiRequest.getApi(url);
      Map decoded = jsonDecode(response.body);

      decoded['body']['data']['rows'].forEach((element) {
        docModelList.add(
          DoctorModel(
              degree: element['user_profile']['enrollment_information']
              ['post_grad'] ??
                  "",
              user_id: (element['user_id'] ?? '1').toString(),
              name: (element['first_name'] + ' ' ?? 'N.A') +
                  (element['last_name'] ?? 'N.A'),
              type1: element['user_profile']['enrollment_information']
              ['sub_speciality'] is String
                  ? element['user_profile']['enrollment_information']
              ['sub_speciality']
                  : '',
              exp: element['user_profile']['enrollment_information']
              ['years_of_experience'] is int
                  ? element['user_profile']['enrollment_information']
              ['years_of_experience']
                  : 0,
              type2: element['user_profile']['enrollment_information']['speciality'] is List
                  ? element['user_profile']['enrollment_information']
              ['speciality']
                  : ['N.A.'],
              fee: element['consultation_fee'] ?? 0,
              location: element['user_profile']['address'] != null
                  ? "${element['user_profile']['address']['region'] == null
                  ? ''
                  : element['user_profile']['address']['region'].isEmpty
                  ? ''
                  : element['user_profile']['address']['region'] + ', '}" +
                  "${element['user_profile']['address']['state'] == null
                      ? ''
                      : element['user_profile']['address']['state'].isEmpty
                      ? ''
                      : element['user_profile']['address']['state'] + ', '}" +
                  "${element['user_profile']['address']['country'] == null
                      ? ''
                      : element['user_profile']['address']['country'].isEmpty
                      ? ''
                      : element['user_profile']['address']['country']}"
                  : 'N.A',
              rating: element['user_profile']['avg_rating'] == null
                  ? 0.0
                  : double.parse(
                  element['user_profile']['avg_rating'].toString()),
              totalReviews: element['total_reviews'] == null
                  ? ''
                  : element['total_reviews'].toString(),
              availability: '',
              pic: element['user_profile']['profile_image'] is String
                  ? element['user_profile']['profile_image'].toString()
                  : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
        );
      });
      is_fetched = true;
      setState(() {
        _saving = false;
      });
    } catch (err) {
      setState(() {
        _saving = false;
      });
    }
  }

  var _saving = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
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
    return SingleChildScrollView(
      child: parentContainer(screenHeight, screenWidth, context),
    );
  }

  Container parentContainer(double screenHeight, double screenWidth,
      BuildContext context) {
    return Container(
      height: screenHeight + 30,
      width: screenWidth,
      decoration: BoxDecoration(
        color: CustomColors.bg_app,
      ),
      child: ModalProgressHUD(
        inAsyncCall: _saving,
        opacity: 0.3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            topBlueCurve(screenWidth, screenHeight, context),
            docSearchBar(context, screenHeight, screenWidth),
            SizedBox(height: 10),
            docModels(screenHeight, screenWidth),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Container topBlueCurve(double screenWidth, double screenHeight,
      BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: screenWidth,
      height: screenHeight * 0.16,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/bg_header.png"), fit: BoxFit.fill),
      ),
      child: Stack(
        children: <Widget>[
          backButton(context),
          findDoctorText(screenHeight, screenWidth),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  GestureDetector backButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, bottom: 20),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Image.asset(
            "assets/images/ic_back.png",
          ),
        ),
      ),
    );
  }

  Container findDoctorText(double screenHeight, double screenWidth) {
    return Container(
      margin: EdgeInsets.only(
        top: screenHeight * 0.047,
        left: screenWidth * 0.33,
      ),
      child: CustomText(
        text: Strings.findDoctors,
        color: CustomColors.white,
        fontWeight: FontStyles.semiBoldFontWeight500,
        fontSize: 22.0,
      ),
    );
  }

  var _controller = ScrollController();

  Widget docModels(double screenHeight,
      double screenWidth,) {
    return Expanded(
      child: docModelList.length == 0 && is_fetched == true
          ? Center(child: Text(Strings.noDoctorFound))
          : ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: docModelList.length,
          controller: _controller,
          itemBuilder: (context, index) {
            return docModelBuilder(
                context, index, screenHeight, screenWidth);
          }),
    );
  }

  Row docSearchBar(BuildContext context,
      double screenHeight,
      double screenWidth,) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 280,
          height: 44,
          decoration: docSearchDecoration(),
          child: Stack(
            children: [
              searchIcon(),
              searchDocTextField(),
            ],
          ),
        ),
        SizedBox(
          width: 20,
        ),
        filterDoc(
          context,
          screenHeight,
          screenWidth,
        ),
      ],
    );
  }

  GestureDetector filterDoc(BuildContext context,
      double screenHeight,
      double screenWidth,) {
    return GestureDetector(
      onTap: () {
        _showBottomModal(context, screenHeight, screenWidth);
      },
      child: Image.asset(
        "assets/images/ic_filter.png",
        height: 25,
        width: 20,
      ),
    );
  }

  Container searchIcon() {
    return Container(
      margin: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 13,
      ),
      child: Image.asset(
        "assets/images/ic_search.png",
        height: 18,
        width: 18,
      ),
    );
  }

  Row topDocLocation(double screenWidth) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.only(left: screenWidth * 0.33, top: 8),
          child: Image.asset(
            "assets/images/ic_location.png",
            height: 12,
            width: 8,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10, top: 7),
          child: CustomText(
            text: currenLocation,
            fontSize: 14,
            color: CustomColors.white,
          ),
        ),
        locationDropDown(),
      ],
    );
  }

  Container locationDropDown() {
    return Container(
      child: PopupMenuButton<String>(
          onSelected: (loc) {
            currenLocation = loc;
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8),
            child: Image.asset(
              "assets/images/ic_drop_down_big.png",
              height: 8,
              width: 15,
            ),
          ),
          itemBuilder: (context) =>
              Strings.locationList
                  .map(
                    (loc) =>
                    PopupMenuItem<String>(
                      value: loc,
                      child: Text(loc),
                    ),
              )
                  .toList()),
    );
  }

  BoxDecoration docSearchDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(22)),
        border: Border.all(color: const Color(0xffdddddd), width: 1),
        color: const Color(0xffffffff));
  }

  var _searchController = TextEditingController();
  String url;

  fetchListFilter() async {
    try {
      //print('calling');
      String paramLang = '',
          paramSpeciality = '',
          paramSex = '',
          paramExperience = '';

      paramName = _searchController.text;
      if ((filterModel?.speciality?.length ?? 0) > 0) {
        for (var item in filterModel?.speciality) {
          if (item?.isSelected ?? false) {
            paramSpeciality = paramSpeciality + item.specialityType + ',';
          }
        }
        resultparamSpeciality =
            paramSpeciality.substring(0, paramSpeciality.length - 1);
      } else {}

      if ((filterModel?.lang?.length ?? 0) > 0) {
        for (var item in filterModel?.lang) {
          if (item?.isSelected ?? false) {
            paramLang = paramLang + item.langType + ',';
          }
        }
        resultparamLang = paramLang.substring(0, paramLang.length - 1);
      } else {}

      if ((filterModel?.sex?.length ?? 0) > 0) {
        for (var item in filterModel?.sex) {
          if (item?.isSelected ?? false) {
            paramSex = paramSex + item.gender + ',';
          }
        }
        resultparamSex = paramSex.substring(0, paramSex.length - 1);
      } else {}

      if ((filterModel?.experience?.length ?? 0) > 0) {
        for (var item in filterModel?.experience) {
          if (item?.isSelected ?? false) {
            paramExperience = paramExperience + item.expRange + ',';
          }
        }
        resultparamExperience =
            paramExperience.substring(0, paramExperience.length - 1);
      } else {}
      var fields = {
        'name': paramName,
        'speciality': resultparamSpeciality,
        'rating': resultparamLang,
        'gender': resultparamSex,
        'years_of_experience': resultparamExperience
      };
      page = 1;
      url = ApiUrl.approvedDoctorList + '&page=$page&page_size=$pageSize&';
      //print('page   $page');
      var filteredKeys = fields.keys
          .where((key) => fields[key] != null && fields[key] != '')
          .toList();

      filteredKeys.forEach((key) {
        url += '$key=${fields[key]}&';
      });

      url = url.substring(0, url.length - 1);

      setState(() {
        _saving = true;
      });
      is_fetched = false;
      var response = await ApiRequest.getApi(url);

      var decoded = jsonDecode(response.body);
      docModelList.clear();
      decoded['body']['data']['rows'].forEach((element) {
        docModelList.add(
          DoctorModel(
              degree: element['user_profile']['enrollment_information']
              ['post_grad'] ??
                  "",
              user_id: (element['user_id'] ?? '1').toString(),
              name: ((element['first_name'] + ' ') ?? 'N.A') +
                  (element['last_name'] ?? 'N.A'),
              type1: element['user_profile']['enrollment_information']
              ['sub_speciality'] is String
                  ? element['user_profile']['enrollment_information']
              ['sub_speciality']
                  : '',
              exp: element['user_profile']['enrollment_information']
              ['years_of_experience'] is int
                  ? element['user_profile']['enrollment_information']
              ['years_of_experience']
                  : 0,
              type2: element['user_profile']['enrollment_information']['speciality'] is List
                  ? element['user_profile']['enrollment_information']
              ['speciality']
                  : ['N.A.'],
              fee: element['consultation_fee'] ?? 0,
              location: element['user_profile']['address'] != null
                  ? "${element['user_profile']['address']['region'] == null
                  ? ''
                  : element['user_profile']['address']['region'].isEmpty
                  ? ''
                  : element['user_profile']['address']['region'] + ', '}" +
                  "${element['user_profile']['address']['state'] == null
                      ? ''
                      : element['user_profile']['address']['state'].isEmpty
                      ? ''
                      : element['user_profile']['address']['state'] + ', '}" +
                  "${element['user_profile']['address']['country'] == null
                      ? ''
                      : element['user_profile']['address']['country'].isEmpty
                      ? ''
                      : element['user_profile']['address']['country']}"
                  : 'N.A',
              rating: element['user_profile']['avg_rating'] == null
                  ? 0.0
                  : double.parse(
                  element['user_profile']['avg_rating'].toString()),
              totalReviews: element['total_reviews'] == null
                  ? ''
                  : element['total_reviews'].toString(),
              availability: '',
              pic: element['user_profile']['profile_image'] is String
                  ? element['user_profile']['profile_image'].toString()
                  : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
        );
      });


      if (docModelList.length == 0) {}
      is_fetched = true;
      setState(() {
        _saving = false;
      });
    } catch (err) {
      setState(() {
        _saving = false;
      });
    }
  }

  String paramName = '';
  String resultparamSex;
  String resultparamSpeciality;
  String resultparamLang;
  String resultparamExperience;

  TextFormField searchDocTextField() {
    return TextFormField(
      onTap: () {
        screenTracker.stopTimer();
        screenTracker.startTimer(context);
      },
      controller: _searchController,
      onChanged: (str) async {
        paramName = str;

        fetchListFilter();
      },
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            _searchController.clear();

            fetchListFilter();
            setState(() {});
          },
          icon: Icon(Icons.clear),
        ),
        prefix: Container(
          margin: EdgeInsets.only(left: 50),
          child: Text(""),
        ),
        border: InputBorder.none,
        hintText: Strings.searchByName,
      ),
    );
  }

  Widget docModelBuilder(BuildContext context,
      int index,
      double screenHeight,
      double screenWidth,) {
    return docCard(index, screenWidth, screenHeight);
  }

  Container docCard(int index, double screenWidth, screenHeight) {
    return Container(
      margin: EdgeInsets.only(bottom: 5, top: 5, left: 10, right: 10),
      width: screenWidth * 0.7,
      decoration: docCardDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            child: Column(
              children: [
                topDocCard(index, screenWidth, screenHeight),
                middleDocCard(index, screenWidth),
                bottomDocCard(index),
              ],
            ),
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Provider.of<TimeSlotProvider>(context, listen: false).initData();
              Provider.of<DoctorDetailProvider>(context, listen: false)
                  .getDoctorDetails(doctorId: docModelList[index].user_id);
              Provider.of<TimeSlotProvider>(context, listen: false)
                  .getDoctorAvailability(doctorId: docModelList[index].user_id);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorDetail(),
                ),
              );
            },
          ),
          docBookAppointmentButton(index),
          SizedBox(height: 5)
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
        color: const Color(0xffffffff));
  }

  Widget topDocCard(int index, screenWidth, screenHeight) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 20,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CommonWidgets.userImgeLoader(
                  imageUrl: docModelList[index]?.pic, size: 70),
            ),
          ),
          docNameAndExp(index, screenWidth, screenHeight),
        ],
      ),
    );
  }

  Container docNameAndExp(int index, screenWidth, screenHeight) {
    String txt = '';
    for (var i in docModelList[index].type2) {
      if ((docModelList[index].type2 ?? []).length > 1) {
        txt = txt + '$i, ';
      }
    }
    if (txt.length > 0) {
      txt = txt.substring(0, txt.length - 2);
    }

    return Container(
      margin: EdgeInsets.only(
        left: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            text: 'Dr. ' + docModelList[index].name,
            fontWeight: FontWeight.bold,
            color: CustomColors.grey2,
            fontSize: 14.0,
          ),
          SizedBox(
            height: 5,
          ),
          (docModelList[index].type2 ?? []).length == 1
              ? CustomText(
            width: screenWidth * .6,
            textAlign: TextAlign.left,
            text: docModelList[index].type2[0],
            color: CustomColors.grey2,
            fontSize: 14.0,
          )
              : CustomText(
            width: screenWidth * .6,
            maxLines: 2,
            text: txt,
            textAlign: TextAlign.left,
            color: CustomColors.grey2,
            fontSize: 14.0,
          ),
        ],
      ),
    );
  }

  Widget middleDocCard(int index, double screenWidth) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 10),
                child: Image.asset(
                  "assets/images/ic_type2.png",
                  height: 18,
                  width: 18,
                ),
              ),
              doctorDegree(index),
            ],
          ),
        ],
      ),
    );
  }

  Container doctorDegree(int index) {
    return Container(
      width: CommonWidgets().getWidth(context) * 0.70,
      child: CustomText(
        textAlign: TextAlign.left,
        maxLines: 3,
        text: docModelList[index].degree.length > 1
            ? docModelList[index].degree.toString()
            : "N.A.",
        color: CustomColors.grey2,
        fontSize: 14.0,
      ),
    );
  }

  Row doctorRating(int index) {
    return Row(
      children: [
        Text(Strings.rating + ': ',
            style: const TextStyle(
                color: const Color(0xff606060),
                fontWeight: FontWeight.bold,
                fontFamily: "Roboto",
                fontStyle: FontStyle.normal,
                fontSize: 14.0),
            textAlign: TextAlign.left),
        CustomText(
          text:
          "${docModelList[index].rating.toString()} \(${docModelList[index]
              .totalReviews.toString()}\)",
          color: CustomColors.grey2,
          fontSize: 14.0,
        ),
        SizedBox(
          width: 5,
        ),
        RatingBarIndicator(
          rating: docModelList[index].rating,
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
    );
  }

  Padding bottomDocCard(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          doctorRating(index),
          SizedBox(
            height: 5,
          ),
          docLocation(index),
          SizedBox(
            height: 5,
          ),
          docFee(index),
          SizedBox(
            height: 5,
          ),
          CustomText(
            text: docModelList[index].availability,
            color: CustomColors.greenDark,
            fontSize: 12.0,
          ),
        ],
      ),
    );
  }

  Row docLocation(int index) {
    return Row(
      children: [
        Text(Strings.address,
            style: const TextStyle(
                color: const Color(0xff606060),
                fontWeight: FontWeight.bold,
                fontFamily: "Roboto",
                fontStyle: FontStyle.normal,
                fontSize: 14.0),
            textAlign: TextAlign.left),
        SizedBox(
          width: 10,
        ),
        CustomText(
          maxLines: 3,
          textAlign: TextAlign.start,
          width: CommonWidgets().getWidth(context) * 0.6,
          text: docModelList[index].location,
          color: CustomColors.grey2,
          fontSize: 14.0,
        ),
      ],
    );
  }

  Row docFee(int index) {
    return Row(
      children: [
        Text(Strings.fee,
            style: const TextStyle(
                color: const Color(0xff606060),
                fontWeight: FontWeight.bold,
                fontFamily: "Roboto",
                fontStyle: FontStyle.normal,
                fontSize: 14.0),
            textAlign: TextAlign.left),
        SizedBox(
          width: 10,
        ),
        CustomText(
          text: "\$${docModelList[index].fee}",
          color: CustomColors.grey2,
          fontSize: 14.0,
        ),
      ],
    );
  }

  Widget docBookAppointmentButton(int index) {
    return CustomButton(
        margin: EdgeInsets.only(bottom: 5),
        height: CommonWidgets().getHeight(context) * 0.055,
        width: CommonWidgets().getWidth(context) * 0.5,
        ontap: () {
          Provider.of<TimeSlotProvider>(context, listen: false).initData();
          Provider.of<TimeSlotProvider>(context, listen: false)
              .getDoctorAvailability(doctorId: docModelList[index].user_id);
          Provider.of<DoctorDetailProvider>(context, listen: false)
              .getDoctorDetails(doctorId: docModelList[index].user_id);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SelectTimeSlot(),
            ),
          );
        },
        buttonText: Strings.bookAppointment.toUpperCase());
  }

  Future _showBottomModal(BuildContext context,
      double screenHeight,
      double screenWidth,) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) =>
          StatefulBuilder(builder: (BuildContext context,
              StateSetter modelSetState,) {
            return modalDecoration(
              screenHeight,
              screenWidth,
              modelSetState,
            );
          }),
    ).whenComplete(() {
      if (clearAllSelected) {
        StateSetter modelSetState;
        modelSetState(() {});
      }
    });
  }

  Container modalDecoration(double screenHeight,
      double screenWidth,
      StateSetter modelSetState,) {
    return Container(
      height: screenHeight * 0.74,
      decoration: BoxDecoration(
        color: CustomColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: modal(screenWidth, modelSetState),
    );
  }

  Center modal(double screenWidth,
      StateSetter modelSetState,) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
          ),
          CustomText(
            text: Strings.filterDoctors,
          ),
          SizedBox(
            height: 30,
          ),
          Divider(
            height: 1,
            color: CustomColors.grey1,
          ),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  leftModal(screenWidth, modelSetState),
                  rightModal(screenWidth, modelSetState),
                ],
              )),
          SizedBox(
            height: 21,
          ),
          bottomButtons(modelSetState),
          SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }

  bool clearAllSelected = false;
  Map<String, bool> retrievedValues;
  Map<String, bool> retrievedSpeciality;
  Map<String, bool> retrievedGender;
  Map<String, bool> retrievedLang;

  Row bottomButtons(StateSetter stateSetter) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ModalButton(
          textColor: CustomColors.white,
          text: Strings.clearAll,
          onPress: () {
            stateSetter(() {
              values.forEach((key, value) {
                values[key] = false;
              });

              speciality.forEach((key, value) {
                speciality[key] = false;
              });

              gender.forEach((key, value) {
                gender[key] = false;
              });

              language.forEach((key, value) {
                language[key] = false;
              });
              clearAllSelected = true;
            });
          },
          color: CustomColors.grey2,
        ),
        SizedBox(
          width: 25,
        ),
        ModalButton(
            textColor: CustomColors.white,
            text: Strings.apply,
            onPress: () async {
              try {
                page = 1;
                String paramLang = '',
                    paramSpeciality = '',
                    paramSex = '',
                    paramExperience = '';
                paramName = _searchController.text;
                if ((filterModel?.speciality?.length ?? 0) > 0) {
                  for (var item in filterModel?.speciality) {
                    if (item?.isSelected ?? false) {
                      paramSpeciality =
                          paramSpeciality + item.specialityType + ',';
                    }
                  }
                  if (paramSpeciality.length > 0) {
                    resultparamSpeciality = paramSpeciality.substring(
                        0, paramSpeciality.length - 1);
                  }
                } else {}

                if ((filterModel?.lang?.length ?? 0) > 0) {
                  for (var item in filterModel?.lang) {
                    if (item?.isSelected ?? false) {
                      paramLang = paramLang + item.langType + ',';
                    }
                  }
                  if (paramLang.length > 0) {
                    resultparamLang =
                        paramLang.substring(0, paramLang.length - 1);
                  }
                } else {}

                if ((filterModel?.sex?.length ?? 0) > 0) {
                  for (var item in filterModel?.sex) {
                    if (item?.isSelected ?? false) {
                      paramSex = paramSex + item.gender + ',';
                    }
                  }
                  if (paramSex.length > 0) {
                    resultparamSex = paramSex.substring(0, paramSex.length - 1);
                  }
                } else {}

                if ((filterModel?.experience?.length ?? 0) > 0) {
                  for (var item in filterModel?.experience) {
                    if (item?.isSelected ?? false) {
                      paramExperience = paramExperience + item.expRange + ',';
                    }
                  }
                  if (paramExperience.length > 0) {
                    resultparamExperience = paramExperience.substring(
                        0, paramExperience.length - 1);
                  }
                } else {}

                var fields = {
                  'name': paramName,
                  'speciality': resultparamSpeciality,
                  'rating': resultparamLang,
                  'gender': resultparamSex,
                  'years_of_experience': resultparamExperience
                };
                url = ApiUrl.approvedDoctorList;

                var filteredKeys = fields.keys
                    .where((key) => fields[key] != null && fields[key] != '')
                    .toList();
                if (clearAllSelected) {
                  fields.keys.forEach((key) {
                    if (key != 'name') {
                      fields[key] = '';
                    }
                  });
                  filteredKeys = fields.keys
                      .where((key) => fields[key] != null && fields[key] != '')
                      .toList();
                  clearAllSelected = false;
                }

                filteredKeys.forEach((key) {
                  url += '$key=${fields[key]}&';
                });

                url = url.substring(0, url.length - 1);

                if (url.length < ApiUrl.approvedDoctorList.length) {
                  url = url + "?&page=$page&page_size=$pageSize";
                }

                setState(() {
                  _saving = true;
                });
                is_fetched = false;
                Navigator.pop(context);
                var response = await ApiRequest.getApi(url);

                var decoded = jsonDecode(response.body);
                docModelList.clear();
                decoded['body']['data']['rows'].forEach((element) {
                  docModelList.add(
                    DoctorModel(
                        degree: element['user_profile']['enrollment_information']['post_grad'] ??
                            "",
                        user_id: (element['user_id'] ?? '1').toString(),
                        name: (element['first_name'] + ' ' ?? 'N.A') +
                            (element['last_name'] ?? 'N.A'),
                        type1: element['user_profile']['enrollment_information']['sub_speciality'] is String
                            ? element['user_profile']['enrollment_information']
                        ['sub_speciality']
                            : '',
                        exp: element['user_profile']['enrollment_information']
                        ['years_of_experience'] is int
                            ? element['user_profile']['enrollment_information']
                        ['years_of_experience']
                            : 0,
                        type2: element['user_profile']['enrollment_information']['speciality'] is List
                            ? element['user_profile']['enrollment_information']
                        ['speciality']
                            : ['N.A.'],
                        fee: element['consultation_fee'] ?? 0,
                        rating: element['user_profile']['avg_rating'] == null
                            ? 0.0
                            : double.parse(
                            element['user_profile']['avg_rating'].toString()),
                        location: element['user_profile']['address'] != null
                            ? "${element['user_profile']['address']['region'] ==
                            null
                            ? ''
                            : element['user_profile']['address']['region']
                            .isEmpty
                            ? ''
                            : element['user_profile']['address']['region'] +
                            ', '}" +
                            "${element['user_profile']['address']['state'] ==
                                null
                                ? ''
                                : element['user_profile']['address']['state']
                                .isEmpty
                                ? ''
                                : element['user_profile']['address']['state'] +
                                ', '}" +
                            "${element['user_profile']['address']['country'] ==
                                null
                                ? ''
                                : element['user_profile']['address']['country']
                                .isEmpty
                                ? ''
                                : element['user_profile']['address']['country']}"
                            : 'N.A',
                        totalReviews: element['total_reviews'] == null
                            ? ''
                            : element['total_reviews'].toString(),
                        availability: '',
                        pic: element['user_profile']['profile_image'] is String
                            ? element['user_profile']['profile_image']
                            .toString()
                            : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
                  );
                });

                if (docModelList.length == 0) {
                  CommonWidgets.showToast(
                      context, Strings.noDoctorFound, _scaffoldKey);
                }
                is_fetched = true;
                setState(() {
                  _saving = false;
                });
                resultparamExperience = '';
                resultparamLang = '';
                resultparamSex = '';
                resultparamSpeciality = '';
              } catch (err) {
                resultparamExperience = '';
                resultparamLang = '';
                resultparamSex = '';
                resultparamSpeciality = '';
              }
            },
            color: CustomColors.yellow1),
      ],
    );
  }

  Container rightModal(double screenWidth,
      StateSetter modelSetState,) {
    return Container(
      width: screenWidth / 2,
      color: CustomColors.white,
      child: modalSelected == Strings.sex
          ? Column(
          children: gender.keys.map((String key) {
            return singleCheckBox(
              text: key,
              value: gender[key],
              onchanged: (bool value) {
                modelSetState(() {
                  gender[key] = value;

                  filterModel.sex.any((element) {
                    if (element.gender == key) {
                      filterModel.sex.remove(element);
                      return true;
                    } else
                      return false;
                  });

                  filterModel.sex.add(Sex(gender: key, isSelected: value));
                });
              },
            );
          }).toList())
          : modalSelected == Strings.rating
          ? Column(
          children: language.keys.map((String key) {
            return singleCheckBox(
              text: key,
              value: language[key],
              onchanged: (bool value) {
                modelSetState(() {
                  language[key] = value;
                  filterModel.lang.any((element) {
                    if (element.langType == key) {
                      filterModel.lang.remove(element);
                      return true;
                    } else
                      return false;
                  });
                  filterModel.lang
                      .add(Lang(langType: key, isSelected: value));
                });
              },
            );
          }).toList())
          : modalSelected == Strings.speciality
          ? ListView(
          children: speciality.keys.map((String key) {
            return singleCheckBox(
              text: key,
              value: speciality[key],
              onchanged: (bool value) {
                modelSetState(() {
                  speciality[key] = value;
                  filterModel.speciality.any((element) {
                    if (element.specialityType == key) {
                      filterModel.speciality.remove(element);
                      return true;
                    } else
                      return false;
                  });
                  filterModel.speciality.add(Speciality(
                      specialityType: key, isSelected: value));
                });
              },
            );
          }).toList())
          : Container(),
    );
  }

  Container leftModal(double screenWidth,
      StateSetter modelSetState,) {
    return Container(
      color: CustomColors.grey1,
      width: screenWidth / 2,
      child: Column(
          children: modalStrings
              .map((modalString) =>
              ModelOptionSelect(
                modalSelected: modalSelected,
                onTap: () {
                  modalSelected = modalString;
                  modelSetState(() {});
                },
                text: modalString,
              ))
              .toList()),
    );
  }

  Widget singleCheckBox({
    bool value,
    String text,
    Function(bool) onchanged,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Checkbox(value: value, onChanged: onchanged),
          Container(
            padding: const EdgeInsets.all(16.0),
            width: MediaQuery
                .of(context)
                .size
                .width * .38,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  text,
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
