import 'package:virtudoc_app/index.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class CreatePrescription extends StatefulWidget {
  @override
  _CreatePrescriptionState createState() => _CreatePrescriptionState();
}

class _CreatePrescriptionState extends State<CreatePrescription> {
  int rowVal = 1;
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: body(),
      ),
    );
  }

  Consumer<CreatePrescriptionProvider> body() {
    return Consumer<CreatePrescriptionProvider>(
      builder: (context, value, child) =>
          SingleChildScrollView(
            child: Column(
              children: [
                CustomTopBar(
                    context: context, titleText: Strings.createPrescription),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [patientFields(), patientValues(value)],
                      ),
                    ),
                  ],
                ),
                CommonWidgets.divider,
                additionalInfo(value),
                CommonWidgets.divider,
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: CustomText(
                    textAlign: TextAlign.left,
                    text: Strings.prescription,
                    fontSize: FontStyles.large,
                    fontWeight: FontStyles.semiBoldFontWeight500,
                  ),
                ),
                prescription(),
                rowAddRemove(),
                CustomButton(
                  ontap: () {},
                  buttonText: Strings.create.toUpperCase(),
                ),
              ],
            ),
          ),
    );
  }

  Row rowAddRemove() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            rowVal++;
            setState(() {});
          },
          child: CustomText(
            text: Strings.addRow,
            color: CustomColors.blue,
            fontSize: FontStyles.medium,
          ),
        ),
        GestureDetector(
          onTap: () {
            if (rowVal > 1)
              rowVal--;
            else
              CommonWidgets.showToast(
                  context, "Row can't be removed", _scaffoldKey);

            setState(() {});
          },
          child: CustomText(
            text: Strings.removeRow,
            color: CustomColors.blue,
            fontSize: FontStyles.medium,
          ),
        ),
      ],
    );
  }

  Column patientValues(CreatePrescriptionProvider value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: value.patientName,
          fontSize: FontStyles.normal,
          fontWeight: FontStyles.semiBoldFontWeight400,
          color: CustomColors.grey2,
        ),
        SizedBox(
          height: 5,
        ),
        CustomText(
          text: value.patientAge,
          fontSize: FontStyles.normal,
          fontWeight: FontStyles.semiBoldFontWeight400,
          color: CustomColors.grey2,
        ),
        SizedBox(
          height: 5,
        ),
        CustomText(
          text: value.patientGender,
          fontSize: FontStyles.normal,
          fontWeight: FontStyles.semiBoldFontWeight400,
          color: CustomColors.grey2,
        ),
        SizedBox(
          height: 5,
        ),
        CustomText(
          text: value.patientHeight,
          fontSize: FontStyles.normal,
          fontWeight: FontStyles.semiBoldFontWeight400,
          color: CustomColors.grey2,
        ),
        SizedBox(
          height: 5,
        ),
        CustomText(
          text: value.patientWeight,
          fontSize: FontStyles.normal,
          fontWeight: FontStyles.semiBoldFontWeight400,
          color: CustomColors.grey2,
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Column patientFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: Strings.patientName,
          fontSize: FontStyles.normal,
          fontWeight: FontStyles.semiBoldFontWeight400,
          color: CustomColors.black1,
        ),
        SizedBox(
          height: 5,
        ),
        CustomText(
          text: Strings.patientAge,
          fontSize: FontStyles.normal,
          fontWeight: FontStyles.semiBoldFontWeight400,
          color: CustomColors.black1,
        ),
        SizedBox(
          height: 5,
        ),
        CustomText(
          text: Strings.patientGender,
          fontSize: FontStyles.normal,
          fontWeight: FontStyles.semiBoldFontWeight400,
          color: CustomColors.black1,
        ),
        SizedBox(
          height: 5,
        ),
        CustomText(
          text: Strings.patientHeight,
          fontSize: FontStyles.normal,
          fontWeight: FontStyles.semiBoldFontWeight400,
          color: CustomColors.black1,
        ),
        SizedBox(
          height: 5,
        ),
        CustomText(
          text: Strings.patientWeight,
          fontSize: FontStyles.normal,
          fontWeight: FontStyles.semiBoldFontWeight400,
          color: CustomColors.black1,
        ),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }

  Padding additionalInfo(CreatePrescriptionProvider value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          children: [
            TextSpan(
              text: Strings.additionalInfo,
              style: TextStyle(
                color: CustomColors.black1,
                fontSize: FontStyles.normal,
                fontWeight: FontStyles.semiBoldFontWeight400,
              ),
            ),
            TextSpan(
              text: value.additionalInfo,
              style: TextStyle(
                color: CustomColors.grey2,
                fontSize: FontStyles.normal,
              ),
            )
          ],
        ),
      ),
    );
  }

  Column prescription() {
    return Column(
      children: [
        columnTitle(),
        ListView.builder(
            shrinkWrap: true,
            itemCount: rowVal,
            itemBuilder: (context, index) => singlePrecriptionRow()),
      ],
    );
  }

  FittedBox singlePrecriptionRow() {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Row(
          children: [
            CustomTextForm(
              margin: EdgeInsets.only(left: 20),
            ),
            CustomTextForm(
              width: CommonWidgets().getWidth(context) * 0.23,
              margin: EdgeInsets.symmetric(horizontal: 20),
            ),
            CustomTextForm(
              margin: EdgeInsets.only(right: 20),
            ),
          ],
        ),
      ),
    );
  }

  Padding columnTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: Strings.drugName,
            textAlign: TextAlign.left,
            fontSize: FontStyles.small,
            fontWeight: FontStyles.semiBoldFontWeight400,
          ),
          Center(
            child: CustomText(
              textAlign: TextAlign.left,
              text: Strings.drugUnit,
              fontSize: FontStyles.small,
              fontWeight: FontStyles.semiBoldFontWeight400,
            ),
          ),
          CustomText(
            text: Strings.drugdosage,
            fontSize: FontStyles.small,
            fontWeight: FontStyles.semiBoldFontWeight400,
          ),
        ],
      ),
    );
  }
}
