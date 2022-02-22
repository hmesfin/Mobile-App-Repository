import 'package:virtudoc_app/custom-widgets/custom-top-bar.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/utils/custom-colors.dart';

import 'package:virtudoc_app/utils/styles.dart';
import 'help-model.dart';
import 'dart:math';

import 'help-provider.dart';
/*
The file is covered under Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. Please review the license for full details.

This program is not free software: You cannot redistribute it for any use under the terms of the Algoworks Work Product License for Design & Development of Mobile Application for “Abyssinia Technology Group”. However the source can be modified and updated for the working of the application Design & Development of Mobile Application for “Abyssinia Technology Group” for which it was licensed.
*/

class Faqs extends StatefulWidget {
  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Faqs> {
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: CustomColors.bg_app,
            body: SingleChildScrollView(
              child: _buildWidget(context),
            ),
          ),
        ],
      ),
    );
  }

  _buildWidget(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: <Widget>[
            CustomTopBar(
              context: context,
              titleText: Strings.faqs,
            ),
            Consumer<HelpProvider>(
              builder: (context, faq, _) =>
              faq.list.isEmpty && !_isLoading
                  ? Center(
                child: Text('No available Faqs'),
              )
                  : ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: faq.list.length,
                  itemBuilder: (context, index) =>
                      FaqComponent(faq: faq.list[index])),
            ),
            Divider(color: CustomColors.grey2.withOpacity(0.1))
          ],
        ),
        if (_isLoading) CommonWidgets.showLoader(context)
      ],
    );
  }

  var _init = true;

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    if (_init) {
      setState(() {
        _isLoading = true;
      });
      _init = false;
      await Provider.of<HelpProvider>(context, listen: false).getFaq();
      setState(() {
        _isLoading = false;
      });
    }
  }
}

class FaqComponent extends StatefulWidget {
  final HelpModel faq;

  FaqComponent({Key key, @required this.faq}) : super(key: key);

  @override
  _FaqComponentState createState() => _FaqComponentState();
}

class _FaqComponentState extends State<FaqComponent> {
  bool _dropdown = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(color: CustomColors.grey2.withOpacity(0.1)))),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _dropdown = !_dropdown;
              });
            },
            child: Container(
              height: 53,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 10, right: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.faq.question,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: FontStyles.medium,
                          fontWeight: FontStyles.semiBoldFontWeight500),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 17,
                    width: 17,
                    child: Transform.rotate(
                        angle: _dropdown ? 180 * pi / 180 : 0,
                        child: Image.asset("assets/images/ic_drop_down1.png")),
                  )
                ],
              ),
            ),
          ),
          !_dropdown
              ? Container()
              : Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Text(
              widget.faq.answer,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: FontStyles.normal,
                  fontWeight: FontStyles.semiBoldFontWeight400),
            ),
          )
        ],
      ),
    );
  }
}
