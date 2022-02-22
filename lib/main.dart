import 'dart:async';

import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/choose-role/choose-role-screen.dart';
import 'package:virtudoc_app/screens/home/doctor/chat/chat_provider.dart';
import 'package:virtudoc_app/screens/home/doctor/enrollment-details-update/enrollment-detail-update.dart';
import 'package:virtudoc_app/screens/home/doctor/enrollment-details-update/enrollment-provider-update.dart';
import 'package:virtudoc_app/screens/home/doctor/enrollment-details-update/speciality_provider-update.dart';
import 'package:virtudoc_app/screens/home/patient/find-doctor/book-appointment/book-appointment.dart';
import 'package:virtudoc_app/screens/home/patient/find-doctor/book-appointment/is-booking-provider.dart';
import 'package:virtudoc_app/screens/home/patient/history/history-provider.dart';
import 'package:virtudoc_app/screens/home/patient/patientBottom_provider.dart';
import 'package:virtudoc_app/screens/home/patient/payment-method/payment-provider.dart';
import 'package:virtudoc_app/screens/home/patient/wallet/add-balance/booking-provider.dart';
import 'package:virtudoc_app/screens/home/patient/wallet/wallet_provider.dart';
import 'package:virtudoc_app/screens/home/patient/appointment/appointment-provider.dart';
import 'package:virtudoc_app/screens/orders/orders_listing_provider.dart';
import 'package:virtudoc_app/screens/video_call/video_call_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.getInstance();

  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  var configuredApp = new AppConfig(
    child: MultiProvider(
      providers: [
        ChangeNotifierProvider<PatientNotificationProvider>(
          create: (context) => PatientNotificationProvider(),
        ),
        ChangeNotifierProvider<AppointmentProvider>(
          create: (context) => AppointmentProvider(),
        ),
        ChangeNotifierProvider<DoctorNotificationProvider>(
          create: (context) => DoctorNotificationProvider(),
        ),
        ChangeNotifierProvider<WalletProvider>(
            create: (context) => WalletProvider()),
        ChangeNotifierProvider<PatientBottomProvider>(
            create: (context) => PatientBottomProvider()),
      ],
      child: VirtuDocApp(),
    ),
  );
  //TODO change to stage
  ApiUrl.baseUrl = ApiUrl.baseUrlProd;
  runApp(configuredApp);
}

class VirtuDocApp extends StatefulWidget {
  @override
  _VirtuDocAppState createState() => new _VirtuDocAppState();
}

