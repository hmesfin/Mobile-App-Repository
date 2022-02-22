import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';
import 'package:virtudoc_app/utils/strings.dart';
import 'package:virtudoc_app/utils/styles.dart';

import 'doctor-transaction-provider.dart';

class DoctorTransactions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DoctorTransactionsState();
}

class _DoctorTransactionsState extends State<DoctorTransactions> {
  var isPatientEnable = false;
  AppBar appBar = AppBar();
  var controller = ScrollController();
  var isDoctorEnable = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DoctorTransactionsProvider>(context, listen: false)
          .getTransactionList(
          Provider
              .of<DoctorTransactionsProvider>(context, listen: false)
              .page);
      controller.addListener(() {
        if (controller.position.pixels >
            (controller.position.maxScrollExtent + 100)) {
          Provider
              .of<DoctorTransactionsProvider>(context, listen: false)
              .page++;
          Provider.of<DoctorTransactionsProvider>(context, listen: false)
              .getTransactionList(Provider
              .of<DoctorTransactionsProvider>(
              context,
              listen: false)
              .page);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: CustomColors.blue, //or set color with: Color(0xFF0000FF)
    ));
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.bg_app,
        body: Container(
          child: _buildWidget(context),
        ),
//        body: ModalProgressHUD(
//          child: _buildWidget(context),
//          inAsyncCall: _loading,
//          progressIndicator: CircularProgressIndicator(
//            valueColor: new AlwaysStoppedAnimation<Color>(CustomColors.yellow),
//          ),
//        ),
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
        .height;
    return SingleChildScrollView(
      child: Container(
        height: screenHeight + appbarheight,
        width: screenWidth,
        decoration: BoxDecoration(
          color: CustomColors.bg_app,
        ),
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            // Header
            CustomTopBar(
                context: context, titleText: Strings.transaction_history),

            Container(
              margin: EdgeInsets.only(top: 0, left: 10, right: 10),
              height: screenHeight - 180,
              child: Consumer<DoctorTransactionsProvider>(
                builder: (context, transaction, _) =>
                (transaction.isLoading &&
                    transaction.list.length == 0)
                    ? Center(child: CircularProgressIndicator())
                    : (!transaction.isLoading && transaction.list.length == 0)
                    ? Center(child: Text('No new Transactions'))
                    : ((transaction.isLoading &&
                    transaction.list.length != 0 ||
                    !transaction.isLoading &&
                        transaction.list.length != 0))
                    ? ListView.builder(
                  // padding: EdgeInsets.fromLTRB(0, 200, 0, 0),
                  controller: controller,
                  physics: BouncingScrollPhysics(),
                  itemCount: transaction.list.length,
                  itemBuilder: (context, index) =>
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Card(
                          elevation: 1,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: screenWidth / 1.9,
                                        child: Text(
                                          transaction.list[index]
                                              .transactionNote,
                                          overflow:
                                          TextOverflow.ellipsis,
                                          maxLines: 5,
                                          style: TextStyle(
                                              fontFamily: FontStyles
                                                  .fontFamly,
                                              color:
                                              CustomColors.black2,
                                              fontWeight: FontStyles
                                                  .semiBoldFontWeight400,
                                              fontSize:
                                              FontStyles.size15),
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        // width: screenWidth / 1.9,
                                        child: Text(
                                          (transaction.list[index]
                                              .txnType ==
                                              'Cr'
                                              ? '+ '
                                              : '- ') +
                                              "\$${transaction.list[index]
                                                  .amount}",
                                          overflow:
                                          TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: TextStyle(
                                              color: transaction
                                                  .list[index]
                                                  .txnType ==
                                                  'Cr'
                                                  ? CustomColors.green
                                                  : CustomColors.red,
                                              fontWeight: FontStyles
                                                  .semiBoldFontWeight500,
                                              fontSize:
                                              FontStyles.large,
                                              fontFamily: FontStyles
                                                  .fontFamly),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, top: 10.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          transaction.list[index]
                                              .transactionStatus ==
                                              0
                                              ? "Pending"
                                              : transaction
                                              .list[index]
                                              .transactionStatus ==
                                              1
                                              ? "Confirmed"
                                              : "Failed",
                                          overflow:
                                          TextOverflow.ellipsis,
                                          maxLines: 5,
                                          style: TextStyle(
                                              fontFamily: FontStyles
                                                  .fontFamly,
                                              color: transaction
                                                  .list[index]
                                                  .transactionStatus ==
                                                  1
                                                  ? CustomColors.green
                                                  : transaction
                                                  .list[
                                              index]
                                                  .transactionStatus ==
                                                  2
                                                  ? CustomColors
                                                  .red
                                                  : CustomColors
                                                  .grey2,
                                              fontSize:
                                              FontStyles.size15),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: screenWidth / 1.9,
                                    child: Text(
                                      "${DateFormat("dd MMMM yyyy").format(
                                          DateTime.parse(transaction.list[index]
                                              .createdAt))}",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 5,
                                      style: TextStyle(
                                          fontFamily:
                                          FontStyles.fontFamly,
                                          color: CustomColors.grey2,
                                          fontSize:
                                          FontStyles.size15),
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    // width: screenWidth / 1.9,
                                    child: Text(
                                      "${DateFormat("hh:mm aaa").format(
                                          DateTime.parse(
                                              transaction.list[index].createdAt)
                                              .toLocal())}",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 5,
                                      style: TextStyle(
                                          fontFamily:
                                          FontStyles.fontFamly,
                                          color: CustomColors.grey2,
                                          fontSize:
                                          FontStyles.size15),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                            ],
                          ),
                        ),
                      ),
                  // docModelBuilder(context, index, screenHeight, screenWidth),
                )
                    : Container(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
