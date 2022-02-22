import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:virtudoc_app/custom-widgets/custom-text.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/screens/orders/orders_listing_provider.dart';
import 'package:virtudoc_app/utils/common-widgets.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/screens/orders/order-details/order-detail.dart';

import '../../index.dart';

class OrdersListing extends StatefulWidget {
  @override
  OrdersListingState createState() => OrdersListingState();
}

class OrdersListingState extends State<OrdersListing> with AfterLayoutMixin {
  AppBar appBar = AppBar();
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void afterFirstLayout(BuildContext context) async {
    await Provider.of<OrdersListingProvider>(context, listen: false).init();
    Provider.of<OrdersListingProvider>(context, listen: false)
        .getOrdersListing();
    Provider.of<OrdersListingProvider>(context, listen: false)
        .getOpenOrderCount();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrdersListingProvider>(
        builder: (context, model, child) => ModalProgressHUD(
            inAsyncCall: model.isLoading,
            child: SafeArea(
                child: Scaffold(
                    key: _scaffoldKey,
                    backgroundColor: CustomColors.bg_app,
                    body: _buildWidget(context))),
            opacity: 0.4));
  }

  _buildWidget(BuildContext context) {
    double appbarheight = appBar.preferredSize.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height - appbarheight;
    return parentContainer(screenHeight, screenWidth, context, appbarheight);
  }

