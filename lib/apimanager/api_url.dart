class ApiUrl {
  // dev
  // static String baseUrl = 'http://13.89.223.96/';
  // stage url
  static String baseUrl = '';
  static String baseTestDev = 'http://3.224.100.46/';
  static String baseUrlStage = 'http://stage-api.myvirtudoc.com/';
  static String baseUrlProd = 'https://api.myvirtudoc.com/';
  static String suffixPart = '$baseUrl' + 'api/v1/';
  static String login = '$suffixPart' + 'user/login';
  static String resetPassword = '$suffixPart' + 'user/resetPassword';
  static String changePassword = '$suffixPart' + 'user/changePassword';
  static String phoneVerifaction = '$suffixPart' + 'user/phoneVerifaction';
  static String verifyOtp = '$suffixPart' + 'user/verifyOtp';
  static String updateDetails = '$suffixPart' + 'user/updateDetails';
  static String logout = '$suffixPart' + 'user/logout';
  static String fileUpload = '$suffixPart' + 'common/fileUpload';
  static String multifileUpload = '$suffixPart' + 'common/multipleUpload';
  static String resendOtp = '$suffixPart' + 'user/resendOtp';
  static String googleLogin = '$suffixPart' + 'user/googleLogin';
  static String facebookLogin = '$suffixPart' + 'user/facebookLogin';
  static String appleLogin = '$suffixPart' + 'user/appleLogin';
  static String getUser = '$suffixPart' + 'user/getProfile';
  static String emailVerification = '$suffixPart' + 'user/resendVerifyMailLink';
  static String setNewPassword = '$suffixPart' + 'user/setNewPassword';
  static String setRole = '$suffixPart' + 'user/setRole';
  static String getSpeciality = '$suffixPart' + 'common/specialtyList';
  static String approvedDoctorList = '$suffixPart' + 'doctor/approvedList?';
  static String appointmentList = '$suffixPart' + 'common/appointmentList';
  static String appointmentDetail = '$suffixPart' + 'common/appointmentDetails';
  static String transactionDoctorList =
      '$suffixPart' + 'doctor/listTransactions';

  static String chatStageUrl = 'http://stage-api.myvirtudoc.com:3000';
  static String chatProdUrl = 'https://api.myvirtudoc.com';

  static String privacyPolicy = 'https://www.abyssiniatech.com/?page_id=3';

  static String termsAndCond = 'https://www.abyssiniatech.com/?page_id=310';

  static String getAppointmentList(requestType, page) =>
      '$suffixPart' +
      'common/appointmentList?request_type=$requestType&page=$page&page_size=10';

  // static String postVisitList = '$suffixPart' + 'doctor/postVisitList';
  static String getPostVisitList(patientId, int page) =>
      '$suffixPart' +
      'doctor/postVisitList/$patientId?&page=$page&page_size=10';
  static String postVisitDetails = '$suffixPart' + 'doctor/postVisitDetails';
  static String transactionPatientList =
      '$suffixPart' + 'patient/listTransactions';
  static String getFaq = '$suffixPart' + 'common/getFaq';

  static String getDoctorFeedback(doc, int page) =>
      '$suffixPart' + 'doctor/listFeedback/$doc?&page=$page&page_size=10';
  static String reportFeedback = '$suffixPart' + 'common/reportFeedback';
  static String getNotification = '$suffixPart' + 'user/getNotification';
  static String clearNotification = '$suffixPart' + 'user/clearNotification';
  static String setupPaymentWallet =
      '$suffixPart' + 'payment/setupWalletAccount';
  static String getWalletAmount = '$suffixPart' + 'payment/getWalletAmount';

  static String getPaymentUri(doctorId) =>
      '$suffixPart' + 'user/getPaymentUri?doctor_id=$doctorId';

  static String addMoneyToWallet = '$suffixPart' + 'payment/addMoneyToWallet';
  static String addPaymentMethod = '$suffixPart' + 'payment/addPaymentMethod';
  static String deletePayment = '$suffixPart' + 'payment/deletePaymentMethod';
  static String getSupportedPaymentMethods =
      '$suffixPart' + 'payment/getSupportedPaymentMethods?country=US';
  static String listPaymentMethods =
      '$suffixPart' + 'payment/listPaymentMethods';
  static String unreadNotification =
      '$suffixPart' + 'user/unreadNotificationcount';

  static String prescriptionDetail =
      '$suffixPart' + 'patient/prescriptionDetail';

  static String getCountry = suffixPart + 'common/getCountries';

  static String getDoctorDetails(doctorId) =>
      '$suffixPart' + 'doctor/$doctorId';

  static String getFeedbackList(doctorId, page) =>
      '$suffixPart' + 'doctor/listFeedback/$doctorId?page=$page&page_size=10';

  static var bookAppoitment = '$suffixPart' + 'patient/bookAppointment';

  static String getDoctorAvailablity(date, doctorId) =>
      '$suffixPart' +
      'patient/viewDoctorAvailability?date=$date&doctor_id=$doctorId';

  static String postVisitForm = '$suffixPart' + "doctor/postVisit";

  static String getRequisitionType(type) =>
      '$suffixPart' +
      "requisition/requisitionListByType?requisition_type=$type";
  static String postPlaceOrder =
      '$suffixPart' + "requisition_order/create_order";

  static String giveFeedback = "$suffixPart" + "patient/giveFeedback";

  static String getCalenderView(date) =>
      "$suffixPart" + "doctor/monthlyCalanderView?date=$date";

  static String setAvailability = "$suffixPart" + "doctor/setAvailability";
  static String setUnAvailability = "$suffixPart" + "doctor/markAsUnavailable";

  static String getRegion = "$suffixPart" + 'common/getRegions';
  static String getCitiesByRegion = "$suffixPart" + 'common/getCitiesByRegion';
  static String getLocalitiesByCity =
      "$suffixPart" + 'common/getLocalitiesByCity';

  static String actionOnAppointment =
      "$suffixPart" + "common/actionOnAppointment";

  static String updateNotification = "$suffixPart" + "user/updateNotification?";

  static String videocall = "$suffixPart" + "doctor/initiateCall";

  // requisitons
  static String getOrdersListing(page) =>
      "$suffixPart" + "requisition_order/open_orders?page=$page&page_size=10";

  static String deleteOrderRequisition(orderId) =>
      "$suffixPart" + "requisition_order/delete_order/$orderId";

  static String editOrderRequisition(orderId) =>
      "$suffixPart" + "requisition_order/edit_order/$orderId";

  static String getOpenOrderCount =
      "$suffixPart" + "requisition_order/open_orders_count";

  static const String jitsiServerUrl = 'https://meet.jit.si/';
}
