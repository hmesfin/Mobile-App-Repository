import 'package:virtudoc_app/index.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  var isPatientEnable = false;
  var isDoctorEnable = false;
  int _current;
  @override
  void initState() {
    super.initState();
    _current = 1;

    setState(() {});
  }

  AppBar appBar = AppBar(
    title: Text(Strings.appName),
  );
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: CustomColors.blue, //or set color with: Color(0xFF0000FF)
    ));

    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.bg_app,
        body: _buildWidget(context),
      ),
    );
  }

  _buildWidget(BuildContext context) {
    return Stack(
      children: [
        topImage(),
        movingText(),
        topLogo(),
        indicators(),
        customButton(context),
      ],
    );
  }

  Image topImage() {
    return Image.asset(
      "assets/images/new_doc.png",
      alignment: Alignment.center,
      fit: BoxFit.cover,
      height: CommonWidgets().getHeight(context),
    );
  }

  Widget customButton(BuildContext context) {
    return Positioned(
      child: Align(
        alignment: Alignment(0, 0.95),
        child: CustomButton(
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            buttonText: Strings.letsgo.toUpperCase()),
      ),
    );
  }

  Widget indicators() {
    return Positioned(
      child: Align(
        alignment: Alignment(0, 0.72),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [1, 2, 3].map(((index) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? CustomColors.yellow1
                      : Color.fromRGBO(0, 0, 0, 0.3)),
            );
          })).toList(),
        ),
      ),
    );
  }

  Widget topLogo() {
    return Container(
      alignment: Alignment(0, -0.9),
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Image.asset(
        'assets/images/updated_logo.png',
      ),
    );
  }

  Positioned movingText() {
    return Positioned(
      child: Align(
        alignment: Alignment(0, 0.6),
        child: CarouselSlider(
          options: CarouselOptions(
            height: 70,
            viewportFraction: 0.95,
            onPageChanged: (index, reason) => {
              setState(() {
                _current = index + 1;
              })
            },
          ),
          items: Strings.intro.map((i) {
            return builder(i);
          }).toList(),
        ),
      ),
    );
  }

  Builder builder(String i) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.black54,
          ),
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: text(i),
        );
      },
    );
  }

  Center text(String i) {
    return Center(
      child: AutoSizeText(
        i,
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        style: textStyle(),
        presetFontSizes: [14, 12, 10],
        textAlign: TextAlign.center,
      ),
    );
  }

  TextStyle textStyle() {
    return TextStyle(
      color: CustomColors.white,
      fontWeight: FontStyles.semiBoldFontWeight400,
      fontFamily: FontStyles.fontFamly,
      package: FontStyles.package,
      fontStyle: FontStyle.normal,
    );
  }
}