  Container parentContainer(double screenHeight, double screenWidth,
      BuildContext context, appbarheight) {
    return Container(
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      CustomTopBar(context: context, titleText: Strings.pastOrders),
      Expanded(
          // height: screenHeight - appbarheight * 1.5,
          // width: screenWidth,
          child: paginatedListView(context))
    ]));
  }

  Widget paginatedListView(context) {
    return Consumer<OrdersListingProvider>(
        builder: (context, model, child) => model.noData
            ? Center(child: CustomText(text: Strings.noOrders))
            : SmartRefresher(
                enablePullDown: false,
                enablePullUp: true,
                header: WaterDropHeader(),
                footer: CustomFooter(
                    builder: (BuildContext context, LoadStatus mode) {
                  Widget body;
                  if (mode == LoadStatus.idle) {
                    body = CustomText(text: '');
                  } else if (mode == LoadStatus.loading) {
                    body = Container();
                  } else if (mode == LoadStatus.failed) {
                    body = CustomText(text: '');
                  } else if (mode == LoadStatus.canLoading) {
                    body = Container();
                  } else {
                    body = CustomText(text: '');
                  }
                  return Container(height: 55.0, child: Center(child: body));
                }),
                controller: model.refreshController,
                onRefresh: model.refreshList,
                onLoading: () => model.getOrdersListing(),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: model.ordersList.length,
                    itemBuilder: (context, int index) {
                      var item = model?.ordersList?.elementAt(index);

                      CommonWidgets.timeAgoSinceDate(item?.createdAt);
                      return Card(
                          elevation: 1.0,
                          color: Colors.white,
                          margin: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 10.0),
                              child: Stack(children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                                child: CommonWidgets.userImgeLoader(
                                                    imageUrl:
                                                        '${PreferenceUtils.getString(PreferenceKeys.ROLE) == 'PATIENT' ? item.order.doctor.user_profile.profile_image : item.order.patient.user_profile.profile_image}',
                                                    size: 50),
                                                margin: EdgeInsets.only(
                                                    right: 10.0)),
                                            Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 5.0),
                                                  CustomText(
                                                      text:
                                                          '${PreferenceUtils.getString(PreferenceKeys.ROLE) == 'PATIENT' ? item.order.doctor.first_name + " " + item.order.doctor.last_name : item.order.patient.first_name + " " + item.order.patient.last_name}',
                                                      fontSize:
                                                          FontStyles.small,
                                                      color:
                                                          CustomColors.black2),
                                                  SizedBox(height: 5.0),
                                                  CustomText(
                                                      text:
                                                          '${PreferenceUtils.getString(PreferenceKeys.ROLE) == 'PATIENT' ? item.order.doctor.country_code + "" + item.order.doctor.phone : item.order.patient.country_code + " " + item.order.patient.phone}',
                                                      fontSize:
                                                          FontStyles.small,
                                                      color:
                                                          CustomColors.black2)
                                                ])
                                          ]),
                                      SizedBox(height: 15.0),
                                      Divider(height: 1.0, color: Colors.grey),
                                      SizedBox(height: 5.0),
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(
                                                text: Strings.requisitionInfo,
                                                fontSize: FontStyles.small,
                                                color: CustomColors.black3),
                                            CustomText(
                                                text:
                                                    '${item.requisition.requisition_type.toUpperCase()}',
                                                fontSize: FontStyles.normal,
                                                color: CustomColors.black3)
                                          ]),
                                      SizedBox(height: 5.0),
                                      Divider(height: 1.0, color: Colors.grey),
                                      SizedBox(height: 10.0),
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CustomText(
                                                text: 'Requisition Name:',
                                                fontSize: FontStyles.small,
                                                color: CustomColors.black2),
                                            SizedBox(width: 2.0),
                                            CustomText(
                                                text:
                                                    '${item.requisition.requisition_name}',
                                                fontSize: FontStyles.small,
                                                color: CustomColors.black3)
                                          ]),
                                      SizedBox(height: 5.0),
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CustomText(
                                                text: '${Strings.email_txt}',
                                                fontSize: FontStyles.small,
                                                color: CustomColors.black2),
                                            SizedBox(width: 2.0),
                                            CustomText(
                                                text:
                                                    '${item.requisition.email}',
                                                fontSize: FontStyles.small,
                                                color: CustomColors.black3)
                                          ]),
                                      SizedBox(height: 5.0),
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CustomText(
                                                text: 'Phone:',
                                                fontSize: FontStyles.small,
                                                color: CustomColors.black2),
                                            SizedBox(width: 2.0),
                                            CustomText(
                                                text:
                                                    ' ${item.requisition.country_code + "" + item.requisition.phone}',
                                                fontSize: FontStyles.small,
                                                color: CustomColors.black3),
                                          ]),
                                      SizedBox(height: 3.0),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CustomText(
                                              text: 'Status: ',
                                              fontSize: FontStyles.small,
                                              color: CustomColors.black2),
                                          CustomText(
                                              text:
                                                  '${Strings.requsitionsStatusText(item.status).toUpperCase()}',
                                              fontSize: FontStyles.normal,
                                              color: Strings
                                                  .requsitionsStatusColor(
                                                      item.status)),
                                        ],
                                      ),
                                      SizedBox(height: 5.0),
                                      if (PreferenceUtils.getString(
                                              PreferenceKeys.ROLE) !=
                                          'PATIENT')
                                        Center(
                                          child: CustomButton(
                                            buttonText: Strings.edit_order,
                                            ontap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      OrderDetail(item),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                    ]),
                                if (PreferenceUtils.getString(
                                        PreferenceKeys.ROLE) !=
                                    'PATIENT')
                                  GestureDetector(
                                      child: Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 2.0,
                                                  horizontal: 2.0),
                                              child: Icon(Icons.delete_rounded,
                                                  color: CustomColors.red))),
                                      onTap: () {
                                        // model.isLoading
                                        // ? CommonWidgets.showLoader(context)
                                        return showDialog(
                                          context: context,
                                          builder: (context) => Builder(
                                            builder: (context) => Dialog(
                                              backgroundColor:
                                                  CustomColors.bg_app,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 50,
                                                    height: 50,
                                                    margin: EdgeInsets.only(
                                                        top: 40, bottom: 20),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                      color:
                                                          //  color ??
                                                          CustomColors.grey,
                                                    ),
                                                    child:
                                                        // icon ??
                                                        Container(
                                                      margin:
                                                          EdgeInsets.all(10),
                                                      child: Icon(
                                                          Icons.delete_rounded),
                                                    ),
                                                  ),
                                                  CustomText(
                                                      text:
                                                          '${Strings.delete_req}',
                                                      fontSize: 20),
                                                  SizedBox(
                                                    height: 7,
                                                  ),
                                                  Center(
                                                    child: CustomText(
                                                        padding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        20),
                                                        maxLines: 3,
                                                        text:
                                                            "${Strings.delete_req_txt}",
                                                        textAlign:
                                                            TextAlign.center,
                                                        color:
                                                            CustomColors.grey2,
                                                        fontWeight: FontStyles
                                                            .semiBoldFontWeight400,
                                                        fontSize: 16.0),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Container(
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                        color: Colors.green,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  8),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  8),
                                                        )),
                                                    child: Row(
                                                      children: [
                                                        CommonWidgets
                                                            .bottomButton(
                                                                context:
                                                                    context,
                                                                color:
                                                                    CustomColors
                                                                        .grey2,
                                                                onTap: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                text: Strings
                                                                        .no ??
                                                                    Strings
                                                                        .reject),
                                                        model.isLoading
                                                            ? CommonWidgets
                                                                .showLoader(
                                                                    context)
                                                            : CommonWidgets
                                                                .bottomButton(
                                                                    context:
                                                                        context,
                                                                    color: CustomColors
                                                                        .yellow1,
                                                                    onTap: () {
                                                                      model.deleteOrderRequisition(
                                                                          item
                                                                              .requisition_order_id,
                                                                          index,
                                                                          error:
                                                                              (message) {
                                                                        CommonWidgets.showToast(
                                                                            context,
                                                                            message ??
                                                                                "",
                                                                            _scaffoldKey);
                                                                      });
                                                                      Navigator.pop(
                                                                          context);

                                                                      Provider.of<OrdersListingProvider>(
                                                                              context,
                                                                              listen: false)
                                                                          .getOpenOrderCount();
                                                                    },
                                                                    text: Strings
                                                                            .yes ??
                                                                        Strings
                                                                            .accept),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      behavior: HitTestBehavior.opaque)
                              ])));
                    })));
  }
}