class _VirtuDocAppState extends State<VirtuDocApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppointmentProvider>(
          create: (context) => AppointmentProvider(),
        ),
        ChangeNotifierProvider<LabTestProvider>(
          create: (context) => LabTestProvider(),
        ),
        ChangeNotifierProvider<PatientNotificationProvider>(
          create: (context) => PatientNotificationProvider(),
        ),
        ChangeNotifierProvider<PrescriptionProvider>(
          create: (context) => PrescriptionProvider(),
        ),
        ChangeNotifierProvider<CreatePrescriptionProvider>(
          create: (context) => CreatePrescriptionProvider(),
        ),
        ChangeNotifierProvider<DoctorNotificationProvider>(
          create: (context) => DoctorNotificationProvider(),
        ),
        ChangeNotifierProvider<LocationProvider>(
          create: (context) => LocationProvider(),
        ),
        ChangeNotifierProvider<BookingProvider>(
          create: (context) => BookingProvider(),
        ),
        ChangeNotifierProvider<PhoneVerificationProvider>(
          create: (context) => PhoneVerificationProvider(),
        ),
        ChangeNotifierProvider<EnrollmentProvider>(
          create: (context) => EnrollmentProvider(),
        ),
        ChangeNotifierProvider<EnrollmentProviderUpdate>(
          create: (context) => EnrollmentProviderUpdate(),
        ),
        ChangeNotifierProvider<PersonalModelProvider>(
          create: (context) => PersonalModelProvider(),
        ),
        ChangeNotifierProvider<MedicalModelProviders>(
          create: (context) => MedicalModelProviders(),
        ),
        ChangeNotifierProvider<SelectSpecialityProvider>(
          create: (context) => SelectSpecialityProvider(),
        ),
        ChangeNotifierProvider<SpecialityProviderUpdate>(
          create: (context) => SpecialityProviderUpdate(),
        ),
        ChangeNotifierProvider<FamilyHisotryProvider>(
            create: (context) => FamilyHisotryProvider()),
        ChangeNotifierProvider<BasicModelProvider>(
            create: (context) => BasicModelProvider()),
        ChangeNotifierProvider<ChangePasswordProvider>(
            create: (context) => ChangePasswordProvider()),
        ChangeNotifierProvider<DoctorDetailProvider>(
            create: (context) => DoctorDetailProvider()),
        ChangeNotifierProvider<TimeSlotProvider>(
            create: (context) => TimeSlotProvider()),
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider()),
        ChangeNotifierProvider<UpdateLangProvider>(
            create: (context) => UpdateLangProvider()),
        ChangeNotifierProvider<NotificationSettingProvider>(
            create: (context) => NotificationSettingProvider()),
        ChangeNotifierProvider<DoctorTransactionsProvider>(
            create: (context) => DoctorTransactionsProvider()),
        ChangeNotifierProvider<PatientTransactionsProvider>(
            create: (context) => PatientTransactionsProvider()),
        ChangeNotifierProvider<HelpProvider>(
            create: (context) => HelpProvider()),
        ChangeNotifierProvider<PostVisitProvider>(
            create: (context) => PostVisitProvider()),
        ChangeNotifierProvider<PlaceOrderProvider>(
            create: (context) => PlaceOrderProvider()),
        ChangeNotifierProvider<GiveFeedbackProvider>(
            create: (context) => GiveFeedbackProvider()),
        ChangeNotifierProvider<RatingFeedbackProvider>(
            create: (context) => RatingFeedbackProvider()),
        ChangeNotifierProvider<CalenderProvider>(
            create: (context) => CalenderProvider()),
        ChangeNotifierProvider<SetAvailabilityProvider>(
            create: (context) => SetAvailabilityProvider()),
        ChangeNotifierProvider<WalletProvider>(
            create: (context) => WalletProvider()),
        ChangeNotifierProvider<PostVisitDetailsProvider>(
            create: (context) => PostVisitDetailsProvider()),
        ChangeNotifierProvider<PostVisitListProvider>(
            create: (context) => PostVisitListProvider()),
        ChangeNotifierProvider<GetSupportedPaymentMethods>(
            create: (context) => GetSupportedPaymentMethods()),
        ChangeNotifierProvider<ListPaymentMethod>(
            create: (context) => ListPaymentMethod()),
        ChangeNotifierProvider<IsBookingProvider>(
            create: (context) => IsBookingProvider()),
        ChangeNotifierProvider<PatientBottomProvider>(
            create: (context) => PatientBottomProvider()),
        ChangeNotifierProvider<SpecialityProvider>(
            create: (context) => SpecialityProvider()),
        ChangeNotifierProvider<VideoCallProvider>(
            create: (constext) => VideoCallProvider()),
        ChangeNotifierProvider<ChatProvider>(
            create: (constext) => ChatProvider()),
        ChangeNotifierProvider<OrdersListingProvider>(
            create: (constext) => OrdersListingProvider())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/bookAppointment': (context) => BookAppointment(),
          },
          home: buildSplashScreen()),
    );
  }

  SplashScreen buildSplashScreen() {
    return SplashScreen(
        routeName: '/',
        seconds: 3,
        navigateAfterSeconds: PreferenceUtils.getBool(PreferenceKeys.IS_LOGIN)
            ? PreferenceUtils.getString(PreferenceKeys.ROLE) == 'DOCTOR'
                ? PreferenceUtils.getBool(PreferenceKeys.PHONE_VERIFICATION)
                    ? doctorWidget()
                    : PhoneVerification(
                        PreferenceUtils.getString(PreferenceKeys.ROLE))
                : PreferenceUtils.getString(PreferenceKeys.ROLE) == 'PATIENT'
                    ? PreferenceUtils.getBool(PreferenceKeys.PHONE_VERIFICATION)
                        ? patientWidget()
                        : PhoneVerification(
                            PreferenceUtils.getString(PreferenceKeys.ROLE))
                    : PreferenceUtils.getBool(PreferenceKeys.IS_LOGIN)
                        ? ChooseRoleScreen()
                        : LoginScreen()
            : WelcomeScreen(),
        imageBackground: AssetImage("assets/images/new_doc.png"),
        styleTextUnderTheLoader: TextStyle(),
        photoSize: 100.0,
        onClick: () => {},
        loaderColor: Colors.blue);
  }

  StreamBuilder<Response> doctorWidget() {
    return StreamBuilder(
      stream: getUser().asStream(),
      builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
        if (snapshot.data == null)
          return Scaffold(
            body: Container(
              child: Center(
                child: Text(
                  errorMessage,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        else if (snapshot.hasData &&
            jsonDecode(snapshot.data.body)['status'] == 401) {
          PreferenceUtils.clear();
          return LoginScreen();
        } else if (snapshot.hasData &&
            jsonDecode(snapshot.data.body)['body']['data']['user_profile']
                        ['completed_steps']
                    .length <
                3) {
          PreferenceUtils.putInt(
              PreferenceKeys.INDICATOR,
              jsonDecode(snapshot.data.body)['body']['data']['user_profile']
                      ['completed_steps']
                  .length);

          return EnrollmentDetailUpdate(
              completeStep: jsonDecode(snapshot.data.body)['body']['data']
                      ['user_profile']['completed_steps']
                  .length);
        } else if (snapshot.hasData &&
            jsonDecode(snapshot.data.body)['body']['data']['user_profile']['completed_steps']
                    .length == 3) {
          return BottomNavbar();
        } else
          return Scaffold(
            body: Center(child: Text(Strings.unknownError)),
          );
      },
    );
  }

  StreamBuilder<Response> patientWidget() {
    return StreamBuilder(
      stream: getUser().asStream(),
      builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
        if (snapshot.data == null)
          return Scaffold(
            body: Container(
              child: Center(
                child: Text(
                  errorMessage,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        else if (snapshot.hasData &&
            jsonDecode(snapshot.data.body)['status'] == 401) {
          PreferenceUtils.clear();
          return LoginScreen();
        } else if (snapshot.hasData &&
            jsonDecode(snapshot.data.body)['body']['data']['user_profile']
                        ['completed_steps']
                    .length == 0) {
          return BasicInfo();
        } else if (snapshot.hasData &&
            jsonDecode(snapshot.data.body)['body']['data']['user_profile']
                        ['completed_steps']
                    .length ==
                1) {
          return SignUpScreen();
        } else
          return PatientBottomNavbar();
      },
    );
  }

  String errorMessage = Strings.noInternet;

  Future<Response> getUser() async {
    try {
      var res = await ApiRequest.getApi(ApiUrl.getUser);
      return res;
    } on HandshakeException {
      errorMessage = Strings.contactAdmin;
      return null;
    } on SocketException {
      errorMessage = Strings.noInternet;
      return null;
    }
  }
}
