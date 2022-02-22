import 'dart:ui';

import 'package:virtudoc_app/utils/custom-colors.dart';

class Strings {
  //error
  static const String dbError = 'Database Error';

  //welcome page
  static const String logInBtn = 'Log in';
  static const String signUpBtn = 'Sign up';
  static const String appName = 'VirtuDoc';
  static String copyrights =
      '© ${DateTime
      .now()
      .year} VirtuDoc All Rights Reserved';

  // Choose Lang
  static const String continue_lang = "Continue with:";
  static const String choose_lang = "Choose Language";

  static const String update_lang = "Update Language";
  static const String update = "Update";

//gender
  static const String female = "Female";
  static const String male = "Male";

// welcome
  static const String letsgo = "Let's Go";

  //Choose Patient doctor
  static const String novisitforms = "No visit forms are there";
  static const String back = "Back";
  static const String choose_role = "Choose Role";
  static const String register_as = "Register as:";
  static const String doctor_detail = "Doctor Detail";
  static const String patient = "Patient";
  static const String amharic = "Amharic";
  static const String english = "English";
  static const String doctor = "Doctor";
  static const String txt_continue = "CONTINUE";
  static const String have_account = "Already have an account?";
  static const String login_now = "Login NOW!";

  static const String email = "Email Address";
  static const String email_txt = "Email:";
  static const String emailNotVerified = "Email not verified";
  static const String emailVerified = "Email verified";
  static const String phoneNumber = "Phone Number";

  static const String date_and_time = "Date & Time:";

//Login page
  static const String login = "Login";
  static const String sendCode = "SEND CODE";
  static const String verify = "VERIFY";
  static const String phoneVerification = "Phone Verification";
  static const String submit = "SUBMIT";
  static const String delete = "Delete";
  static const String delete_req = "Delete requisition";
  static const String delete_req_txt = "Do you want to delete the requisition";
  static const String delete_payment_method = "Delete Payment Method";
  static const String delete_payment_method_txt =
      "Are you sure you want to delete this payment method?";
  static const String success = "Success";
  static const String appointment_cancelled =
      "Appointment cancelled successfully";
  static const String appointment_cancelled_txt = "Appointment cancelled";
  static const String cancel = "Cancel";
  static const String mailSent = "Mail Sent";
  static const String verificationMail =
      "A verification link has been sent to the email id";
  static const String appointment_cancelled_question =
      "Do you want to cancel the appointment?";
  static const String cancelled_appointment = "Cancel appointment?";
  static const String card_added_success = "Card added successfully";
  static const String card_deleted_success = "Card deleted successfully";
  static const String add_balance = "Add Balance";
  static const String manage_cards = "Manage Cards";
  static const String marital_status = "Marital Status";
  static const String login_to_access = "Login to access your info:";
  static const String phoneVerificationText =
      "We need to verify your phone number";
  static const String i_agree = "I agree to the ";
  static const String verificationCode =
      "Enter the verification code we sent you:";
  static const String terms_n_conditions = "Terms and Conditions";
  static const String password = "Password";
  static const String confPassword = "Confirm Password";
  static const String setPassword = "Set Password";
  static const String newPasswordText = "Enter your new Password";
  static const String wallet_balance = "Available balance in your wallet";
  static const String amount_earned = "Amount Earned";
  static const String available_balance = "Available Balance";
  static const String forgot_password = "Forgot Password?";
  static const String forgot_password_title = "Forgot Password";
  static const String or_login_with = "Or login with:";
  static const String or_register_with = "Or register with:";
  static const String or_signup_with = "Or Signup with:";
  static const String otcText =
      "Enter your phone number and click SEND CODE and we'll text you one time code (OTC)";
  static const String didntreceive = "Didn't receive the code we sent?";
  static const String resendcode = "Resend Code";
  static const String resendVerification = "Resend Verification";
  static const String dont_have_account = "Don’t have an account yet?";
  static const String already_have_account = "Already have an account";
  static const String sign_up_now = "Signup NOW!";
  static const String forgotPasswordTextMail =
      "Your email address need to be verified using the link we emailed to the address";

  // static const String forgotPasswordTextMail =
  //     "Enter your email address and we'll send you a link to reset your password";
  static const String forgotPasswordTextNumber =
      "Enter your phone number and we'll send you a OTP to reset your password";

  static const String enter_otp = "Please enter OTP";

//  enrollment detail
  static const String years_of_experience = "Years of Experience";
  static const String speciality = "Speciality";

  // static const String enrollment_detail = "Enrollment Detail";
  static const String sub_speciality = "Sub-speciality";
  static const String social_security_number = "Social Security Number (SSN)";
  static const String drivers_license_number = "Government Issued ID Number";
  static const String issuing_country = "Issuing Country";
  static const String issuing_state = "State Licenced to Practice";
  static const String us_dea_license_number = "DEA License Number";
  static const String language_spoken = "Language(s) Spoken";
  static const String country_licensed_to_practice =
      "Country Licensed to Practice";
  static const String additional_information = "Additional Information";
  static const String additional_clinical_data = "Additional Clinical Data";

  static const String amount = "Amount";

  static const String dashboard = "Dashboard";

  static const String edit_profile = "Edit Profile";
  static const String edit_order = "Edit Order";

  static const String card_holder_name = "Card Holder Name";
  static const String card_number = "Card Number";
  static const String cvv = "CVV";
  static const String expiration_month = "Expiration Month";
  static const String expiration_year = "Expiration Year";

  //Sign up

  static const String profile_info = "Profile Info";
  static const String profile = "Profile";
  static const String finance = "Finance";
  static const String select_speciality = "Select Speciality";
  static const String transaction_history = "Transaction History";
  static const String add_money = "Add";
  static const String add_money_txt = "Add Money";
  static const String add_money_question = "Do you want to add money";
  static const String throttle_amount = "Throttle Amount";
  static const String throttle_info =
      "This throttle amount will be credited into your wallet once reach upto limit \$500";
  static const String see_your_recent_transactions =
      "See your recent transactions:";
  static const String wallet = "Wallet";
  static const String personal_history = "Personal History";
  static const String personal_history_text =
      "Please tell us about your personal history";
  static const String enter_amount_text =
      "Please enter amount to add in your wallet:";
  static const String basic_info = "Basic Info";
  static const String select_your_city = "Select Your City";
  static const String usercurrent_location = "Use my current location";
  static const String enable_location_text =
      'Enabling location services will allow us to match you with the service providers more effectively';
  static const String enrollment_details = "Enrollment Detail";
  static const String search_city = "Search City";
  static const String pleaseTellUsMoreAboutYourself = "Tell us more about you";
  static const String gender = "Gender";
  static const String fname = "First Name";
  static const String lname = "Last Name";
  static const String house = "House";
  static const String city = "City";
  static const String subcity = "Sub-city";
  static const String region = "Region";
  static const String dob = "Date of Birth";
  static const String height = "Height";
  static const String weight = "Weight";

  static const String done = "Done";
  static const String booking_successful = "Appointment booked successfully ";
  static const String not_connected = "Please check internet connection";

  static const String book_appointment = "Book Appointment";
  static const String no_appointment = "No Appointment";
  static const String next = "NEXT";
  static const String enable_location = "Enable Location";

  static const String header_home = "WELCOME BACK, ";
  static const String header_home_patient = "WELCOME BACK, ";
  static const String make_appointments = "Make Appointment";
  static const String check_wallet = "Check Wallet";
  static const String make_payment = "Make Payment";
  static const String update_documents = "Update Documents";
  static const String review_feedback = "Review Feedback";
  static const String referrals = "Referrals";
  static const String chat = "Chat";
  static const String feedbacks = "Feedbacks";
  static const String noFeedbacks = "No Feedbacks";
  static const String give_feedbacks = "Give Feedback";
  static const String sub_header_home = "What do you want to do today?";

// specialist
  static const String dental_care = "Dental\nCare";
  static const String ent_care = "Ent\nCare";
  static const String eye_care = "Eye\nCare";
  static const String child_care = "Child\nCare";
  static const String ortho_care = "Orthopedic\nCare";
  static const String neuro_care = "Neuro\nCare";
  static const String skin_care = "Skin\n& Hair Care";
  static const String women_care = "Women\nCare";
  static const String general_care = "General\nCare";
  static const String sex_care = "Sex\nSpecialist";

  static var locationList = [
    'Addis Ababa',
    'Mekelle',
    'Gondar',
    'Adama',
    'Hawassa',
    'Bahir Dar',
    'Dire Dawa',
    'Sodo',
    'Dessie'
  ];

  static var genders = {"Male", "Female"};
  static var countries = {Strings.eithopia, Strings.usa};
  static var country = "country";
  static var specialitys = {
    "Doctor of Medicine",
    "Doctor of Osteopathic Medicine",
    "Doctor of Philosophy"
  };

  static var languageSpoken = {
    Strings.english,
    Strings.amharic,
    'French',
    'Italian',
    'Chinese',
    'Arabic',
    'Afaan Oromoo',
    'Tigrina'
  };
  static var states = {"StateA", "StateB", "StateC"};

//doctor model
  static const String location = "Location:";
  static const String fee = "Consultation Fee:";
  static const String yearsExperience = "Years experience";

//find doctor

  static const String findDoctors = "Find Doctors";
  static const String searchByName = "Search by name";
  static const String search_here = "Search here";

// find doctor modal

  static const String clearAll = "Clear All";
  static const String apply = "Apply";

  //filter doctor

  static const String filterDoctors = "Filter Doctors";

  static const String language = "Language(s) spoken";
  static const String rating = "Rating";
  static const String sex = "Sex";
  static const String experience = "Experience";
  static const String rating_0_1 = "0-1";
  static const String rating_1_2 = "1-2";
  static const String rating_2_3 = "2-3";
  static const String rating_3_4 = "3-4";
  static const String rating_4_5 = "4-5";
  static const String year_0_5 = "0-5 Years";
  static const String year_5_10 = "5-10 Years";
  static const String year_10_15 = "10-15 Years";
  static const String year_15_20 = "15-20 Years";
  static const String year20 = "20+ Years";

  static const String years = "Years";
  static const String old = "old";

  // select time slot
  static const pharmacyOrder = "Pharmacy\norder";

  // static const String selectTimesSlot = "Select a Time Slot";
  static const String selectTimesSlot = "Select a Time";

  //book appointment
  static const String bookAppointment = "Book Appointment";
  static const String patientName = "Patient Name:";
  static const String purposeOfVisit = "Purpose of Visit:";
  static const String purpose = "Purpose:";
  static const String selectPurpose = "Select Purpose";

  // static const String appointmentSlot = "Appointment Slot:";
  static const String appointmentSlot = "Appointment Time:";
  static const String appointment = "Appointment ";
  static const String newappointment = "New Appointment ";
  static const String appointment_detail = "Appointment Detail";
  static const String settings = "Settings";
  static const String consultationFee = "Consultation Fee:";
  static const String preovideAdditionalInfo =
      "Provide Additional Information:";

  // make payment
  static const String makePayment = "Make Payment";
  static const String availableBalance = "Available Balance";
  static const String set_availability = "Set Availability";
  static const String payingText = "You are paying to ";
  static const String paymentButtonText = "PAY";

  // payment methods
  static const String payment_methods = "Payment Methods";
  static const String add_card = "Add Card";
  static const String payment_methods_text =
      "Please choose a payment method to add balance in your wallet";

  static const String share = "Share";
  static const String invite_a_friend = "Invite A Friend";

  // payment request
  static const String paymentRequest = "Payment Request";
  static const String dialogText1 = "Medicare Pharmacy has requested\n";
  static const String dialogText2 =
      " for your medicine order.\nTap on accept to pay.";
  static const String accept = "Accept";
  static const String reject = "Reject";

  static const List<String> maritalStatusList = [
    Strings.single,
    Strings.married,
    Strings.divorced,
    Strings.seperated,
    Strings.widowed
  ];

  static const String single = 'Single';
  static const String married = 'Married';
  static const String divorced = 'Divorced';
  static const String seperated = 'Seperated';
  static const String widowed = 'Widowed';

  static String children = 'children';

  static String maritalStatus = 'marital_status';

  static String enterFeedback = "Please enter your feedback:";

  static String drugKey = 'drugs';
  static String somkeKey = 'somke';

  static var childrenText = 'How many children?';

  static var doHaveChildren = "Do you have children?";

  static var timeAgo = 'How long ago?';

  static String addMembers = 'Add members';

  static const String common = 'common';
  static const String action = 'action';

  static const String languageKey = 'language';
  static const String locationKey = 'location';

  static const String no = 'No';
  static const String yes = 'Yes';

  static const List<String> intro = [
    Strings.intoText1,
    Strings.introText2,
    Strings.intoText3
  ];

  static const String intoText1 =
      "See your doctor safely anytime, anywhere. Virtual doctor visits made available at your fingertips";

  static const String introText2 =
      "Get your prescriptions and other medical needs met right through VirtuDoc";

  static const String intoText3 =
      "Pay for all of it right through our app using your stored credit card or wallet";

  static const String confBooking = "Confirm Booking";

  static String clearNotifications = 'Clear Notifications';

  static String clearNotificationText =
      'This will clear all the notiifcations for your account. Do you want to continue?';

  static String noInternet = 'No internet connection.\nPlease try again';

  static String unknownError = "Unknow error occured. Try again later.";

  static String wereda = 'Wereda';

  static String undergraddoc = 'undergraduate_degree_doc';

  static String medicalSchoolDoc = 'medical_school_degree_doc';

  static String residencyDoc = 'residency_doc';
  static String specialityDoc = 'speciality_doc';
  static String subspecialityDoc = 'sub_speciality_doc';

  static String nationalLicenceDoc = 'national_license_doc';

  static String fellowShipDoc = 'fellowship_doc';

  static String digitalSigDoc = 'digital_signature_doc';

  static String stateLicencedToPractice = 'States Licenced To Practice';
  static String languageSpokenText = 'Languages spoken';

  static String status = "Status";

  static String completeYourProfile = "Please complete your profile";

  static const String supportEmail = 'support@myvirtudoc.com';

  static const String contactSupportText = "Contact your support team at ";

  static var selectOtherSpecialties = 'Select other specialities';

  static String contactAdmin = 'Certificate expired. Please contact admin';
  static String pleaseAddSubSpeciality = 'Please add sub speciality info image';
  static String pleaseAddSpeciality = 'Please add speciality info image';
  static String pleaseAddResidency = 'Please add Medical License info image';
  static String pleaseAddMedicalSchool = 'Please add medicalSchool image';
  static String subSpeciality = 'Sub Speciality';
  static String residency = 'Medical License';
  static String medicalSchoolDegree = 'Medical School Degree';
  static String pleaseAddPostGrad = 'Please add Post Graduate degrese';
  static String pleaseAddUnderGrad = 'Please add Under Graduate degree';
  static String pleaseAddSSN = 'Please add SSN';
  static String pleaseAddValidSSN = 'Please add valid SSN';
  static String pleaseAddExp = 'Please add experience';
  static String experienceCantbe0 = "Experience can't be 0";
  static String experienceCantbeNeg = "Experiecne can't be negative";
  static String ssnCantbe0 = "SSN can't be 0";
  static String ssnCantbeNeg = "SSN can't be negative";
  static String drivingLicenceCantbe0 = "Driving licence no. can't be 0";
  static String drivingLicenceCantbeNeg =
      "Driving licence no. can't be negative";
  static String pleaseAddIssuingCounty = 'Please add issuing conuntry';
  static String pleaseAddIssuingState = 'Please add issuing state';
  static String pleaseAddDea = 'Please add DEA';
  static String pleaseAddValidDea = 'Please add valid DEA';
  static String deaCantbe0 = "DEA no. can't be 0";
  static var deaCantbeNeg = "DEA no. can't be negative";
  static String pleaseAddLanguage = 'Please add languagse';
  static String pleaseAddCountryLicencetoPrac = 'Please add country licence';
  static String pleaseUpdateSpeciality = 'Please update Speciality';
  static String videocall = 'videocall';
  static const String chars = 'abcdefghijklmnopqrstuvwxyz';
  static String logoutText = 'Do you want to log out of the application?';

  static String usdebitiscovercard = 'us_debit_discover_card';

  static String usmastercard = 'us_mastercard_card';

  static String usatmdebitcard = 'us_atmdebit_card';

  static String inactive = 'Inactive';

  static String rejected = 'Rejected';

  static String pending = 'Pending';

  static String active = 'Active';

  static String faqs = 'FAQs';

  static String cms = " cms";
  static String ins = " In";
  static String kgs = " kgs";
  static String lbs = " lbs";

  static String medicationAllergy = 'Medication Allergy';

  static String wishToMoveBack = 'Do you wish to move back?';

  static String onMovingBack =
      'The data will not be saved if you moved back. Continue to move back?';

  static String commingSoon = "Coming soon";

  static String feedback_text(name) =>
      "How was your experience with Dr. $name?";

  static const String avgRating = "Average Rating:";

  static const String familyHistory = "Family History";
  static const String familyHistoryText =
      "Please tell us about your family history:";

  //filter message
  static const String addFilterMssg = "Please add filter";

  // medical history
  static const String medicalHistory = "Medical History";
  static const String medicalHistoryText =
      "Please tell us about your medical history:";

  static const String howLong = "How long ago (in months)?";

  static List<String> familyList = [
    'Mother',
    'Father',
    'Sister',
    'Brother',
    'Aunt',
    'Uncle',
    'Grandfather',
    'Grandmother',
  ];
  static List<int> monthsFullList = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20
  ];
  List<int> childrenList = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  //my calender
  static const String myCalendar = "My Calendar";

  static const String medicalEmergency = "Medical Emergency";
  static const String emergencyText =
      "Contact your local emergency\nmedical service IMMEDIATELY.";

// doc availability and unavailability
  static const String setAvailability = "Set Availability";
  static const String setUnavailability = "Set Unavailability";
  static const String enterStartDateTime =
      "Please enter available start date & time:";
  static const String startDate = "Start Date";
  static const String endDate = "End Date";
  static const String enterEndDateTime = "Please enter available end time:";
  static const String repeatAvailability = "Repeat Availability";
  static const String repeatText =
      "Weekly on Wednesday and Friday, until 28 July 2020";

  static String save = "SAVE";

  static String startTime = "Start Time";
  static const String endTime = "End Time";

  static const String availableOn = 'Availability on...';
  static const String unavailableOn = 'Unavailability on...';

  static const String feedback = "Please enter your feedback:";

  // custom recurrence
  static const String customRecurrence = "Custom Recurrence";
  static const String repeatOn = "Repeat on day:";
  static const String repeatEnd = "Repeat end:";
  static const String never = "Never";
  static const String daily = "Daily";
  static const String weekly = "Weekly";
  static const String onADay = "On a day";
  static const List<int> daysList = [0, 1, 2, 3, 4, 5, 6];
  static String selectText = "What do you want to set?";
  static String available = "Available";
  static String unavailable = "UnAvailable";
  static const String recurringType = "Recurring Type";
  static const String recurringError = "Select days to set custom recurrence";

  //create-prescription
  static String createPrescription = "Finish Appointment";
  static const String patientAge = "Age:";
  static const String patientGender = "Gender:";
  static const String patientHeight = "Height:";
  static const String patientWeight = "Weight:";
  static const String additionalInfo = "Additional Information: ";
  static const String prescription = "Prescription";
  static const String drugName = "Medicine\nName";
  static const String drugUnit = "Units";
  static const String drugdosage = "Dosage\n(Per day)";
  static const String create = "Create";
  static const String addRow = "+ Add Row";
  static const String removeRow = "- Remove Row";

// notification
  static const String notification = "Notification";
  static const String youveAppointment = "You've an appointment with ";
  static const String daysAgo = "day ago";
  static const String rateAppointment = "Rate your appointment with ";

//My Prescription
  static const String history = "History";
  static const String prescLocation = "Location: ";
  static const String prescDateTime = "Date & Time: ";
  static const String visitHistoryDetail = "History Detail";
  static const String scheduleAnotherMeeting = "Schedule Again";

// "Prescription Detail"
  static const String prescriptionDetailhead = "Prescription Detail";
  static const String consultDetials = "Consultation Details ";
  static const String pharmacyDetials = "Pharmacy Details: ";
  static const String contact = "Contact: ";
  static const String address = "Address: ";
  static const String prescDetails = "Prescription Details: ";

  static String imperial = 'Imperial';
  static String metric = 'Metric';

  static List<String> unitList = [Strings.imperial, Strings.metric];

  //personal history
  static const String smoke = "Do you smoke/chew tobacco?";
  static const String drink = "Do you drink alcohol?";
  static const String drugs = "Do you use illicit drugs?";
  static String addDrugType = 'Add Drug Type';
  static String packsPerWeek = 'How many packs or cans per week?';
  static String drinksPerWeek = 'How many drinks per week?';
  static String howManyChilderen = 'How many children?';
  static String drugsTypes = 'Select type of illicit drugs you use.';
  static const List<String> drugsList = [
    'Ayahuasca',
    'Cocaine',
    'DMT',
    'GHB',
    'Hallucinogens',
    'Heroin',
    'Khat',
    'Marijuana',
    'Other'
  ];

  //actions-patienrt
  static const String actionBiometrics = 'biometrics';
  static const String actionSetPasswordPatient = 'set_password';
  static const String actionAboutMe = 'about_me';
  static const String actionPersonalHistory = 'personal_history';
  static const String actionMedicalHistory = 'medical_history';
  static const String actionFamilyHistory = 'family_history';

  //actions-doctor
  static const String actionSetPasswordDoctor = 'set_password';
  static const String actionEnroll1 = 'enrollment_step_1';
  static const String actionEnroll2 = 'enrollment_step_2';
  static const String actionEnroll3 = 'enrollment_step_3';

  //medical history
  static const String heartDisease = "Heart disease?";
  static const String cancer = "Cancer?";
  static const String diabities = "Diabetes?";
  static const String copd = "COPD (chronic obstructive pulmonary disease)?";
  static const String kidney = "Kidney Disease?";
  static const String highblood = "High blood pressure?";
  static const String asthama = "Asthma?";
  static const String hospitalization = "Hospitalization?";

  //social-login-error
  static const String errorSocialLogin = "Error occured in social login";

  // reg exp
  static const String emailRegExp =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  static const String noResponse = 'No response form server';

  static String savingDetials = 'Saving details';

  static String errorUploadingImage = 'Error while uploading image';
  static String errorUploadingImages = 'Error while uploading images';

  // education
  static const List<String> postgrad = [
    'Doctor of Medicine (MD)',
    'Doctor of Osteopathic Medicine (DO)',
    'Doctor of Philosophy (PHD)'
  ];
  static const List<String> undergrad = [
    'Bachelor of Arts (BA)',
    'Bachelor of Science (BSC)'
  ];

  static const List<String> months = [
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12'
  ];

  static const String undergrade = 'Under Graduate';
  static const String postgrade = 'Post Graduate degree';

  static var eithopia = "Ethiopia";
  static var usa = "United States";
  static var address1 = "Address 1";
  static var address2 = "Address 2";
  static var state = "State";
  static var zipcode = "Zip Code";

  static List<String> sepcialityList = [
    "General Practice",
    "Obstetrics/Gynecology",
    "Dermatology",
    "Internal Medicine",
    "Pediatric Medicine",
    "Psychiatry",
    "Infectious Disease",
    "Cardiology",
    "Allergy/Immunology",
    "Otolaryngology",
    "Anesthesiology",
    "Pain Management",
    "Gastroenterology",
    "Osteopathic Manipulative Therapy",
    "Neurology",
    "Neurosurgery",
    "Ophthalmology",
    "Orthopedic Surgery",
    "Pathology",
    "Oral Surgery (dentists only)",
    "Corectal Surgery",
    "Pulmonary Disease",
    "Diagnostic Radiology",
    "Thoracic Surgery",
    "Geriatric Medicine",
    "Nephrology",
    "Hand Surgery",
    "Optometry",
    "Endocrinology",
    "Podiatry",
    "Rheumatology",
    "Pain Management",
    "Peripheral Vascular Disease",
    "Vascular Surgery",
    "Cardiac Surgery",
    "Addiction Medicine",
    "Hematology",
    "Neuropsychiatry",
    "Medical Oncology",
    "Surgical Oncology",
    "Radiation Oncology",
    "Emergency Medicine",
    "Interventional Radiology",
    "Gynecological/Oncology",
  ];

  //select speciality
  static var selectSpecialityDropDown = "Select Speciality";
  static var selectSpeciality = "Please Select Speciality";

  // doctor details
  static var consultationfee = "Consultation Fee: ";
  static var briefdescription = "Brief Description: ";
  static var showAll = "Show All";

  static var dateFormat = "dd MMMM";
  static var dateFormatNormal = "yyyy-MM-dd";
  static var dateFormatDff = "dd-MM-yyyy hh:mm a";
  static var dateFormatMM = "MMMM";
  static var dateFormatDD = "dd";
  static var dateFormatHH = "h";
  static var dateFormatmin = "mm";
  static var dateFormataa = "a";
  static var dateFormatYY = "yyyy";
  static String enterPhone = "Please enter phone number.";

  static String phoneNumLimit = "Phone number should have minimum 6 digits.";

  static String otpSent = 'OTP sent';

  static String enterPassword = 'Please enter password';

  static String invalidCredentials = "Invalid username or password";

  static String passValidation =
      "Password must have 8-15 characters comprising one caps, one small, one number and one special character from (!, @, #, \$, %, ^, &, *).";

  static var selectSource = "Select an option";

  static var camera = "Camera";

  static var gallery = "Gallery";

  static var help = "Help";
  static var helpUrl = "https://kb.myvirtudoc.com/";

  static var invitefriend = 'Invite Friends';

  static String noDoctorFound = "No doctor found";

  // post visit form
  static const String enterName = "Name";
  static const String enterAge = "Age";
  static const String enterPatientDetails = "Patient Details";
  static const String selectGender = "Please select gender";
  static const String selectVitalType = "Select vital type";
  static String postVisitHeader = "Post Visit Form";
  static String visitForms = "Visit Forms";
  static String patientInfo = "Patient info";
  static String historyPhysicalExam = "History and Physical Examination";
  static String chiefCompaint = "Chief Complaint";
  static String historyofPresentillness = "History of Present Illness";
  static String pastSurgicalHistory = "Past Surgical History";
  static String hospitalizationHistory = "Hospitalization History";
  static String pastVisitList = "Past Visit List";
  static String socialHistory = "Social History";
  static String allergy = "Allergy(ies)";
  static String review_of_system = "Review of System (ROS)";
  static String medication = "Medication";
  static String vitals = "Vital Signs";
  static String values = "Values";
  static String addNew = "Add New";
  static String typeHere = "Type here...";

  static String notDone = "Not  done...";

  static String doctorsNote = "Doctor's Note";
  static String remarks = "Remarks";
  static String visitType = "Visit Type";
  static String progressNote = "Progress Note";
  static String newPatient = "New Patient";
  static String reviewofSystems = "Review of System";
  static String constitutional = "Constitutional";
  static String constitutionalHint =
      "No Weight Change, No Fever, No Chills, No Night Sweats, No Fatigue, No Malaise";
  static String entMouth = "ENT/Mouth";
  static String entMouthHint =
      "No Hearing Changes, No Ear Pain, No Nasal Congestion, No Sinus Pain, No Hoarseness, No sore throat, No Rhinorrhea, No Swallowing Difficulty";
  static String cardiovascular = "Cardiovascular";
  static String cardiovascularHint =
      "No Chest Pain, No SOB, No PND, No Dyspnea on Exertion, No Orthopnea, No Claudication, No Edema, No Palpitations";
  static String respiratory = "Respiratory";
  static String respiratoryHint =
      "No Cough, No Sputum, No Wheezing, No Smoke Exposure, No Dyspnea";
  static String gastrointestinal = "Gastrointestinal";
  static String gastrointestinalHint =
      "No Nausea, No Vomiting, No Diarrhea, No Constipation, No Pain, No Heartburn, No Anorexia, No Dysphagia, No Hematochezia, No Melena, No Flatulence, No Jaundice";
  static String genitourinary = "Genitourinary";
  static String genitourinaryHint =
      "No Dysmenorrhea, No DUB, No Dyspareunia, No Dysuria, No Urinary Frequency, No Hematuria, No Urinary Incontinence, No Urgency, No Flank Pain, No Urinary Flow Changes, No Hesitancy";
  static String mosculoskeletan = "Mosculoskeletan";
  static String mosculoskeletanHint =
      "No Arthralgias, No Myalgias, No Joint Swelling, No Joint Stiffness, No Back Pain, No Neck Pain, No Injury History";
  static String skin = "Skin";
  static String skinHint =
      "No Skin Lesions, No Pruritis, No Hair Changes, No Breast/Skin Changes, No Nipple Discharge";
  static String neuro = "Neuro";
  static String neuroHint =
      "No Weakness, No Numbness, No Paresthesias, No Loss of Consciousness, No Syncope, No Dizziness, No Headache, No Coordination Changes, No Recent Falls";
  static String psych = "Psych";
  static String psychHint =
      "No Anxiety/Panic, No Depression, No Insomnia, No Personality Changes, No Delusions, No Rumination, No SI/HI/AH/VH, No ";
  static String hemeLymph = "Heme/Lymph";
  static String hemeLymphHint =
      "No Bruising, No Bleeding, No Transfusions History, No Lymphadenopathy";
  static String endocrine = "Endocrine";
  static String endocrineHint =
      "No Polyuria, No Polydipsia, No Temperature Intolerance";
  static String formSubmittedSuccessHeader = "Your form has been submitted";
  static String formSubmittedSuccessSubheader =
      "Thank you for completing this submission.";

  static String pleaseEnter(entered) => "Please enter $entered";
  static var vitalTypeList = {
    "Temperature(centigrade)",
    "Blood Pressure(mmHg)",
    "Pulse Rate(rate/min)",
    "Respiratory Rate(ate/min)",
    "SPOX(%)"
  };

  static const String update_profile = "Update Profile";
  static const String ok = "OK";

  //place order
  static const String placeOrderHeading = "Prescription/Requisition";
  static const String prescriptionOrRequisition =
      "Prescription or Requisition:";
  static const String prescriptionOrRequisitionSelect =
      "Select any of the above Prescription or Requisition";
  static const pharmacy = "Pharmacy";
  static const lab = "Lab";
  static const imaging = "Imaging Facility";
  static const imaging_txt = "Imaging";
  static const save_for_later = "Save card info for later";
  static const selectPharmacy = "Select Pharmacy";
  static const prescribedDrugs = "Prescribed Drug(s)";
  static const drugMedicineName = "Drug/Medicine Name";
  static const units = "Units";
  static const unit = "Unit";
  static const dossage = "Dossage\n(Per day)";
  static const selectLaboratory = "Select Laboratory";
  static const labRequisition = "Lab Requisition";
  static const labRequisitionselect = "select any of the Lab Requisition";
  static const bloodSugar = "Blood Sugar";
  static const withContrast = "With Contrast";
  static const cholesterol = "Cholesterol";
  static const stool = "Stool";
  static const selectImaging = "Select Imaging Facility";
  static const imagingRequisition = "Imaging Requisition";
  static const imagingType = "Imaging Type";
  static const bodyPart = "Body Part";
  static const addRowS = "Add Row";

  static String pleaseSelect(entered) => "Please $entered";
  static var imageingTypeList = {
    "XRay",
    "CT-Scan",
    "MRI",
    "Ultrasound",
    "Nuclear"
  };
  static var bodyPartList = {
    "Head",
    "Sinus",
    "Neck",
    "Left Shoulder",
    "Right Shoulder",
    "Left Upper Arm",
    "Right Upper Arm",
    "Left Lower Arm",
    "Right Lower Arm",
    "Left Hand",
    "Right Hand",
    "Chest",
    "Abdomen",
    "Pelvic",
    "Left Hip",
    "Right Hip",
    "Left Upper Leg",
    "Right Upper Leg",
    "Left Knee",
    "Right Knee",
    "Left Lower Leg",
    "Right Lower Leg",
    "Left Ankle",
    "Right Ankle",
    "Left Foot",
    "Right Foot"
  };
  static String orderplacedSuccessHeader = "Ordered successfully";
  static String orderEditedSuccessHeader = "Order updated successfully";

  // Requisition order has been updated successfully OK
  static String orderEditedSuccessSubheader =
      "Requisition order has been updated successfully";
  static String orderplacedSuccessSubheader =
      "Thank you for placing the order.";

  //Settings
  static const changePassword = "Change Password";
  static const updateLanguage = "Update Language";
  static const notificationSetting = "Notification Settings";
  static const privacyPolicy = "Privacy Policy";
  static const termsCondition = "Terms & Condition";
  static const logOut = "Logout";

  static const continueWith = "Continue with:";

//notification setting
  static const changeNotification = "Change notification:";
  static const pushNotification = "Push Notification";

//Change Password
  static const changepass =
      "Enter your current password and then new password to change your password";
  static const currentPassword = "Current Password";
  static const newPassword = "New Password";
  static const enterCurrentPassword = "Enter Current Password";
  static const enterNewPassword = "Enter New Password";

//Reviews And FeedBack
  static const reviewFeedBack = "Review & Feedbacks";
  static const reportFeedback = "Report Feedback";
  static Map<String, String> personalStrings = {
    'smoke': Strings.smoke,
    'drink': Strings.drugs,
    'drugs': Strings.drugs
  };

  // static String slotDuration = "Default slot 15 minutes";
  static String slotDuration = "Default time 15 minutes";
  static String enterCorrectEndHrs = "Please enter correct end time";
  static String enterCorrectStartHrs = "Please enter correct start time";

  // static String enteCorrectTimeDiff =
  //     "Please enter correct time slots as per slot duration";
  static String enteCorrectTimeDiff = "Please enter correct time duration";
  static String yyyyMMDD = "yyyy-MM-dd";

  static const String setlanguage = 'set_language';
  static const String setlocation = 'set_location';
  static String utcFormat = "yyyy-MM-dd'T'HH:mm:ss";
  static String noSLotsAvailble = "Doctor have no time available";
  static var purposeOfVisitList = {"First Visit", "Follow Up", "Urgent Care"};

  // post visit third new patient
  static const String subjective = 'Subjective';
  static const String objective = 'Objective';
  static const String objectiveHint = 'Not done...';

  static const String generalAppearance = 'General Appearance';
  static const String generalAppearanceHint =
      'Well developed, well nourished, alert and cooperative, and appears to be in no acute distress.';
  static const String heent = 'HEENT (Head, Eyes, Ears, Nose, Throat)';
  static const String heentHint =
      'Normocephalic, atraumatic. Extraocular muscles are intact. Conjunctivae pink. Sclerae anicteric. Pupils equal, round and reactive to light. Fundi sharp with no exudate or hemorrhages. Tympanic membranes clear. Nasal mucosa normal. Septum midline. No purulent exudates. Buccal mucosa moist, no lesions. No caries, no pharyngeal injection, no exudate.';
  static const String neck = 'Neck';
  static const String neckHint =
      'Supple, no carotid bruits, no adenopathy. Thyroid normal size, shape and contour.';
  static const String cardiac = 'Cardiac';
  static const String cardiacHint =
      'egular rate and rhythm. No murmurs, rubs or gallops.';
  static const String abdomen = 'Abdomen';
  static const String abdomenHint =
      'Bowel sounds present, nontender, nondistended. No hepatosplenomegaly. No masses detected. No deformity, no CVA tenderness.';
  static const String musculoskeletal = 'Musculoskeletal';
  static const String musculoskeletalHint =
      'Normal gait. No tenderness, deformity or other abnormalities. ';
  static const String extremities = 'Extremities (upper & lower)';
  static const String extremitiesHint =
      'No cyanosis, clubbing or edema. No varicosities noted. DP pulses +2 in bilateral extremities.';
  static const String lungs = 'Lungs';
  static const String lungsHint =
      'Clear to auscultation bilaterally. No wheezes, rales or rhonchi.';
  static const String dermatologic = 'Dermatologic';
  static const String dermatologicHint =
      'Warm and dry with no evidence of rash. No exanthems, no suspicious lesions.';
  static const String neurological = 'Neurological';
  static const String neurologicalHint =
      'The patient is awake, alert and oriented x3. Cranial nerves II through XII grossly intact. Sensation intact to fine touch bilaterally and to vibration in bilateral lower extremities. Deep tendon reflexes equal bilaterally. Babinski\'s equivocal. Motor strength 5+ throughout.';
  static const String psychiatry = 'Psychiatry';
  static const String psychiatryHint =
      'The mental examination revealed the patient was oriented to person, place, and time. The patient was able to demonstrate good judgement and reason, without hallucinations, abnormal affect or abnormal behaviors during the examination. Patient is not suicidal.';
  static const String assessment = 'Assessment';
  static const String plan = 'Plan';

  //
  static var labList = [
    {"test_name": "1,25 DIHYDROXY VITAMIN D"},
    {"test_name": "14q rearrangement"},
    {"test_name": "17-ALPHA-HYDROXYPROGESTERONE"},
    {"test_name": "17-ALPHA HYDROXYPROGESTERONE (NEONATAL SCREENING)"},
    {"test_name": "17-KETOSTEROIDS,URINE"},
    {"test_name": "1p/19q Deletions, FISH"},
    {"test_name": "25-HYDROXY VITAMIN D"},
    {"test_name": "25 HYDROXY VITAMIN D GOLD, LCMS"},
    {"test_name": "5-HYDROXY INDOLE ACETIC ACID"},
    {"test_name": "ABCD3"},
    {"test_name": "ABSOLUTE NEUTROPHIL COUNT"},
    {"test_name": "ACETONE, SERUM"},
    {"test_name": "ACETONE, URINE"},
    {"test_name": "ACETYLCHOLINE RECEPTOR AUTOANTIBODIES"},
    {"test_name": "ACID FAST BACILLI CULTURE ( BLOOD & / BONE MARROW)"},
    {"test_name": "ACID FAST BACILLI CULTURE: MGIT"},
    {"test_name": "ACID FAST BACILLI CULTURE: MGIT"},
    {"test_name": "ACID FAST BACILLI SMEAR (3 SAMPLES)"},
    {"test_name": "ACID FAST BACILLI SMEAR (5 SAMPLES)"},
    {"test_name": "ACID LIPASE DISORDER : WOLMAN DISEASE"},
    {"test_name": "ACTIVATED PROTEIN C RESISTANCE"},
    {"test_name": "ACTIVE VITAMIN B12 (HOLOTRANSCOBALMIN)"},
    {"test_name": "ACTN3 GENOTYPING (SPORTS GENE TEST)"},
    {
      "test_name":
      "ACUTE HEPATITIS VIRUS EVALUATION I (HCV ABS, HEV IgM, HBsAg, HAV IgM, HBcore IgM)"
    },
    {
      "test_name":
      "ACUTE HEPATITIS VIRUS EVALUATION II (HCV ABS, HEV IgM / IgG, HBsAg, HAV IgM, HBeAg, HBeAb)"
    },
    {
      "test_name":
      "ACUTE HEPATITIS VIRUS EVALUATION III (HSV IgM, CMV IgM, EBV (EA) IgG, VZV IgM)"
    },
    {
      "test_name":
      "ACUTE LEUKEMIA PANEL (CD10,CD19,CD20,CD22,CD3,CD5,CD7,CD13,CD33,CD34,CD117,HLA DR, CD11b, CD16, CD45, CD64, CD2, CD56, CYTOPLASMIC MARKERS (CD3, CD79a and MPO) WILL BE DONE IF REQUIRED FOR DIAGNOSIS)"
    },
    {
      "test_name":
      "ACUTE LYMPHOBLASTIC LEUKEMIA PANEL (CD3,CD4,CD5,CD7,CD8,CD10,CD19,CD20,CD22,CD34,CD45, IgM, HLA-DR, CD33, CD2, CD56, CD1a)"
    },
    {
      "test_name":
      "ACUTE MYELOID LEUKEMIA (AML) PANEL (CD7, CD19, CD13, CD14, CD15, CD33, CD34, CD117, CD41, CD45, CD61, GLYCOPHORIN A, HLA-DR, CD11b, CD16, CD64, CD56)"
    },
    {"test_name": "ACUTE PROMYELOCYTIC LEUKEMIA (APL)"},
    {
      "test_name":
      "ADENOCARCINOMA V/S MALIGNANT MESOTHELIOMA (CEA, EMA, VIMENTIN, LWCK)[PHOTO]"
    },
    {"test_name": "ADENOSINE DEAMINASE (ADA)"},
    {"test_name": "ADENOVIRUS IgG"},
    {"test_name": "ADENOVIRUS IgM"},
    {"test_name": "ADENOVIRUS PCR"},
    {"test_name": "ADRB2 GENOTYPING FOR B-2-AGONIST RESPONSIVENESS"},
    {"test_name": "ADRENALIN, PLASMA"},
    {"test_name": "ADRENALIN URINE"},
    {"test_name": "ADRENOCORTEX STRESS PROFILE (KIT BASED TEST ONLY)"},
    {"test_name": "ADRENOCORTICOTROPIC HORMONE (ACTH) - COMPLETE"},
    {"test_name": "ADRENOCORTICOTROPIC HORMONE (ACTH) [PHOTO]"},
    {
      "test_name":
      "ADRENOCORTICOTROPIC HORMONE (ACTH) STIMULATION TEST - 1 HOUR"
    },
    {"test_name": "AEROBIC BLOOD CULTURE - BACTEC"},
    {"test_name": "AEROBIC CULTURE, BODY FLUID BACTEC"},
    {
      "test_name":
      "AFB DRUG SENSITIVITY: MIC TEST FOR RAPID GROWING NON-TUBERCULOUS MYCOBACTERIA (NTM)"
    },
    {
      "test_name":
      "AFB RAPID GENOTYPIC TEST (MDR-TB) (Note: This test is not applicable for MOTT)"
    },
    {
      "test_name":
      "AFB SECOND LINE DRUG- GENOTYPIC ASSAY (Note: This test is not applicable for MOTT)"
    },
    {"test_name": "AFB SPECIATION"},
    {"test_name": "AFB SPECIATION – COMMON"},
    {"test_name": "AFB SPECIATION – EXTENDED"},
    {"test_name": "AFB SUSCEPTIBILITY : Amikacin"},
    {"test_name": "AFB SUSCEPTIBILITY, BACTEC : 10 DRUG PANEL"},
    {"test_name": "AFB SUSCEPTIBILITY, BACTEC : 5 DRUG PANEL"},
    {"test_name": "AFB SUSCEPTIBILITY, BACTEC : SIRE PANEL"},
    {"test_name": "AFB SUSCEPTIBILITY, BACTEC : SIREP PANEL"},
    {"test_name": "AFB SUSCEPTIBILITY : Capreomycin"},
    {"test_name": "AFB SUSCEPTIBILITY : Ciprofloxacin"},
    {"test_name": "AFB SUSCEPTIBILITY : CLOFAZIMINE"},
    {"test_name": "AFB SUSCEPTIBILITY : Ethambutol"},
    {"test_name": "AFB SUSCEPTIBILITY : Ethionamide"},
    {"test_name": "AFB SUSCEPTIBILITY : Isoniazid"},
    {"test_name": "AFB SUSCEPTIBILITY : Kanamycin"},
    {"test_name": "AFB SUSCEPTIBILITY : Levofloxacin"},
    {"test_name": "AFB SUSCEPTIBILITY : LINEZOLID"},
    {"test_name": "AFB SUSCEPTIBILITY : MOXIFLOXACIN"},
    {"test_name": "AFB SUSCEPTIBILITY : Ofloxacin"},
    {"test_name": "AFB SUSCEPTIBILITY : PAS"},
    {"test_name": "AFB SUSCEPTIBILITY : Pyrazinamide"},
    {"test_name": "AFB SUSCEPTIBILITY : RIFABUTIN"},
    {"test_name": "AFB SUSCEPTIBILITY : Rifampicin"},
    {"test_name": "AFB SUSCEPTIBILITY : Streptomycin"},
    {"test_name": "ALCOHOL (ETHANOL), SERUM"},
    {"test_name": "ALCOHOL (ETHANOL), URINE"},
    {"test_name": "ALDOLASE"},
    {"test_name": "ALDOSTERONE"},
    {"test_name": "ALDOSTERONE, 24HRS URINE"},
    {"test_name": "ALK-1"},
    {"test_name": "ALKALINE PHOSPHATASE ISOENZYMES"},
    {"test_name": "ALKALINE PHOSPHATASE ISOENZYMES (BONE FRACTION)"},
    {
      "test_name":
      "ALLERGEN - Acacia Tree Pollen (Latin Name:Acacia longifolia ; Indian Name: Babool) inhouse allergen"
    },
    {"test_name": "ALLERGEN - ACTH inhouse allergen"},
    {"test_name": "ALLERGEN - ALMOND inhouse allergen"},
    {"test_name": "ALLERGEN - ALTERNARIA ALTERNATA/TENIUS inhouse allergen"},
    {"test_name": "ALLERGEN - AMOXYCILLIN inhouse allergen"},
    {"test_name": "ALLERGEN - AMPICILLIN inhouse allergen"},
    {
      "test_name":
      "ALLERGEN - ANIMAL DANDER PANEL (Cat dander, Horse dander, Cow dander, Dog dander,Rat epithelium,Mouse epithelium,Pigeon droppings )"
    },
    {
      "test_name":
      "ALLERGEN - ANIMAL MIX (ex1-Cat dander, Horse dander, Cow dander, Dog dander)"
    },
    {"test_name": "ALLERGEN - APPLE inhouse allergen"},
    {"test_name": "ALLERGEN -APRICOT"},
    {"test_name": "ALLERGEN - Ascaris"},
    {"test_name": "ALLERGEN - ASPERGILLUS FUMIGATUS inhouse allergen"},
    {
      "test_name":
      "ALLERGEN - BAINGAN (ALLERGEN AUBERGINE) (Common Names:Eggplant ,Brinjal ; Indian Name:Baingan)"
    },
    {"test_name": "ALLERGEN - BANANA inhouse allergen"},
    {"test_name": "ALLERGEN – Barley(Latin Name: Hordeum vulgare)"},
    {"test_name": "ALLERGEN-BASIL"},
    {"test_name": "ALLERGEN-BAY LEAF"},
    {"test_name": "ALLERGEN - BEEF"},
    {
      "test_name":
      "ALLERGEN - Bermuda Grass Pollen(Latin Name:Cynodon dactylon ; Indian Name: Dhoobghass)"
    },
    {"test_name": "ALLERGEN-BLACK PEPPER"},
    {"test_name": "ALLERGEN-BLUE BERRY"},
    {"test_name": "ALLERGEN - BLUE MUSSEL"},
    {"test_name": "ALLERGEN - BRAZIL NUT"},
    {"test_name": "ALLERGEN - Buckwheat(Latin Name: Fagopyrum esculentum)"},
    {"test_name": "ALLERGEN - CABBAGE"},
    {"test_name": "ALLERGEN - CANDIDA ALBICANS"},
    {"test_name": "ALLERGEN - CARROT"},
    {"test_name": "ALLERGEN - CASEIN"},
    {"test_name": "ALLERGEN - CASHEW"},
    {"test_name": "ALLERGEN - CAT DANDER/EPITHELIUM"},
    {"test_name": "ALLERGEN - CAULIFLOWER"},
    {"test_name": "ALLERGEN - CELERY"},
    {"test_name": "ALLERGEN - CHEESE CHEDDAR"},
    {"test_name": "ALLERGEN - CHERRY"},
    {"test_name": "ALLERGEN - CHICKEN FEATHERS"},
    {"test_name": "ALLERGEN - CHICKEN MEAT"},
    {
      "test_name":
      "ALLERGEN - Chick Pea(Common Names: Garbanzo bean, Bengal Gram;Indian Name:Kabuli Chana)"
    },
    {"test_name": "ALLERGEN-CHILLI PEPPER"},
    {"test_name": "ALLERGEN - CLADOSPORIUM HERBARUM"},
    {
      "test_name":
      "ALLERGEN - Cocklebur Weed Pollen (Latin Name:Xanthium commune;Indian Names:Bichha,Kutta,Chirchitta )"
    },
    {"test_name": "ALLERGEN - COCKROACH"},
    {"test_name": "ALLERGEN - COCOA"},
    {"test_name": "Allergen - Coconut"},
    {"test_name": "ALLERGEN - CODFISH"},
    {"test_name": "ALLERGEN - COFFEE"},
    {
      "test_name":
      "ALLERGEN - Common Ragweed Pollen (Latin Name:Ambrosia elatior;Close to Parthenium-Congress Grass)"
    },
    {"test_name": "ALLERGEN - COMMON REED GRASS"},
    {
      "test_name":
      "ALLERGEN - Common Silver birch Tree Pollen( Latin Name:Betula verrucosa)"
    },
    {
      "test_name":
      "ALLERGEN - COMPREHENSIVE ALLERGY PANEL - ADULT (Phadia Top Adult, LiST Of Allergens Include:Milk, Soybean, Cheese, Almond, Coconut, Wheat, Egg White, Chicken, Cod Fish, Shrimp, Tuna, Salmon, D.Ptteronyssinus, D.Farinae, Cockroach, House DuST, Mugwort, English Plantain, Lambs Quarter, Alder, Birch, Cat Epithelium, Dog Dander, Cladoprorium, Aspergillus, Candida, Sweet Vernal, Cultivated Rye, Velvet)"
    },
    {
      "test_name":
      "ALLERGEN-COMPREHENSIVE ALLERGY PANEL - INFANCY (Phadia top infant, Individual Allergens: Milk, Soybean, Peanut,(Egg Yolk), Almond, Wheat, Corn, Cat Epithelium, Dog Dander, Rabbit Epithelium, Rye, English Plantain, D. Pteronyssinus, D. Farinae, House DuST, Cockroach, Aspergillus, Candida, Caesin, Potato)"
    },
    {
      "test_name":
      "ALLERGEN - COMPREHENSIVE ALLERGY SCREENING PANEL ADULT - Chicken,Candida,Elm,Acacia,Food mix fx5 (Egg white, Milk, Fish, Wheat, Peanut, Soybean), Food mix fx2 (Fish, Shrimp, Blue mussel, Tuna, Salmon),Mould Mix(Penicillium chrysogenum, Cladosporium herbarum, Aspergillus fumigatus, Alternaria alternata)},House dust Mix (Hollister-Stier Labs., Dermatophagoides pteronyssinus, Dermatophagoides farinae, Blatella germanica), Animal Mix (Cat dander, Horse dander, Cow dander, Dog dander), Grass mix gx4(Sweet vernal,Rye grass, Common Reed,Cultivated rye,Velvet ),Weed Mix wx1(Common ragweed,Mugwort,English Plantain,Lambs quarter)"
    },
    {
      "test_name":
      "ALLERGEN - COMPREHENSIVE ALLERGY SCREENING PANEL INFANCY - Food mix fx5 (Egg white, Milk, Fish, Wheat, Peanut, Soybean), Egg yolk, Corn,Food mix fx1(Peanut, Hazel nut, Brazil nut, Almond, Coconut) ,Animal Mix (Cat dander, Horse dander, Cow dander, Dog dander), Mould Mix(Penicillium chrysogenum, Cladosporium herbarum, Aspergillus fumigatus, Alternaria alternata)},Candida albicans(yeast), House dust Mix (Hollister-Stier Labs., Dermatophagoides pteronyssinus, Dermatophagoides farinae, Blatella germanica),Potato"
    },
    {"test_name": "ALLERGEN - CORN"},
    {
      "test_name":
      "ALLERGEN - Cottonwood Tree Pollen (Latin Name: Populus deltoides)"
    },
    {"test_name": "ALLERGEN - COWDANDER"},
    {"test_name": "ALLERGEN - CRAB"},
    {
      "test_name":
      "ALLERGEN – Cultivated rye Grass Pollen (Latin Name:Secale cereale )"
    },
    {"test_name": "ALLERGEN - DOG DANDER/EPITHELIUM"},
    {
      "test_name":
      "ALLERGEN - DRUG ALLERGY (Amoxycillin, ACTH, Ampicilin, Penicilin G, Penicilin V, Insulin)"
    },
    {
      "test_name":
      "ALLERGEN - DRUG ALLERGY PANEL (Amoxycillin,Ampicilin, Penicilin G, Penicilin V)"
    },
    {
      "test_name":
      "ALLERGEN - DUST PANEL (HouseduST- Greer, Cockroach, D.Farinae, D.Pteronyssinus)"
    },
    {
      "test_name":
      "ALLERGEN - ECZEMA/GIT (Non-veg & Veg) PANEL -House dust Mix (Hollister-Stier Labs., Dermatophagoides pteronyssinus, Dermatophagoides farinae, Blatella germanica) ,Milk, Wheat, Rice, Soybean, Potato, Onion,Tomato ,Apple,Peanuts, Coconut, Egg White,Egg yolk, Cod Fish, Shrimp, Pork, Beef, Chicken, Mutton (Lamb)"
    },
    {
      "test_name":
      "ALLERGEN - ECZEMA/GIT SCREENING PANEL - Food mix fx1(Peanut, Hazel nut, Brazil nut, Almond, Coconut) ,Food mix fx5 (Egg white, Milk, Fish, Wheat, Peanut, Soybean), Food mix fx17 (Apple, Banana, Pear,Peach ), House dust Mix (Hollister-Stier Labs., Dermatophagoides pteronyssinus, Dermatophagoides farinae, Blatella germanica),Food mix fx73 (Pork,Beef,Chicken),Food mix fx2 (Fish, Shrimp, Blue mussel, Tuna, Salmon), Mutton,Potato"
    },
    {
      "test_name":
      "ALLERGEN - ECZEMA/GIT (Veg) PANEL - [ House dust Mix (Hollister-Stier Labs., Dermatophagoides pteronyssinus, Dermatophagoides farinae, Blatella germanica) Milk ,Wheat, Rice, Soybean, Potato, Onion,Tomato Apple, Peanuts, Coconut ]"
    },
    {"test_name": "ALLERGEN - EGG WHITE"},
    {"test_name": "ALLERGEN - EGG YOLK"},
    {
      "test_name":
      "ALLERGEN - Elm Tree Pollen( Latin Name: Ulmus americana ; Indian Name:Papdi Chibil)"
    },
    {
      "test_name":
      "ALLERGEN - English plantain Weed Pollen (Latin Name:Plantago lanceolata ;Common Name:Ribwort)"
    },
    {
      "test_name":
      "ALLERGEN - Eucalyptus Tree Pollen (Indian Names:Nilgiri,Safeda)"
    },
    {
      "test_name":
      "ALLERGEN - Extended Eczema Panel {Milk,Wheat,Rice,Peanut,Soyabean,ChickPea,Sesame Seed,Cashew Nut,Coconut,Banana,Brinjal,Lemon,Spinach,Tomato,White Bean,Cod Fish,Shrimp,Chicken,Mutton,Egg White,D.Ptyerossinus,Cockroach,Animal Mix(Cat dander, Horse dander, Cow dander, Dog dander),Mould Mix(Penicillium chrysogenum, Cladosporium herbarum, Aspergillus fumigatus, Alternaria alternata)}"
    },
    {
      "test_name":
      "ALLERGEN - Extended Rhinitis/Asthma panel –Adult{ Bermuda Grass, Johnsson Grass,Meadow Grass, Cocklebur , Common Pigweed , Common ragweed,Mugwort, Goosefoot, Rape Seed, English Plantain, Acacia, Oak, Elm,Cotton Wood , Pine , Eucalyptus, Mesquite, Mulberry , Alder,Dermatophagoides farinae, Dermatophagoides pteronyssinus , Cockroach,Animal Mix (Cat dander, Horse dander, Cow dander, Dog dander),Mould Mix(Penicillium chrysogenum, Cladosporium herbarum, Aspergillus fumigatus, Alternaria alternata)}"
    },
    {
      "test_name":
      "ALLERGEN - Extended Rhinitis/Asthma panel –Child { Bermuda Grass, Johnsson Grass, Meadow Grass, Cocklebur, Common Pigweed, Common ragweed, Mugwort ,Goosefoot, Rape seed, English Plantain , Acacia , Oak, Elm, Cotton Wood,Pine, Eucalyptus, Mesquite, Mulberry, Alder, Dermatophagoides pteronyssinus, Cockroach, Animal Mix (Cat dander, Horse dander, Cow dander, Dog dander), Mould Mix( Penicillium chrysogenum, Cladosporium herbarum, Aspergillus fumigatus, Alternaria alternata), Food mix ( Egg white, Milk, Fish, Wheat, Peanut, Soybean), Legume mix(Lentil,Pea,White bean)"
    },
    {
      "test_name":
      "ALLERGEN - EXTENDED RHINITIS/ASTHMA SCREENING PANEL - , Animal Mix (Cat dander, Horse dander, Cow dander, Dog dander),Mould Mix(Penicillium chrysogenum, Cladosporium herbarum, Aspergillus fumigatus, Alternaria alternata)},Candida albicans(yeast), House dust Mix (Hollister-Stier Labs., Dermatophagoides pteronyssinus, Dermatophagoides farinae, Blatella germanica), Grass mix gx4(Sweet vernal,Rye grass, Common Reed,Cultivated rye,Velvet ),Weed Mix wx1(Common ragweed,Mugwort,English Plantain,Lambs quarter) ,Tree mix"
    },
    {"test_name": "ALLERGEN-FENNEL"},
    {"test_name": "ALLERGEN - FIG"},
    {
      "test_name":
      "ALLERGEN - FLEXI ALLERGY PANEL - 2 ( Select Any 29 Allergens from available inhouse Allergen list)"
    },
    {
      "test_name":
      "ALLERGEN - FLEXI ALLERGY PANEL - 3 (Select Any 19 Allergen from available inhouse Allergen list)"
    },
    {
      "test_name":
      "ALLERGEN - FLEXI ALLERGY PANEL - (Select Any 10 Allergen from available inhouse Allergen list)"
    },
    {
      "test_name":
      "ALLERGEN - FLEXI ALLERGY PANEL - (Select Any 5 Allergen from available inhouse Allergen list)"
    },
    {
      "test_name":
      "ALLERGEN - FOOD ALLERGY SCREENING PANEL VEG- Food mix fx1 (Peanut, Hazel nut, Brazil nut, Almond, Coconut) ,Food mix fx5 (Egg white, Milk, Fish, Wheat, Peanut, Soybean), Food mix fx17 (Apple, Banana, Pear,Peach ), Food mix fx7(Tomato, Yeast, Garlic, Onion, Celery)"
    },
    {
      "test_name":
      "ALLERGEN - FOOD ALLERGY SCREENING PANEL VEG & NON VEG - Food mix fx1 (Peanut, Hazel nut, Brazil nut, Almond, Coconut) ,Food mix fx5 (Egg white, Milk, Fish, Wheat, Peanut, Soybean), Food mix fx17 (Apple, Banana, Pear,Peach ), Food mix fx7(Tomato, Yeast, Garlic, Onion, Celery) ,Food mix fx73(Pork,Beef,Chicken), Food mix fx2 (Fish, Shrimp, Blue mussel, Tuna, Salmon)"
    },
    {"test_name": "Allergen - Food mix fx17 (Apple, Banana, Pear,Peach )"},
    {
      "test_name":
      "Allergen - Food mix fx1(Peanut, Hazel nut, Brazil nut, Almond, Coconut)"
    },
    {
      "test_name":
      "Allergen - Food mix fx2 (Fish, Shrimp, Blue mussel, Tuna, Salmon)"
    },
    {"test_name": "Allergen - Food mix fx73(Pork,Beef,Chicken)"},
    {
      "test_name":
      "Allergen - Food mix fx7(Tomato, Yeast, Garlic, Onion, Celery)"
    },
    {
      "test_name":
      "ALLERGEN - FOOD PANEL 2 (Codfish, Tuna, Shrimp, Blue Mussel, Salmon"
    },
    {
      "test_name":
      "ALLERGEN - FOOD PANEL 3 (Wheat, Oat, Corn, Sesame Seed, Buck Wheat)"
    },
    {
      "test_name":
      "ALLERGEN - FOOD PANEL 7 (Egg White,Fish, Milk, Rice, Peanut, Soyabean)"
    },
    {
      "test_name":
      "ALLERGEN - FOOD PANEL - FRUITS 1 ( Apple, Banana, Pear,Peach,Orange,Pineapple,Mango)"
    },
    {
      "test_name":
      "ALLERGEN - FOOD PANEL - FRUITS 2 (Kiwi,Strawberry,Melon,Peach,Plum,Grapefruit)"
    },
    {
      "test_name":
      "ALLERGEN - FOOD PANEL-GRAINS (Rice,Wheat,Corn,Oat,Buckwheat,Barley,Rye)"
    },
    {
      "test_name":
      "ALLERGEN - FOOD PANEL -LEAFY VEGETABLES (Spinach,Celery,Lettuce,Cabbage)"
    },
    {"test_name": "ALLERGEN - FOOD PANEL MEATS (Chicken,Mutton,Pork,Beef)"},
    {
      "test_name":
      "ALLERGEN - FOOD PANEL - NUTS AND SEEDS ( Peanut, Cashew nut ,Pista, Hazel nut, Brazil nut, Almond, Coconut ,Sesame seed,Rape seed)"
    },
    {
      "test_name":
      "ALLERGEN - FOOD PANEL-PULSES (Lentil, Chickpea, White bean,Green pea,Soyabean)"
    },
    {
      "test_name":
      "ALLERGEN - FOOD PANEL-SEAFOOD (Codfish, Tuna, Shrimp, Blue Mussel, Salmon, Crab, Lobster)"
    },
    {
      "test_name":
      "ALLERGEN - FOOD PANEL - VEG 2 (Wheat,Rice,Garlic,Tomato,Potato,Onion,Lemon,Mustard,Sesame seed,Chick pea)"
    },
    {
      "test_name":
      "ALLERGEN - FOOD PANEL - VEG 3 (Tomato, Yeast, Garlic, Onion, Celery)"
    },
    {
      "test_name":
      "ALLERGEN - FOOD PANEL- VEGETABLES (Brinjal,Cabbage,Carrot,Cauliflower,Green pepper,Corn, Mushroom,Spinach,Tomato,Potato)"
    },
    {"test_name": "ALLERGEN - Fx5 FOOD MIX"},
    {"test_name": "ALLERGEN - GARLIC"},
    {"test_name": "ALLERGEN-GINGER"},
    {"test_name": "ALLERGEN - GLUTEN"},
    {"test_name": "ALLERGEN - GOAT EPITHELIUM"},
    {
      "test_name":
      "ALLERGEN - Golden Rod Weed Pollen (Latin Name:Solidago virgaurea)"
    },
    {
      "test_name":
      "ALLERGEN - Goosefoot Weed Pollen (Latin Name: Chenopodium album;Common Name:Lamb's Quarters ; Indian Name:Bathua )"
    },
    {"test_name": "ALLERGEN - Grapefruit (Latin Name:Citrus paradisi )"},
    {
      "test_name":
      "Allergen - Grass mix- gx4 (Sweet vernal,Rye grass, Common Reed,Cultivated rye,Velvet )"
    },
    {
      "test_name":
      "ALLERGEN - GRASS POLLENS PANEL (Bermuda Grass,Cultivated rye,Johnson Grass,Meadow fescue,Sweet vernal,Timothy Grass,Velvet Grass)"
    },
    {"test_name": "ALLERGEN - Green PEA"},
    {"test_name": "ALLERGEN - Green pepper(Latin Name:Piper nigrum)"},
    {
      "test_name":
      "ALLERGEN – Grey alder Tree Pollen (Latin Name: Alnus incana)"
    },
    {"test_name": "ALLERGEN - GUINEA PIG EPITHELIUM"},
    {"test_name": "ALLERGEN - HAMSTER EPITH"},
    {"test_name": "ALLERGEN - HAZEL NUT"},
    {
      "test_name": "ALLERGEN - Hazel Tree Pollen( Latin Name: Corylus avellana)"
    },
    {"test_name": "ALLERGEN - HELMENTHISPORIUM HALODES"},
    {"test_name": "ALLERGEN - Honey Bee Venom (Latin name: Apis mellifera)"},
    {"test_name": "ALLERGEN - HORSE DANDER"},
    {"test_name": "ALLERGEN - HOUSE DUST GREER"},
    {"test_name": "ALLERGEN - HOUSE DUST HOLLISTIER"},
    {"test_name": "ALLERGEN - House dust mite-Dermatophagoides pteronyssinus"},
    {"test_name": "ALLERGEN - House dust mite-Dermatophagoieds farinae"},
    {"test_name": "ALLERGEN-HOUSEDUST MIX (hx2)"},
    {"test_name": "ALLERGEN - INSULIN BOVINE"},
    {"test_name": "ALLERGEN – INSULIN HUMAN"},
    {"test_name": "ALLERGEN - INSULIN PORCINE"},
    {
      "test_name":
      "ALLERGEN - Japanese Cedar Tree Pollen (Latin Name:Cupressus japonica )"
    },
    {
      "test_name":
      "ALLERGEN - Johnson Grass Pollen(Latin name:Sorghum halepense ; Indian Name: Jowar)"
    },
    {"test_name": "ALLERGEN - KIWI FRUIT"},
    {"test_name": "ALLERGEN - LAMB (MUTTON)"},
    {"test_name": "ALLERGEN - Latex( Latin Name:Hevea braziliensis)"},
    {"test_name": "ALLERGEN- Legume mix (fx32-Lentil,Pea,White bean)"},
    {"test_name": "ALLERGEN - LEMON"},
    {"test_name": "ALLERGEN - Lentil ( Common Indian Name: Masur Dal)"},
    {"test_name": "ALLERGEN - LETTUCE"},
    {"test_name": "ALLERGEN-LIDOCAINE ANAESTHESIA (SERUM)"},
    {"test_name": "ALLERGEN - LOBSTER"},
    {"test_name": "ALLERGEN - Malt (Latin Name:Hordeum vulgare )"},
    {"test_name": "ALLERGEN - MANGO"},
    {
      "test_name":
      "ALLERGEN - Meadow fescue Grass pollen(Latin name: Festuca elatior)"
    },
    {"test_name": "ALLERGEN - MELALEUCA"},
    {"test_name": "ALLERGEN - MELON"},
    {
      "test_name":
      "ALLERGEN - MesquiteTree Pollen (Latin Name:Prosopis juliflora ; Indian Name: Pahadi Keekar)"
    },
    {"test_name": "ALLERGEN - MILK"},
    {"test_name": "ALLERGEN-MINT"},
    {
      "test_name":
      "ALLERGEN - MOLD PANEL (P. notatum,C. herbarum,A.fumigatus,C. albicans,A.tenius,R nigricans,M. racemosus,Trichophyton)"
    },
    {"test_name": "ALLERGEN - MOSQUITO AEDES"},
    {
      "test_name":
      "ALLERGEN - MOULD MIX ( MX1-Penicillium chrysogenum, Cladosporium herbarum, Aspergillus fumigatus, Alternaria alternata)"
    },
    {"test_name": "ALLERGEN - MOUSE EPITHELIUM"},
    {"test_name": "ALLERGEN - MUCOR RACEMOSUS"},
    {
      "test_name":
      "ALLERGEN - Mugwort Weed Pollen (Latin Name: Artemisia vulgaris ;Indian Names:Barna,Sita Bani,Bano) inhouse allergen"
    },
    {
      "test_name":
      "ALLERGEN - Mulberry Tree Pollen (Latin Name:Morus alba; Indian Name:Shahtoot)"
    },
    {"test_name": "ALLERGEN - MUSHROOM"},
    {"test_name": "ALLERGEN - MUSTARD"},
    {
      "test_name":
      "ALLERGEN - Nettle Weed Pollen (Latin Name: Urtica dioica ;Common Name: Stinging Nettle)"
    },
    {
      "test_name":
      "ALLERGEN - NON VEG PANEL (Chicken Meat, Codfish, Salmon, Tuna, Shrimp, Blue Mussel,Egg white, Egg yolk, Lamb)"
    },
    {"test_name": "ALLERGEN - Oak Tree Pollen (Latin Name: Quercus alba)"},
    {"test_name": "ALLERGEN - OAT"},
    {"test_name": "ALLERGEN - OLIVE (FEIA)"},
    {"test_name": "ALLERGEN - ONION"},
    {"test_name": "ALLERGEN - ORANGE"},
    {"test_name": "ALLERGEN-OREGANO"},
    {
      "test_name":
      "ALLERGEN - OUTDOOR PANEL (Rye, Sweet Vernal, Golden Rod, English Plantain, Alder, Birch, Lambs Quarter, Nettle)"
    },
    {
      "test_name":
      "ALLERGEN - PADIATRIC PANEL (EGG WHITE, MILK, SOYABEAN, WHEAT, HOUSE DUST)"
    },
    {"test_name": "ALLERGEN -Papaya inhouse allergen"},
    {"test_name": "ALLERGEN - PAPERWASP VENOM"},
    {"test_name": "ALLERGEN-PAPRIKA"},
    {"test_name": "ALLERGEN - PARIETARIA OFFICINALIS"},
    {"test_name": "ALLERGEN - PARROT FEATHERS"},
    {"test_name": "ALLERGEN-PARSLEY"},
    {"test_name": "ALLERGEN - PEACH"},
    {"test_name": "ALLERGEN - PEANUT"},
    {"test_name": "ALLERGEN - PEAR"},
    {"test_name": "ALLERGEN - PECAN NUT"},
    {"test_name": "ALLERGEN - PENICILLIN G"},
    {"test_name": "ALLERGEN - PENICILLIN V"},
    {"test_name": "ALLERGEN - PENICILLIUM NOTATUM"},
    {"test_name": "ALLERGEN - PHADIATOP ADULT (INDIVIDUALS ABOVE 5 YEARS)"},
    {"test_name": "ALLERGEN -PHADIATOP INFANT"},
    {"test_name": "ALLERGEN - PHADIATOP INFANT (INDIVIDUALS BELOW 5 YEARS)"},
    {"test_name": "ALLERGEN - PIGEON DROPPINGS"},
    {
      "test_name":
      "ALLERGEN - Pigweed Pollen (Latin Name: Amaranthus retroflexus;Indian Names:Kaantewali Chauli)"
    },
    {"test_name": "ALLERGEN - PINE"},
    {"test_name": "ALLERGEN - PINEAPPLE"},
    {"test_name": "ALLERGEN - PISTACHIO"},
    {"test_name": "ALLERGEN - PLUM"},
    {"test_name": "ALLERGEN - PORK"},
    {"test_name": "ALLERGEN - POTATO"},
    {"test_name": "ALLERGEN - Pumpkin inhouse allergen"},
    {"test_name": "ALLERGEN - RABBIT APITH"},
    {
      "test_name":
      "ALLERGEN - Rape Seed(Common Names:Canola, Oilseed Rape; Indian Name: Sarson)"
    },
    {"test_name": "ALLERGEN - RAT EPITHELIUM"},
    {"test_name": "ALLERGEN - Red Kidney Beans inhouse allergen"},
    {
      "test_name":
      "ALLERGEN - RHINITIS/ASTHMA INDOOR INHALANTS PANEL (Aspergillus,Mucor,Alternaria Candida, House Dust, D.Farinae, D.Pteronyssinus, Cockroach, Cat Epithelium, Dog Dander)"
    },
    {
      "test_name":
      "ALLERGEN - RHINITIS/ASTHMA PANEL - Ambrosia elatior(Common Ragweed), Penicillium notatum, Aspergillus fumigatus, Mucor racemosus, Candida albicans(yeast), Dermatophagoides farinae(House dust mite), Dermatophagoidespteronyssinuse(House dust mite), Greer labs(house dust), Hollistier-Stier labs(House dust), Blatella germanica(Cockroach)"
    },
    {
      "test_name":
      "ALLERGEN - RHINITIS/ASTHMA SCREENING PANEL - Ambrosia elatior(Common Ragweed) , Animal Mix (Cat dander, Horse dander, Cow dander, Dog dander),Mould Mix(Penicillium chrysogenum, Cladosporium herbarum, Aspergillus fumigatus, Alternaria alternata)},Candida albicans(yeast), House dust Mix (Hollister-Stier Labs., Dermatophagoides pteronyssinus, Dermatophagoides farinae, Blatella germanica)"
    },
    {"test_name": "ALLERGEN - RHIZOPUS NIGRICANS"},
    {"test_name": "ALLERGEN - RICE"},
    {"test_name": "ALLERGEN - RYE(Latin Name:Secale cereale)"},
    {"test_name": "ALLERGEN - SALMON"},
    {"test_name": "ALLERGEN - SESAME SEED"},
    {"test_name": "ALLERGEN - SHRIMP"},
    {"test_name": "ALLERGEN - SILK"},
    {"test_name": "ALLERGEN - SOYBEAN"},
    {"test_name": "ALLERGEN - SPINACH"},
    {"test_name": "ALLERGEN - STRAWBERRY"},
    {
      "test_name":
      "ALLERGEN - Sweet vernal grass(Latin Name: Anthoxanthum odoratum)"
    },
    {"test_name": "ALLERGEN - SWINE EPITHELIUM"},
    {
      "test_name":
      "ALLERGEN - Timothy Grass Pollen( Latin Name:Phleum pratense )"
    },
    {"test_name": "ALLERGEN - TOMATO"},
    {
      "test_name":
      "Allergen - Tree mix-tx3(Juniperus sabinoides(Mountain juniper), Quercus alba(Oak), Ulmus americana(Elm), Populus deltoides(Cottonwood), Prosopis juliflora(Mesquite))"
    },
    {
      "test_name":
      "ALLERGEN - TREE POLLENS PANEL (Acacia,Eucalyptus,Elm,Mesquite,Mulberry,Cottonwood,Common Silver Birch)"
    },
    {"test_name": "ALLERGEN - TRICHOPHYTON"},
    {"test_name": "ALLERGEN - TUNA"},
    {
      "test_name":
      "ALLERGEN - VEG PANEL (Almond, Wheat, Coconut, Corn, Peanut, Sesame Seed, Cheese, Milk)"
    },
    {"test_name": "ALLERGEN - Velvet Grass Pollen (Latin Name:Holcus lanatus)"},
    {"test_name": "ALLERGEN - WALNUT"},
    {
      "test_name":
      "Allergen - Weed mix( wx1) (Common ragweed,Mugwort,English Plantain,Lambs quarter)"
    },
    {
      "test_name":
      "ALLERGEN - WEED POLLENS PANEL (Common Ragweed,Cocklebur,Goosefoot,Mugwort,Pigweed,Nettle,Goldenrod,,English plantain)"
    },
    {"test_name": "ALLERGEN - WHEAT"},
    {"test_name": "ALLERGEN - WHITE BEAN"},
    {
      "test_name": "ALLERGEN - White PineTree Pollen (Latin Name:Pinus strobus)"
    },
    {"test_name": "ALLERGEN - Willow Tree Pollen (Latin Name:Salix caprea)"},
    {
      "test_name":
      "ALLERGEN - Yeast (Latin name: Saccharomyces cerevisiae , Common Names: Baker's yeast,Brewer's yeast)"
    },
    {"test_name": "ALPHA-1-ANTITRYPSIN"},
    {"test_name": "ALPHA-1-ANTITRYPSIN"},
    {"test_name": "Alpha-1 Antitrypsin, Genotyping"},
    {"test_name": "ALPHA-FETOPROTEIN / LIVER CANCER MONITOR"},
    {"test_name": "ALPHA GLUCOSIDASE"},
    {
      "test_name":
      "ALPHA THALASSEMIA MUTATION DETECTION (α3.7, α4.2, αFIL, αSEA, αTHAI )"
    },
    {"test_name": "ALUMINIUM, 24 HR URINE"},
    {"test_name": "ALUMINIUM, PLASMA"},
    {"test_name": "ALUMINIUM, URINE SPOT"},
    {
      "test_name":
      "AMA (ANTI MITOCHONDRIAL ANTIBODIES) WITH TITRE (Reflex to end titre to all positive cases)"
    },
    {
      "test_name":
      "AMH (Anti-Müllerian Hormone)/ Müllerian Inhibiting Substance (MIS)"
    },
    {"test_name": "AMH PLUS"},
    {"test_name": "AMINO ACID QUALITATIVE SCREEN SERUM"},
    {"test_name": "AMINO ACIDS,24HRS URINE"},
    {"test_name": "AMINO ACIDS, PLASMA"},
    {"test_name": "AMINO ACIDS,RANDOM URINE"},
    {"test_name": "AMINOLEVULINIC ACID,URINE 24 hrs"},
    {"test_name": "AMINOLEVULINIC ACID,URINE RANDOM"},
    {"test_name": "AMLI / ETO t(8:21)"},
    {"test_name": "AML with Normal Cytogenetics (FLT3, NPM1, CEBPA)"},
    {"test_name": "ANA BY IFA (Reflex to end titre for all positive cases)"},
    {"test_name": "ANAEROBIC CULTURE BLOOD - BACTEC"},
    {
      "test_name":
      "ANA POSITIVE REFLEX TO EIA PROFILE (DSDNA with TITRES,SS-A,SS-B,U1-SNRNP,SMITH ABS)"
    },
    {
      "test_name":
      "ANCA (ANTI NEUTROPHIL CYTOPLASMIC ANTIBODIES) (P-ANCA + C-ANCA) WITH TITRE (Reflex to end titre to all positive cases)"
    },
    {"test_name": "ANCA POSITIVE REFLEX MPO, PR3 ANTIBODIES"},
    {
      "test_name":
      "ANC COMBO - ANTENATAL PROFILE & TPC (CBC, Blood Group, Glucose Fasting, Urinalysis, HIV 1 & 2, Abs, Hepatitis B,VDRL,TPC)"
    },
    {"test_name": "ANDROGEN RECEPTOR STUDIES"},
    {"test_name": "ANDROSTENEDIONE"},
    {"test_name": "ANGIOTENSIN CONVERTING ENZYME (ACE)"},
    {
      "test_name":
      "ANTENATAL PROFILE & TPC, ANC COMBO (CBC, Blood Group, Glucose Fasting, Urinalysis, HIV 1 & 2, Abs, Hepatitis B,VDRL,TPC)"
    },
    {
      "test_name":
      "ANTI-AQUAPORIN-4 / NMO ANTIBODIES (ANTI NEUROMYELITIS OPTICA),"
    },
    {
      "test_name":
      "ANTIBODIES TO EXTRACTABLE NUCLEAR ANTIGEN ( SMITH ABS, U1 SNRP,SS-A (Ro) , SS-B (La), Anti Histone Abs. Anti Centromere abs, SCL-70 IGG, JO1 - IGG Abs.)"
    },
    {"test_name": "ANTI CENTROMERE ANTIBODIES"},
    {"test_name": "ANTI - CYCLIC CITRULLINATED PEPTIDE ANTIBODIES (ANTI-CCP)"},
    {"test_name": "ANTI DIURETIC HOROMONE (Vasopressin)"},
    {"test_name": "ANTI Dnase B"},
    {"test_name": "Anti-ECP (ANTI--EOSINIPHIL CATIONIC PROTEIN)"},
    {"test_name": "ANTI EPIDERMAL / PEMPHIGUS ANTIBODY"},
    {"test_name": "ANTI GLIADIN IgA ANTIBODIES"},
    {"test_name": "ANTI GLIADIN IgG ANTIBODIES"},
    {
      "test_name": "ANTI GLOMERULAR BASEMENT MEMBRANE IgG ANTIBODIES (ANTI GBM)"
    },
    {"test_name": "ANTI HISTONES ANTIBODIES"},
    {"test_name": "ANTI HUMAN TISSUE TRANSGLUTAMINASE ANTIBODY (IgG)"},
    {"test_name": "ANTI INSULIN ANTIBODIES"},
    {"test_name": "ANTI ISLET CELL ANTIBODY"},
    {"test_name": "ANTI ISLET CELL ANTIBODY WITH TITRE"},
    {"test_name": "ANTI-MPO ANTIBODIES (Anti-Myleoperoxidase Antibodies)"},
    {
      "test_name":
      "Anti-Müllerian Hormone (AMH)/ Müllerian Inhibiting Substance (MIS)"
    },
    {"test_name": "ANTI NMDA RECEPTOR ENCEPHALITIS IGG ANTIBODIES"},
    {
      "test_name":
      "ANTI NUCLEAR ANTIBODIES (ANA) OR ANA PATTERN (Reflex to end titre for all positive cases)"
    },
    {"test_name": "ANTI OVARY ANTIBODIES"},
    {"test_name": "ANTI OVARY ANTIBODIES TITRES"},
    {"test_name": "ANTI PARIETAL CELL ANTIBODY (APCA)"},
    {"test_name": "ANTI PARIETAL CELL ANTIBODY (APCA) WITH TITRE"},
    {"test_name": "ANTI-PHOSPHOLIPASE A2 RECEPTOR (PLA2R) IGG"},
    {"test_name": "ANTI PHOSPHOLIPID IgG ANTIBODIES"},
    {"test_name": "ANTI PHOSPHOLIPID IgM ANTIBODIES"},
    {
      "test_name":
      "ANTI PHOSPHOLIPID SYNDROME PANEL (Lupus Anticoagulant Screen, Cardiolipin IgG & IgM ABS, Anti-phospholipid IgG & IgM Abs)"
    },
    {"test_name": "ANTI-PR3 ANTIBODIES"},
    {"test_name": "ANTI SACCHAROMYCES CEREVISIAE (ASCA), IgA ANTIBODIES"},
    {"test_name": "ANTI SACCHAROMYCES CEREVISIAE (ASCA), IgG ANTIBODIES"},
    {"test_name": "ANTI SOLUBLE LIVER ANTIGEN"},
    {"test_name": "ANTI SPERM ANTIBODIES"},
    {"test_name": "ANTI STREPTOLYSIN-O ANTIBODIES (ASO )"},
    {"test_name": "ANTI THROMBIN III ACTIVITY( Functional)"},
    {"test_name": "ANTI THROMBIN III ANTIGEN"},
    {"test_name": "ANTI-THYROGLOBULIN ANTIBODIES (aTG)"},
    {
      "test_name":
      "ANTI-THYROID PEROXIDASE ANTIBODIES (aTPO) / ANTI MICROSOMAL ABS"
    },
    {"test_name": "Anti-Tryptase"},
    {
      "test_name":
      "APLA TOTAL (Lupus Anticoagulant Screen, Cardiolipin IgG & IgM Abs, Beta 2 Glycoprotein IgG & IgM Abs)"
    },
    {"test_name": "APO E GENOTYPING"},
    {"test_name": "APOLIPOPROTEIN A-I"},
    {"test_name": "APOLIPOPROTEIN B"},
    {"test_name": "APOLIPOPROTEIN – E"},
    {
      "test_name":
      "APOLIPOPROTEIN EVALUATION [Apolipo A-1, Apolipo B, Lipoprotein (a) ]"
    },
    {"test_name": "ARSENIC, 24 HR URINE"},
    {"test_name": "ARSENIC, BLOOD"},
    {"test_name": "ARSENIC, URINE SPOT"},
    {
      "test_name":
      "ARTHRITIS PANEL-1 (CBC, ESR, Protein electrophoresis, CRP, Uric Acid, ANA, ASO, RF & Urine routine)"
    },
    {
      "test_name":
      "ARTHRITIS PANEL-2 (CBC, ESR, CRP, Uric Acid, ANA, ASO, RF & Urine routine)"
    },
    {"test_name": "ASKA-SKELETAL (STRIATED)MUSCLE ANTIBODY,(SERUM IF)"},
    {
      "test_name":
      "ASMA (ANTI SMOOTH MUSCLE ANTIBODIES) WITH TITRE (Reflex to end titre to all positive cases)"
    },
    {"test_name": "ASO (ANTI STREPTOLYSIN-O ANTIBODIES)"},
    {"test_name": "ASPERGILLUS ANTIBODIES"},
    {"test_name": "ASPERGILLUS FUMIGATES DNA DETECTOR"},
    {
      "test_name":
      "AUTOGEN (Blood Lympho. Culture, Lupus Anti Coagulant Screen, Cardiolipin Antibodies & Anti Phospholipid Antibodies)"
    },
    {"test_name": "AUTOIMMUNE ENCEPHALITIS PANEL, SERUM"},
    {"test_name": "AUTOIMMUNE HEPATITIS PANEL-1 (ANA, SMA, AMA, LKM-1)"},
    {"test_name": "AUTOIMMUNE HEPATITIS PANEL-2 (ANCA , SLA)"},
    {"test_name": "B12 PLUS (Vitamin B12+Folic Acid)"},
    {"test_name": "BACTEC BLOOD CULTURE - AEROBIC"},
    {"test_name": "BACTEC BLOOD CULTURE- AEROBIC PAEDIATRIC CULTURE"},
    {"test_name": "BACTEC BLOOD CULTURE - YEAST"},
    {"test_name": "BACTEC CULTURE, BODY FLUID -YEAST"},
    {"test_name": "BACTEC PLUS ANAEROBIC - CULTURE, BODY FLUID"},
    {"test_name": "BACTERIAL ANTIGEN DETECTION (5 ANTIGENS)"},
    {"test_name": "BACTERIAL ANTIGEN DETECTION, CSF (5 ANTIGENS)"},
    {
      "test_name":
      "BACTERIAL MENINGITIS MULTIPLEX PCR (H. Influenzae, N. Meningitidis, S.Pnemoniae)"
    },
    {
      "test_name":
      "BACTERIAL PNEUMONIA PANEL (Mycoplasma Pneumoniae, S.Pneumoniae, Chlamydia Genus)"
    },
    {"test_name": "B-CAROTENE,SERUM"},
    {"test_name": "B-CELL GENE REARRANGEMENT"},
    {"test_name": "BCL-2 [PHOTO]"},
    {"test_name": "BCL-6 ONCOPROTEIN [PHOTO]"},
    {"test_name": "BCR-ABL 1 KINASE DOMAIN MUTATION ANALYSIS"},
    {"test_name": "BCR/ABL BREAKPOINT ANALYSIS (Philadelphia Chromosome)"},
    {"test_name": "BCR/ abl Gene rearrangement (PHILADELPHIA CHROMOSOME)"},
    {"test_name": "BCR/ABL IS - INTERNATIONAL SCALE (Philadelphia Chromosome)"},
    {"test_name": "BCR/abl - QUANTITATIVE (Philadelphia Chromosome)"},
    {"test_name": "BCR-abl t(9:22) (Philadelphia Chromosome)"},
    {
      "test_name": "BCR-abl TRANSCRIPT QUANTIFICATION (Philadelphia Chromosome)"
    },
    {
      "test_name":
      "B DIFFERENTIAL DIAGNOSIS (CD30, CD15, CD45, CD20, CD3, EMA)[PHOTO]"
    },
    {"test_name": "BENCE-JONES PROTEIN"},
    {"test_name": "BETA 2 GLYCOPROTEIN IGG"},
    {"test_name": "BETA 2 GLYCOPROTEIN IGM"},
    {"test_name": "BETA-2-MICROGLOBULIN"},
    {"test_name": "BETA-2-MICROGLOBULIN"},
    {"test_name": "BETA CROSSLAPS (BETA CTX) (CTx-1)"},
    {"test_name": "BETA-GALACTOCEREBROSIDASE"},
    {"test_name": "BETA - GALACTOSIDASE DISORDER: GM1/GANGLIOSIDOSIS"},
    {"test_name": "BETA GLUCOSIDASE"},
    {"test_name": "BETA-HUMAN CHORIONIC GONADOTROPIN, (BETA hCG)[PHOTO]"},
    {
      "test_name":
      "BETA THALASSEMIA MUTATION DETECTION (IVS1-5 G-C, 619 bp deletion, cd 8/9 + G, IVS1-1 G-T, 41/42 – TTCT)"
    },
    {"test_name": "BIOPSY (BONE HISTOPATHOLOGY)"},
    {"test_name": "BIOPSY (BONE HISTOPATHOLOGY) -PHOTO"},
    {
      "test_name": "BIOPSY; BRAIN BIOPSY WITH SPECIAL STAINS (PTAH & RETICULIN)"
    },
    {
      "test_name":
      "BIOPSY; H&E SLIDE FOR REVIEW (MORE THAN 2 SLIDES / PARAFFIN BLOCKS)"
    },
    {
      "test_name":
      "BIOPSY; H&E SLIDE FOR REVIEW (MORE THAN 2 SLIDES / PARAFFIN BLOCKS) [PHOTO]"
    },
    {
      "test_name":
      "BIOPSY; H&E SLIDE FOR REVIEW (UPTO 2 SLIDES / PARAFFIN BLOCKS)"
    },
    {
      "test_name":
      "BIOPSY & IMMUNOFLUORESCENT ASSAY; (HISTOPATH + IgG + IgA + IgM + C-3 + C1q + FIBRINOGEN ON TISSUE)"
    },
    {
      "test_name":
      "BIOPSY & IMMUNOFLUORESCENT ASSAY; (HISTOPATH + IgG + IgA + IgM + C-3 + C1q + FIBRINOGEN ON TISSUE [PHOTO])"
    },
    {"test_name": "BIOPSY (LARGE TISSUE / SPECIMEN)"},
    {"test_name": "BIOPSY (MEDIUM TISSUE / SPECIMEN)"},
    {
      "test_name": "BIOPSY; MUSCLE BIOPSY WITH SPECIAL STAINS (MASSON TRICHOME)"
    },
    {
      "test_name": "BIOPSY; NERVE BIOPSY WITH SPECIAL STAINS (LUXOL FAST & GBS)"
    },
    {"test_name": "BIOPSY (PHOTO) - MORE THAN ONE"},
    {"test_name": "BIOPSY (PHOTO) - SINGLE"},
    {
      "test_name":
      "BIOPSY; RENAL BIOPSY WITH SPECIAL STAINS (PAS, GMS & OTHER AS REQUIRED FOR EX: CONGORED IN AMYLOIDOSIS)"
    },
    {"test_name": "BIOPSY (SKIN HISTOPATHOLOGY)"},
    {"test_name": "BIOPSY (SKIN HISTOPATHOLOGY) -PHOTO"},
    {
      "test_name":
      "BIOPSY; SLIDE FOR REVIEW (UPTO 2 SLIDES / PARAFFIN BLOCKS) [PHOTO]"
    },
    {"test_name": "BIOPSY (SMALL TISSUE BIOPSY / SPECIMEN"},
    {"test_name": "BIOPSY (SMALL TISSUE BIOPSY / SPECIMEN)"},
    {"test_name": "BIOPSY (SMALL TISSUE BIOPSY / SPECIMEN) [PHOTO]"},
    {"test_name": "BIOTINIDASE, SERUM"},
    {"test_name": "BISMUTH, 24 HRS URINE"},
    {"test_name": "BISMUTH, BLOOD"},
    {"test_name": "BISMUTH, URINE SPOT"},
    {"test_name": "BK VIRUS DNA QUANTITATIVE"},
    {"test_name": "BLOOD LYMPHO CULTURE"},
    {
      "test_name":
      "BLOOD LYMPHO CULTURE BY FISH (Detects only five chromossomes -Down's syndrome,ambigious genetalia etc.)"
    },
    {
      "test_name":
      "BOH PANEL (LUPUS ANTICOAGULANT ASSAY, Antiphospholipid Evaluation, TORCH IgG & IgM 10 Parameter, ANA, TSH, Factor V Leiden (optional)"
    },
    {
      "test_name":
      "BOH TOTAL (TORCH IgG & IgM 10 Parameter, TSH, Lupus Anticoagulant Screen, Cardiolipin IgG & IgM Abs, Beta 2 Glycoprotein IgG & IgM Abs)"
    },
    {"test_name": "BONE MARROW ASPIRATION REFLEX WITH MPO"},
    {"test_name": "BONE MARROW ASPIRATION SMEARS"},
    {"test_name": "BONE MARROW REFLEX TO LAP"},
    {"test_name": "BORDETELLA PERTUSSIS IGG (SERUM,EIA)"},
    {"test_name": "BRAF V600E Mutation"},
    {"test_name": "BRCA 1 & 2 GENETIC TEST - BREAST CANCER"},
    {"test_name": "BREAST CANCER MONITOR I (CA 15-3, CEA)"},
    {
      "test_name":
      "BREAST CANCER PROGNOSIS PROFILE (ER, PGR, HER2/neu, DNA PLOIDY)[PHOTO]"
    },
    {
      "test_name":
      "BREAST CANCER PROGNOSIS TUMOR PROFILE #1A (ER, PGR, DNA PLOIDY) [PHOTO]"
    },
    {
      "test_name":
      "BREAST CANCER PROGNOSIS TUMOR PROFILE #2A (ER, PGR, DNA PLOIDY, CATHESPIN D) [PHOTO]"
    },
    {
      "test_name":
      "BREAST CANCER PROGNOSIS TUMOR PROFILE #3A (ER, PGR, DNA PLOIDY, PS2) [PHOTO]"
    },
    {
      "test_name":
      "BREAST CANCER PROGNOSIS TUMOR PROFILE #4A (ER, PGR, HER 2-neu, EGFR, DNA PLOIDY) [PHOTO]"
    },
    {
      "test_name":
      "BREAST CANCER PROGNOSIS TUMOR PROFILE #5A (ER, PGR, HER 2-neu, CATHESPIN D, EGFR, DNA PLOIDY) [PHOTO]"
    },
    {
      "test_name":
      "BREAST CANCER PROGNOSIS TUMOR PROFILE #6A (ER, PGR, DNA PLOIDY, CATHESPIN D, EGFR, HER 2neu, KI -67, PS2, P53) [PHOTO]"
    },
    {"test_name": "BREAST CA PANEL (ER, PGR, HER2/neu, KI-67)"},
    {"test_name": "BREAST EVALUATION PANEL (ER, PGR, HER2/neu)[PHOTO]"},
    {"test_name": "BRUCELLA ABORTUS IgG ANTIBODIES"},
    {"test_name": "BRUCELLA ANTIBODIES"},
    {"test_name": "BRUCELLA IgG & IgM ANTIBODIES"},
    {"test_name": "BRUCELLA IgM ANTIBODIES"},
    {"test_name": "BUCCAL SMEAR FOR BARR BODY ANALYSIS"},
    {"test_name": "C0NNEXIN 26 MUTATION"},
    {"test_name": "C 1 Esterase Functional"},
    {"test_name": "C3 (COMPLEMENT PROTEIN CONCENTRATION)"},
    {"test_name": "C3, IFA"},
    {"test_name": "C3 ON TISSUE [PHOTO]"},
    {"test_name": "C4 (COMPLEMENT PROTEIN CONCENTRATION)"},
    {"test_name": "C4d IMMUNOFLOURESCENCE"},
    {"test_name": "CA125"},
    {"test_name": "CA 125[PHOTO]"},
    {"test_name": "CA 15-3"},
    {"test_name": "CA 19-9"},
    {"test_name": "CA 19-9[PHOTO]"},
    {"test_name": "CA 72.4"},
    {"test_name": "CADMIUM, 24 HRS URINE"},
    {"test_name": "CADMIUM, BLOOD"},
    {"test_name": "CADMIUM, URINE SPOT"},
    {"test_name": "CALCITONIN"},
    {"test_name": "CALCITONIN[PHOTO]"},
    {"test_name": "CALPONIN [PHOTO]"},
    {"test_name": "CALPROTECTIN"},
    {"test_name": "CALRETENIN [PHOTO]"},
    {"test_name": "CANDIDA ALBICANS ANTIBODIES"},
    {"test_name": "CANDIDA ALBICANS DNA DETECTOR"},
    {"test_name": "CARBAMAZEPINE( TEGRETOL)"},
    {"test_name": "CARBOHYDRATE DEFICIENT TRANSFERRIN (CDT)"},
    {"test_name": "CARCINOEMBRYONIC ANTIGEN (CEA)"},
    {"test_name": "CARCINOEMBRYONIC ANTIGEN (CEA)[PHOTO]"},
    {"test_name": "CARDIOLIPIN IGA ANTIBODIES"},
    {"test_name": "CARDIOLIPIN IgG ANTIBODIES"},
    {"test_name": "CARDIOLIPIN IgG & IgM ANTIBODIES"},
    {"test_name": "CARDIOLIPIN IgM ANTIBODIES"},
    {"test_name": "CATECHOLAMINES, PLASMA"},
    {"test_name": "CATECHOLAMINES, URINE"},
    {"test_name": "CATHEPSIN-D [PHOTO]"},
    {"test_name": "CBC REFLEX TO LAP"},
    {"test_name": "CCD3"},
    {"test_name": "CCD79A"},
    {"test_name": "CD103"},
    {"test_name": "CD10 (CALLA)"},
    {"test_name": "CD 10 [PHOTO]"},
    {"test_name": "CD117 / C-KIT[PHOTO]"},
    {"test_name": "CD11c-PERCENT"},
    {"test_name": "CD 138 [PHOTO]"},
    {"test_name": "CD15[PHOTO]"},
    {"test_name": "CD16+56-PERCENT + ABSOLUTE COUNTS"},
    {"test_name": "CD19/KAPPA-PERCENT"},
    {"test_name": "CD19/LAMBDA-PERCENT"},
    {"test_name": "CD19-PERCENT"},
    {"test_name": "CD19/Tdt-PERCENT"},
    {"test_name": "CD 1a [PHOTO]"},
    {"test_name": "CD20 (PAN-B CELL) [PHOTO]"},
    {"test_name": "CD20-PERCENT"},
    {"test_name": "CD21[PHOTO]"},
    {"test_name": "CD22-PERCENT"},
    {"test_name": "CD23-PERCENT"},
    {"test_name": "CD25-PERCENT"},
    {"test_name": "CD2-PERCENT"},
    {"test_name": "CD30 (KI-1 ANTIGEN)[PHOTO]"},
    {"test_name": "CD31[PHOTO]"},
    {"test_name": "CD34 [PHOTO]"},
    {"test_name": "CD38-PERCENT"},
    {"test_name": "CD3/CD16+56-PERCENT"},
    {"test_name": "CD3/CD19-PERCENT"},
    {"test_name": "CD3/CD4-ABSOLUTE"},
    {"test_name": "CD3 (PAN-T CELL) [PHOTO]"},
    {"test_name": "CD43 [PHOTO]"},
    {"test_name": "CD45-PERCENT"},
    {
      "test_name":
      "CD45 [PHOTO] [Also called as LEUCOCYTE COMMON ANTIGEN (LCA)]"
    },
    {"test_name": "CD45RA[PHOTO]"},
    {"test_name": "CD45RB[PHOTO]"},
    {"test_name": "CD45RO[PHOTO]"},
    {
      "test_name":
      "CD4/CD8 (Lymphocyte Enumeration STudy-T Cells (%CD3,%CD4,%CD8,ABS CD3,ABS CD4,ABS CD8))"
    },
    {
      "test_name":
      "CD4 (Lymphocyte Enumeration, T- HELPER CELLS, (%CD3,%CD4,ABS CD3,ABS CD4))"
    },
    {"test_name": "CD4 (LYMPHOCYTE SUBSET PERCENTAGE AND ABSOLUTE COUNT)"},
    {"test_name": "CD4 (T-Helper cell)[PHOTO]"},
    {"test_name": "CD 56 [PHOTO]"},
    {"test_name": "CD5/CD19-PERCENT"},
    {"test_name": "CD5-PERCENT"},
    {"test_name": "CD5-PERCENT"},
    {"test_name": "CD5[PHOTO]"},
    {"test_name": "CD 79A [PHOTO]"},
    {"test_name": "CD 7{PHOTO}"},
    {"test_name": "CD 8 [PHOTO]"},
    {"test_name": "C DIFFICILE TOXIN A/B: RAPID TEST"},
    {"test_name": "C.diptheria Toxin A and B PCR"},
    {"test_name": "CDSA 2.0 RANDOM (KIT BASED TEST ONLY)"},
    {"test_name": "CDSA (KIT BASED TEST ONLY)"},
    {"test_name": "CDX2 (IHC)"},
    {"test_name": "CEBPA MUTATION DETECTION"},
    {"test_name": "CELIAC PROFILE (Ttg IgA ABS, Gliadin IgG & IgA ABS)"},
    {"test_name": "CERULOPLASMIN"},
    {"test_name": "CH 50 COMPLEMENT TOTAL SERUM"},
    {"test_name": "CHICKEN POX (VARICELLA ZOSTER VIRUS (VZV) IgG ANTIBODIES)"},
    {"test_name": "CHICKEN POX (VARICELLA ZOSTER VIRUS (VZV) IgM ANTIBODIES)"},
    {"test_name": "CHIKUNGUNYA IgM ANTIBODY, SERUM"},
    {"test_name": "CHIKUNGUNYA IgM - RAPID"},
    {"test_name": "CHIMERISM (Post -transplant)"},
    {"test_name": "CHIMERISM (Pre transplant, Donor and recipient)"},
    {"test_name": "Chitotriosidase (Plasma)"},
    {"test_name": "CHLAMYDIA DNA DETECTOR"},
    {"test_name": "CHLAMYDIA PNEUMONIAE ANTIBODIES"},
    {"test_name": "CHLAMYDIA PNEUMONIAE IgA ANTIBODIES"},
    {"test_name": "CHLAMYDIA PNEUMONIAE IgG ANTIBODIES"},
    {"test_name": "CHLAMYDIA PNEUMONIAE IgM ANTIBODIES"},
    {"test_name": "CHLAMYDIA SPECIATION"},
    {"test_name": "CHLAMYDIA TRACHOMATIS ANTIBODIES"},
    {"test_name": "CHLAMYDIA TRACHOMATIS IgG ANTIBODIES"},
    {"test_name": "CHLAMYDIA TRACHOMATIS IgM ANTIBODIES"},
    {"test_name": "CHROMIUM, 24 HRS URINE"},
    {"test_name": "CHROMIUM, BLOOD"},
    {"test_name": "CHROMIUM, SERUM"},
    {"test_name": "CHROMIUM, URINE SPOT"},
    {"test_name": "CHROMOGRANIN A"},
    {"test_name": "CHROMOGRANIN A [PHOTO]"},
    {"test_name": "CHROMOSOME ANALYSIS IN HEMATOLOGICAL DISORDERS"},
    {
      "test_name":
      "CHRONIC FATIGUE SYNDROME PANEL (CBC, ESR, Random Glucose, Creatinine, Calcium, Magnesium, Electrolytes, ALT, HBsAg, HIV, HCV, ANA, TSH, Folic Acid, Urinalysis, Food Allergy (Wheat, Milk, Peanut)"
    },
    {
      "test_name":
      "CHRONIC LYMPHOPROLIFERATIVE DISORDER PANEL (CD5, CD10, CD19, CD20, CD22, CD23, CD25, CD38, CD11c, CD103, FMC 7, HLA DR, Surface immunoglobulins AND LIGHT CHAINS )"
    },
    {"test_name": "CIRCULATING TUMOR CELLS (CTC)"},
    {"test_name": "CITRATE, URINE 24 H ENZYMATIC"},
    {"test_name": "C-KIT GIST"},
    {"test_name": "C-KIT MUTATION"},
    {
      "test_name":
      "CLL PANEL by FISH (13q14.3, 17p13.1, 11q22.3 deletions and Trisomy 12)"
    },
    {"test_name": "Clostridium Difficile Real Time PCR"},
    {"test_name": "cmPO"},
    {"test_name": "cmPO / CCD79A / CCD3"},
    {"test_name": "CMV COMBI TEST (CMV Viral Load/GCV resistance)"},
    {"test_name": "CMV IHC MARKER - CoE Histopathlogy"},
    {"test_name": "CMV Viral Load"},
    {"test_name": "COBALT, 24 HRS URINE"},
    {"test_name": "COBALT, BLOOD"},
    {"test_name": "COBALT URINE SPOT URINE"},
    {"test_name": "COLORECTAL CANCER PANEL (KRAS, NRAS & BRAF)"},
    {"test_name": "COMMON MUTATION PANEL mtDNA"},
    {"test_name": "COMPLEMENT C1q"},
    {"test_name": "COMPLEMENT PROTEIN CONCENTRATION (C3)"},
    {"test_name": "COMPLEMENT PROTEIN CONCENTRATION (C4)"},
    {
      "test_name":
      "COMPLETE DISGNOSIS WITH SPECIAL STAINS & IHC (AS AND WHEN NEEDED)[PHOTO]"
    },
    {
      "test_name":
      "COMPREHENSIVE CORONARY RISK PROFILE (Extended Coronary Risk Profile, Homocysteine)"
    },
    {"test_name": "COMPREHENSIVE MYELOMA PROTEIN PANEL"},
    {"test_name": "COMPREHENSIVE NEONATAL SCREENING PANEL"},
    {
      "test_name":
      "COMPREHENSIVE NEONATAL SCREENING PANEL (Neonatal Screening Panel-1+NBS by MS/MS)"
    },
    {
      "test_name":
      "COMPREHENSIVE VIRAL FLU PANEL (INFLUENZA A, INFLUENZA B, PARA INFLUENZA, RSV & NOVEL H1N1 VIRUS)"
    },
    {"test_name": "COMT GENOTYPING"},
    {"test_name": "CONNEXIN 30 MUTATION DETECTION"},
    {"test_name": "COOMBS DIRECT TEST"},
    {"test_name": "COOMBS INDIRECT TEST"},
    {"test_name": "COOMBS TITRE (Rh ANTIBODY TITRE)"},
    {"test_name": "COPPER, 24 HRS URINE"},
    {
      "test_name":
      "COPPER REFLEX TO CERULOPLASMIN (CERULOPLASMIN WILL BE PERFORMED IF LOW VALUE OF COPPER)"
    },
    {"test_name": "COPPER, SERUM"},
    {"test_name": "COPPER, URINE SPOT"},
    {
      "test_name":
      "CORONARY RISK PROFILE EXTENDED (E CROP) (CORONARY RISK PROFILE +APOLIPOPROTEIN EVALUATION)"
    },
    {"test_name": "CORTISOL"},
    {"test_name": "CORTISOL FREE, Urine"},
    {"test_name": "COUPLE KARYOTYPING - (PBLC)"},
    {"test_name": "COXSACKIE ANTIBODY - IGG, SERUM"},
    {"test_name": "COXSACKIE ANTIBODY - IGM, SERUM"},
    {"test_name": "C-PEPTIDE"},
    {"test_name": "CREATINE KINASE - MB"},
    {"test_name": "CREATININE KINASE -MUSCLE BRAIN (CK-MB)"},
    {"test_name": "CRYOGLOBULIN-QUALITATIVE"},
    {"test_name": "CRYPTOCOCCUS ANTIGEN"},
    {"test_name": "CRYPTOCOCCUS ANTIGEN, CSF"},
    {"test_name": "CRYPTOCOCCUS NEOFORMANS DNA DETECTOR"},
    {
      "test_name":
      "CRYPTOSPORIDIUM ANTIGEN DETECTION FROM STOOL: RAPID CARD TEST"
    },
    {"test_name": "CSF,MEASELS (RUBEOLA), IGG ANTIBODIES"},
    {"test_name": "CTC (CIRCULATING TUMOR CELLS)"},
    {"test_name": "CUSTOM LEUKEMIA PANEL (FOUR SURFACE MARKERS)"},
    {"test_name": "CUSTOM LEUKEMIA PANEL (SIX SURFACE MARKERS)"},
    {"test_name": "CYCLIN D1[PHOTO]"},
    {"test_name": "CYCLOSPORINE, EDTA/HEPARIN WHOLE BLOOD"},
    {"test_name": "CYFRA 21-1"},
    {"test_name": "CYP2C19 GENOTYPING"},
    {"test_name": "CYP3A4*22 Genotyping"},
    {"test_name": "CYSTATIN C"},
    {"test_name": "CYSTICERCUS IgG ANTIBODIES"},
    {"test_name": "CYSTICERCUS IgG ANTIBODIES"},
    {"test_name": "CYSTIC FIBROSIS DELTA F508 GENE MUTATION"},
    {
      "test_name":
      "CYTOCHEMISTRY PANEL FOR LEUKEMIAS (PERIODIC ACID SCHIFF,SUDAN BLACK B and MYELOPEROXIDASE)"
    },
    {"test_name": "CYTOGENETICS: 14q rearrangement"},
    {"test_name": "CYTOGENETICS: 1p/19q"},
    {"test_name": "CYTOGENETICS: ACUTE PROMYELOCYTIC LEUKEMIA (APL)"},
    {"test_name": "CYTOGENETICS: AMLI / ETO t(8:21)"},
    {"test_name": "CYTOGENETICS: BLOOD LYMPHO CULTURE"},
    {"test_name": "CYTOGENETICS: BUCCAL SMEAR FOR BARR BODY ANALYSIS"},
    {
      "test_name":
      "CYTOGENETICS: CHROMOSOME ANALYSIS IN HEMATOLOGICAL DISORDERS"
    },
    {"test_name": "CYTOGENETICS: DEL 13q"},
    {"test_name": "CYTOGENETICS: EGFR Gene AMPLIFICATION"},
    {"test_name": "CYTOGENETICS: FANCONI ANEMIA"},
    {"test_name": "CYTOGENETICS: FRAGILE X CHROMOSOME ANALYSIS"},
    {"test_name": "CYTOGENETICS: HER2/neu"},
    {"test_name": "CYTOGENETICS: Inv(16)"},
    {"test_name": "CYTOGENETICS: MDS PANEL"},
    {"test_name": "CYTOGENETICS: MLL 11q rearrangement"},
    {"test_name": "CYTOGENETICS; MYC gene"},
    {
      "test_name":
      "CYTOGENETICS: NEONATAL KARYOTYPING (NEWBORN TO ONE MONTH OLD CHILD)"
    },
    {"test_name": "CYTOGENETICS: PML Ra Ra t(15:17)"},
    {"test_name": "CYTOGENETICS: PRODUCT OF CONCEPTION (POC)"},
    {"test_name": "CYTOGENETICS: TEL/AML"},
    {"test_name": "CYTOKERATIN 18[PHOTO]"},
    {"test_name": "CYTOKERATIN - 19 [PHOTO]"},
    {"test_name": "CYTOKERATIN - 20 [PHOTO]"},
    {"test_name": "CYTOKERATIN - 5/6 [PHOTO]"},
    {"test_name": "CYTOKERATIN - 7 [PHOTO]"},
    {"test_name": "CYTOKERATIN 8 [PHOTO]"},
    {"test_name": "CYTOKERATIN-HMW, 34BE12 (SQUAMOUS)[PHOTO]"},
    {"test_name": "CYTOKERATIN-LMW, 35BH11 (NON SQUAMOUS)[PHOTO]"},
    {"test_name": "CYTOMEGALOVIRUS COMBI TEST (CMV Viral Load/GCV resistance)"},
    {"test_name": "CYTOMEGALOVIRUS DNA DETECTOR"},
    {"test_name": "CYTOMEGALOVIRUS IgG ANTIBODIES"},
    {"test_name": "CYTOMEGALOVIRUS IGG AVIDITY"},
    {"test_name": "CYTOMEGALOVIRUS IgG & IgM ANTIBODIES"},
    {"test_name": "CYTOMEGALOVIRUS IgM ANTIBODIES"},
    {"test_name": "D3-HYDROXYBUTYRATE(RANBUT)"},
    {"test_name": "D-DIMER(Semi Quantitative)"},
    {"test_name": "DEHYDROEPIANDROSTERONE (DHEA)"},
    {"test_name": "DEHYDROEPIANDROSTERONE-SULFATE (DHEAS)"},
    {"test_name": "DEL 13q"},
    {"test_name": "DENGMAL (Dengue Abs (Rapid), MP, CBC )"},
    {"test_name": "DENGUE DUO RAPID TEST"},
    {"test_name": "DENGUE NS1 ANTIGEN TEST"},
    {"test_name": "DENGUE VIRUS IgG ANTIBODIES,"},
    {"test_name": "DENGUE VIRUS IgG & IgM ANTIBODIES, QUALITATIVE"},
    {"test_name": "DENGUE VIRUS IgM ANTIBODIES"},
    {"test_name": "DESMIN [PHOTO]"},
    {"test_name": "DF MMP-3"},
    {
      "test_name":
      "DIABETES MELLITUS PANEL II (Glucose F & PP, Glyco Hb, Creatinine, Microalbuminuria, Cholesterol, HDL Cholesterol, LDL Cholesterol, Triglycerides, Uric acid, Urinalysis)"
    },
    {
      "test_name":
      "DIABETES MONITORING PANEL (Glucose F & PP, Glyco HB, Urinalysis, Insulin, Microalbuminuria, Cholesterol, HDL Cholesterol, LDL Cholesterol, Creatinine, Triglycerides, Uric acid)"
    },
    {
      "test_name":
      "DIC PROFILE (PT, APTT, TT, Fibrinogen, FDP, D- DIMER, Platelet count)"
    },
    {"test_name": "DIFFERENTAIL DIAGNOSIS OF MEDIASTINAL MASS[PHOTO]"},
    {"test_name": "DI-GEORGE SYNDROME"},
    {"test_name": "DIGOXIN (lanoxin)"},
    {"test_name": "DIHYDROTESTOSTERONE (DHT)"},
    {"test_name": "DIPTHERIA IGG ABS,SERUM"},
    {"test_name": "DIRECT LDL"},
    {"test_name": "DNA PLOIDY & CELL CYCLE ANALYSIS"},
    {"test_name": "DOPAMINE"},
    {
      "test_name":
      "DPD GENE MUTATIONS (Dihydropyrimidine Dehydrogenase Gene Mutation)"
    },
    {"test_name": "DRPLA Gene analysis"},
    {
      "test_name":
      "DRUGS OF ABUSE: 5 DRUGS (Opiates, PCP, Cocaine, Cannabinoids, Amphetamine)"
    },
    {
      "test_name":
      "DRUGS OF ABUSE: 6 DRUGS (Opiates, PCP, Cocaine, Cannabinoids, Amphetamine, Barbiturates)"
    },
    {
      "test_name":
      "DRUGS OF ABUSE: 9 DRUGS (Opiates, PCP, Cocaine, Cannabinoids, Amphetamine, Barbiturates, Benzodiazepines, Methodone, Propoxyphene)"
    },
    {"test_name": "DRUGS OF ABUSE: AMPHETAMINE"},
    {"test_name": "DRUGS OF ABUSE: BARBITURATES"},
    {"test_name": "DRUGS OF ABUSE: BENZODIAZEPINES"},
    {"test_name": "DRUGS OF ABUSE: CANNABINOIDS"},
    {"test_name": "DRUGS OF ABUSE: COCAINE"},
    {"test_name": "DRUGS OF ABUSE: METHAMPHETAMINE"},
    {"test_name": "DRUGS OF ABUSE: METHAQUOLONE"},
    {"test_name": "DRUGS OF ABUSE: OPIATES"},
    {"test_name": "DRUGS OF ABUSE: PHENYCYCLIDINE (PCP)"},
    {"test_name": "DRUGS OF ABUSE: PROPOXYPHENE"},
    {"test_name": "DRUGS OF ABUSE: TETRAHYDROCANNABINOL"},
    {"test_name": "DsDNA (Reflex to end titre for all positive cases)"},
    {
      "test_name":
      "DUCHENNE / BECKER MUSCULAR DYSTROPHY (This test is not intended for carrier detection. thus, specimens from males only would be accepted)"
    },
    {"test_name": "EBV-LMP - 1 (ANTI-EPSTEIN-BARR VIRUS, LMP) [PHOTO]"},
    {"test_name": "E-CADHERIN [PHOTO]"},
    {"test_name": "ECHINOCOCCUS IgG ANTIBODIES"},
    {"test_name": "E.COLI O157 ANTIGEN DETECTION"},
    {"test_name": "EGFR Gene AMPLIFICATION"},
    {
      "test_name":
      "EGFR Mutation Detection (IF TISSUE RECEIVED; TISSUE PROCESSING WILL BE CHARGED SEPERATELY.)"
    },
    {"test_name": "E.HISTOLYTICA ANTIGEN DETECTION"},
    {"test_name": "ELECTRON MICROSCOPY - PHOTOGRAPH"},
    {"test_name": "ELECTRON MICROSCOPY – TISSUE"},
    {"test_name": "EML-4 ALK Translocation by FISH"},
    {"test_name": "ENDOMYSIAL ANTIBODY IgA, SERUM"},
    {"test_name": "ENDOMYSIAL ANTIBODY IgA, SERUM WITH TITRE"},
    {"test_name": "ENTAMOEBA HISTOLYTICA ANTIBODIES"},
    {"test_name": "ENTEROQUICK (Bactec Blood Culture + Rapid Thyphi IgM )"},
    {"test_name": "Enterovirus real time PCR"},
    {"test_name": "EOSINIPHIL CATIONIC PROTEIN"},
    {"test_name": "EPIDERMAL GROWTH FACTOR RECEPTOR (EGFR) [PHOTO]"},
    {"test_name": "EPITHELIAL MEMBRANE ANTIGEN (EMA) [PHOTO]"},
    {
      "test_name":
      "EPSTEIN BARR VIRUS ANTIBODIES TETRA PANEL {(EBV (VCA) IgG, EBV(VCA) IgM),EBV(EA) IgG] (INFECTIOUS MONONUCLEOSIS)"
    },
    {
      "test_name":
      "EPSTEIN BARR VIRUS EARLY ANTIGEN IgG ANTIBODIES, EBV (EA) (INFECTIOUS MONONUCLEOSIS)"
    },
    {"test_name": "EPSTEIN-BARR VIRUS (EBV) DNA PCR"},
    {
      "test_name":
      "EPSTEIN BARR VIRUS NUCLEAR ANTIGEN IgG ANTIBODIES, EBV (NA) (INFECTIOUS MONONUCLEOSIS)"
    },
    {
      "test_name":
      "EPSTEIN BARR VIRUS NUCLEAR ANTIGEN IgM ANTIBODIES, EBV (NA) (INFECTIOUS MONONUCLEOSIS)"
    },
    {
      "test_name":
      "EPSTEIN BARR VIRUS VIRAL CAPSID ANTIGEN IgG ANTIBODIES, EBV (VCA) (INFECTIOUS MONONUCLEOSIS)"
    },
    {
      "test_name":
      "EPSTEIN BARR VIRUS VIRAL CAPSID ANTIGEN IgM ANTIBODIES, EBV (VCA) (INFECTIOUS MONONUCLEOSIS)"
    },
    {"test_name": "ERYTHROPOIETIN"},
    {"test_name": "ESCHERICHIA COLI K1 ANTIGEN"},
    {"test_name": "ESCHERICHIA COLI K1 ANTIGEN"},
    {"test_name": "ESTRADIOL"},
    {"test_name": "ESTRIOL, UNCONJUGATED"},
    {"test_name": "ESTROGEN RECEPTOR (ER) [PHOTO]"},
    {"test_name": "ESTROGEN RECEPTOR & PROGESTERONE RECEPTOR, [PHOTO]"},
    {"test_name": "ESTRONE"},
    {"test_name": "EVEROLIMUS, EDTA/HEPARIN WHOLE BLOOD"},
    {
      "test_name":
      "EXTENDED CORONARY RISK PROFILE (E CROP) (Coronary risk profile + Apolipoprotein Evaluation)"
    },
    {
      "test_name":
      "EXTRACTABLE NUCLEAR ANTIGEN (ANCEA, SS-A, SS-B, U1SNRNP, SCL-70)"
    },
    {"test_name": "FACTOR II (PROTHROMBIN) MUTATION DETECTION"},
    {"test_name": "FACTOR IX ACTIVITY"},
    {"test_name": "FACTOR VIII ACTIVITY"},
    {"test_name": "FACTOR VIII[PHOTO]"},
    {"test_name": "FACTOR V MUTATION DETECTION"},
    {"test_name": "FACTOR XIII ACTIVITY(Qualitative)"},
    {"test_name": "FANCONI ANEMIA"},
    {"test_name": "FDP(DR-70) - ONCOSURE"},
    {"test_name": "FECAL CALPROTECTIN"},
    {"test_name": "FEMALE HORMONAL PANEL (KIT BASED TEST ONLY)"},
    {"test_name": "FERRITIN"},
    {
      "test_name":
      "FERTILITY PANEL, FEMALE, ENDOCRINE (TSH3G UL, Prolactin, Progesterone, Estradiol, LH, FSH)"
    },
    {
      "test_name":
      "FERTILITY PANEL, MALE, ENDOCRINE (Testosterone Free & Total, LH, FSH, Prolactin)"
    },
    {
      "test_name":
      "FEVER SCREENING PANEL (CBC,ESR,CRP ,BLOOD CULTURE/SENSITIVITY,RAPID TYPHI IgM,MALARIA AG DETECTION & URINALYSIS)"
    },
    {"test_name": "FIBRINOGEN"},
    {"test_name": "FIBRINOGEN DEGRADATION PRODUCTS (FDP) (SEMI QUANTITATIVE)"},
    {"test_name": "FIBRINOGEN LEVEL"},
    {"test_name": "FIBROMETER VIRUS"},
    {"test_name": "FILARIA IgG/IgM ANTIBODIES"},
    {
      "test_name":
      "FINE NEEDLE ASPIRATION CYTOLOGY (FNAC), PROCEDURE (FOR SRL MUMBAI WALK-IN PATIENTS ONLY)"
    },
    {
      "test_name":
      "FLOWCYTOMETRY PANEL; CHRONIC LYMPHOPROLIFERATIVE DISORDER PANEL (CD5, CD10, CD19, CD20, CD22, CD23, CD25, CD38, CD11c, CD103, FMC 7, HLA DR, Surface immunoglobulins AND LIGHT CHAINS )"
    },
    {
      "test_name":
      "FLOWCYTOMETRY PANEL; MYELOMA PANEL (CD38,CD56,CD19.KAPPA,LAMBDA,CD45, CD138)"
    },
    {
      "test_name":
      "FLOWCYTOMETRY PANEL; NATURAL KILLER CELL EVALUATION (%CD16+56,ABS CD16+CD56)"
    },
    {
      "test_name":
      "FLOWCYTOMETRY PANEL; NATURAL KILLER PANEL (CD3,CD16,CD56,CD45)"
    },
    {"test_name": "FLT3 MUTATION DETECTION"},
    {"test_name": "FLU REAL TIME PCR"},
    {"test_name": "FNAC / CYTOLOGY SMEARS - CoE Histopathlogy"},
    {"test_name": "FOLIC ACID"},
    {"test_name": "FOLLICLE STIMULATING HORMONE (FSH)"},
    {"test_name": "FOLLICLE STIMULATING HORMONE (FSH)[PHOTO]"},
    {
      "test_name":
      "FOLLICLE STIMULATING HORMONE & LUTEINIZING HORMONE EVALUATION (FSH & LH)"
    },
    {
      "test_name":
      "FOLLICLE STIMULATING HORMONE, LUTEINIZING HORMONE EVALUATION & PROLACTIN (LH, FSH & PL)"
    },
    {"test_name": "FOOD DETECT"},
    {"test_name": "FOOD INTOLERANCE TEST"},
    {"test_name": "FRAGILE X (FMR 1) MUTATION SCREEN"},
    {"test_name": "FREE ANDROGEN INDEX"},
    {"test_name": "FREE BETA HCG (FBHCG)"},
    {"test_name": "FREE PROTEIN S"},
    {"test_name": "FREE PSA"},
    {"test_name": "FREE THYROXINE , FT4"},
    {"test_name": "FREE TRIIODOTHYRONINE, FT3"},
    {"test_name": "Freidreichs Ataxia mutation analysis"},
    {"test_name": "FRUCTOSAMINE"},
    {"test_name": "FSH (FOLLICLE STIMULATING HORMONE)"},
    {
      "test_name":
      "FSH & LH (FOLLICLE STIMULATING HORMONE & LUTEINIZING HORMONE EVALUATION)"
    },
    {"test_name": "FT3, FREE TRIIODOTHYRONINE"},
    {"test_name": "FT4, FREE THYROXINE"},
    {"test_name": "G6-PD (GLUCOSE-6-PHOSPATE DEHYDROGENASE), (QUALITATIVE)"},
    {"test_name": "G6PD QUALITATIVE REFLEX G6PD QUANTITATIVE ESTIMATION"},
    {"test_name": "GALACTOMANNAN"},
    {"test_name": "Galactosemia (GALT) Gene Mutation"},
    {"test_name": "GALL BLADDER STONE ANALYSIS"},
    {"test_name": "GASTRIN"},
    {"test_name": "GASTROENTERITIS SCREENING PANEL"},
    {
      "test_name":
      "GCDFP-15 (ANTI-HUMAN GROSS CYSTIC DISEASE FLUID PROTEIN-15)[PHOTO]"
    },
    {"test_name": "GCV RESISTANCE BY SEQUENCING"},
    {"test_name": "GENE EXPERT (XPERT MTB / RIF)"},
    {"test_name": "GENE EXPERT (XPERT MTB / RIF) - EXTRAPULMONARY"},
    {"test_name": "GENETIC DISORDERS; ANGELMANS SYNDROME MS PCR"},
    {"test_name": "GENETIC DISORDERS; DRPLA Gene analysis"},
    {"test_name": "GENETIC DISORDERS: Freidreichs Ataxia mutation analysis"},
    {"test_name": "GENETIC DISORDERS; MILLER DIEKKER SYNDROME"},
    {"test_name": "GENETIC DISORDERS; PRADER- WILLI SYNDROME MS PCR"},
    {
      "test_name":
      "GENETIC DISORDERS; RETT SYNDROME DNA SEQUENCING ( MECP2 MUTATION)"
    },
    {"test_name": "GENETIC DISORDERS; SCA10 (SPINAL CEREBRAL ATAXIA TYPE-10)"},
    {"test_name": "GENETIC DISORDERS; SCA 12 (SPINAL CEREBRAL ATAXIA TYPE-12)"},
    {"test_name": "GENETIC DISORDERS; SCA17 (SPINAL CEREBRAL ATAXIA TYPE-17)"},
    {"test_name": "GENETIC DISORDERS; SCA 2 (SPINAL CEREBRAL ATAXIA TYPE-2)"},
    {"test_name": "GENETIC DISORDERS; SCA 3 (SPINAL CEREBRAL ATAXIA TYPE-3)"},
    {"test_name": "GENETIC DISORDERS; SCA 6 (SPINAL CEREBRAL ATAXIA TYPE-6)"},
    {"test_name": "GENETIC DISORDERS; SCA 7 (SPINAL CEREBRAL ATAXIA TYPE-7)"},
    {"test_name": "GENETIC DISORDERS; SMA CARRIER DETECTION"},
    {"test_name": "GENETIC DISORDERS; SPORTS GENE TEST (ACTN3 Genotyping)"},
    {
      "test_name":
      "GENOTYPIC ASSAY – TB SECOND LINE DRUG (Note: This test is not applicable for MOTT)"
    },
    {
      "test_name":
      "GIARDIA LAMBILA ANTIGEN DETACTION FROM STOOL; RAPID CARD TEST"
    },
    {"test_name": "GLIAL FIBRILLARY ACIDIC PROTEIN (GFAP) [PHOTO]"},
    {"test_name": "Glucose-6 Phospahte Dehydrogenase (G6PD) Gene Mutations"},
    {"test_name": "GLUCOSE-6-PHOSPATE DEHYDROGENASE, (G6-PD), QUANTITATIVE"},
    {"test_name": "GLUTAMIC ACID DECARBOXYLASE (GAD) IgG ANTIBODIES"},
    {"test_name": "GLYCOPHORIN A (ERYTHROID)"},
    {"test_name": "GROWTH HORMONE (GH)"},
    {"test_name": "GROWTH HORMONE (GH)[PHOTO]"},
    {"test_name": "GROWTH HORMONE STIMULATION TEST"},
    {"test_name": "GUT IMMUNOLOGY (KIT BASED TEST ONLY)"},
    {"test_name": "HAEMOPHILUS INFLUENZAE B ANTIGEN"},
    {"test_name": "HAEMOPHILUS INFLUENZAE B ANTIGEN, CSF"},
    {"test_name": "HAM TEST (ACIDIFIED SERUM LYSIS TEST)"},
    {"test_name": "HANTA VIRUS-IGM, SERUM BY EIA"},
    {"test_name": "HAPTOGLOBIN"},
    {"test_name": "HAPTOGLOBIN GENOTYPING"},
    {"test_name": "HBeAG NEGATIVE REFLEX TO HBV PRECORE & BASAL CORE MUTATION"},
    {
      "test_name":
      "HB VARIANT REFLEX WITH RED CELL INDICES (PERFORMED IF HB A2 OR HB F IS ABNORMAL) / SICKLING TEST (PERFORMED IF HB S IS ABNORMAL)"
    },
    {"test_name": "HBV BASAL CORE PROMOTER MUTATION"},
    {
      "test_name":
      "HBV DRUG RESISTANCE (Lamivudine, Telbivudine, Adefovir, Tenofovir and Entecavir)"
    },
    {"test_name": "HBV GENOTYPING"},
    {"test_name": "HBV PRECORE MUTATION"},
    {"test_name": "HBV QUALITATIVE"},
    {"test_name": "HBV QUANTITATIVE BY COBAS TAQMAN"},
    {"test_name": "HBV QUANTITATIVE BY COBAS TAQMAN"},
    {"test_name": "HBV VIRAL LOAD BY REAL TIME PCR"},
    {"test_name": "HCG (HUMAN CHORIONIC GONADOTROPIN)"},
    {"test_name": "HCV4 (HCV RNA Qualitative AND HCV Antibodies)"},
    {"test_name": "HCV ALPHA (HCV RNA Quantitative and HCV Genotyping)"},
    {"test_name": "HCV GENOTYPING"},
    {"test_name": "HCV RNA PCR, QUALITATIVE"},
    {"test_name": "HCV RNA QUANTITATIVE"},
    {"test_name": "HCV VIRAL LOAD BY REAL TIME PCR"},
    {"test_name": "HE4 (Human Epididymis Protein-4)"},
    {
      "test_name":
      "HEALTH KUNDLI-BRIDE/GROOM (ABO Rh Blood Group, VDRL, HBsAg, HIV 1&2 Antibodies, HB Variant Analysis)"
    },
    {"test_name": "HEART ENSURE PANEL"},
    {"test_name": "HELICOBACTER PYLORI IgA ANTIBODIES"},
    {"test_name": "HELICOBACTER PYLORI IgG ANTIBODIES"},
    {"test_name": "HELICOBACTER PYLORI IgM ANTIBODIES"},
    {"test_name": "HEMOGLOBIN VARIANT ANALYSIS"},
    {"test_name": "HEMOPHILIA PANEL (APTT, FACTOR VIII, FACTOR IX)"},
    {"test_name": "HEPAR-1 [ANTI-HUMAN HEPATOCYTE )"},
    {
      "test_name":
      "HEPATITIS A & B VIRUS EVALUATI0N (HEP A IgG & IgM, HBCORE TOTAL & IgM, HBsABS, HBsAg, HBeABS, HBeAg)"
    },
    {"test_name": "HEPATITIS A IGG ANTIBODY"},
    {"test_name": "HEPATITIS A VIRUS IgG & IgM ANTIBODIES"},
    {"test_name": "HEPATITIS A VIRUS IgM ANTIBODIES"},
    {"test_name": "HEPATITIS B CORE TOTAL ANTIBODIES"},
    {"test_name": "HEPATITIS Be VIRUS ANTIGEN"},
    {"test_name": "HEPATITIS Be VIRUS ANTIGEN / ANTIBODY EVALUATION"},
    {"test_name": "HEPATITIS Be VIRUS TOTAL ANTIBODIES"},
    {"test_name": "HEPATITIS B SURFACE ANTIBODIES (HBsAb), TOTAL WITH TITRE"},
    {
      "test_name":
      "HEPATITIS B SURFACE ANTIGEN NEUTRALIZATION (WITH CONFIRMATION)"
    },
    {"test_name": "HEPATITIS B SURFACE ANTIGEN[PHOTO]"},
    {"test_name": "HEPATITIS B VIRUS BASAL CORE PROMOTER MUTATION"},
    {"test_name": "HEPATITIS B VIRUS CORE ANTIGEN[PHOTO]"},
    {"test_name": "HEPATITIS B VIRUS CORE IgM ANTIBODIES"},
    {"test_name": "HEPATITIS B VIRUS DNA DETECTOR, QUALITATIVE"},
    {"test_name": "HEPATITIS B VIRUS DNA ,QUANTITATIVE"},
    {
      "test_name":
      "HEPATITIS B VIRUS DRUG RESISTANCE (Lamivudine, Telbivudine, Adefovir, Tenofovir and Entecavir)"
    },
    {
      "test_name":
      "HEPATITIS B VIRUS EVALUATION (HBCORE TOTAL & IgM, HBsABS, HBsAg)"
    },
    {"test_name": "HEPATITIS B VIRUS GENOTYPING"},
    {"test_name": "HEPATITIS B VIRUS PRECORE MUTATION"},
    {"test_name": "HEPATITIS C ANTIBODIES"},
    {"test_name": "HEPATITIS C VIRUS GENOTYPING"},
    {"test_name": "HEPATITIS C VIRUS RNA PCR, QUALITATIVE"},
    {"test_name": "HEPATITIS C VIRUS RNA QUANTITATIVE"},
    {"test_name": "HEPATITIS C VIRUS RNA, QUANTITATIVE"},
    {"test_name": "HEPATITIS DELTA VIRUS IgG ANTIBODIES"},
    {"test_name": "HEPATITIS E VIRUS IgG ANTIBODIES"},
    {"test_name": "HEPATITIS E VIRUS IgM ANTIBODIES"},
    {
      "test_name":
      "HEPATITIS PANEL- ACUTE HEPATITIS VIRUS EVALUATION I (HCV ABS, HEV IgM, HBsAg, HAV IgM, HBcore IgM)"
    },
    {
      "test_name":
      "HEPATITIS PANEL- ACUTE HEPATITIS VIRUS EVALUATION II (HCV ABS, HEV IgM / IgG, HBsAg, HAV IgM, HBeAg, HBeAb)"
    },
    {
      "test_name":
      "HEPATITIS PANEL- ACUTE HEPATITIS VIRUS EVALUATION III (HSV IgM, CMV IgM, EBV (EA) IgG, VZV IgM)"
    },
    {
      "test_name":
      "HEPATITIS PANEL AUTOIMMUNE- AUTOIMMUNE HEPATITIS PANEL-1 (ANA, SMA, AMA, LKM-1)"
    },
    {
      "test_name":
      "HEPATITIS PANEL AUTOIMMUNE- AUTOIMMUNE HEPATITIS PANEL-2 (ANCA , SLA)"
    },
    {
      "test_name":
      "HEPATITIS SCREENING PANEL (CBC,SGPT, SGOT, TOTAL BILIRUBIN,DIRECT BILIRUBIN,INDIRECT BILIRUBIN,HBsAg,HAV IgM,HEP E IGM.)"
    },
    {"test_name": "HER2/neu"},
    {"test_name": "HER-2 / neu ONCOPROTEIN (C-ERB B2)[PHOTO]"},
    {"test_name": "Hereditary Pancreatitis Panel"},
    {"test_name": "HERPES SIMPLEX VIRUS 1&2 IGG, ABS"},
    {"test_name": "HERPES SIMPLEX VIRUS DNA DETECTOR"},
    {"test_name": "HERPES SIMPLEX VIRUS IgG TYPE 1 ANTIBODIES"},
    {"test_name": "HERPES SIMPLEX VIRUS IgG TYPE 2 ANTIBODIES"},
    {"test_name": "HERPES SIMPLEX VIRUS IgM TYPE 1 ANTIBODIES"},
    {"test_name": "HERPES SIMPLEX VIRUS IgM TYPE 2 ANTIBODIES"},
    {"test_name": "HERPES SIMPLEX VIRUS TYPES 1& 2 IgG & IgM ANTIBODIES"},
    {"test_name": "HERPES SIMPLEX VIRUS TYPES 1& 2 IgM ANTIBODIES (COMBINED)"},
    {"test_name": "HETEROPHILE ANTIBODIES (HA) (INFECTIOUS MONONUCLEOSIS)"},
    {"test_name": "HIGH SENSITIVE C-REACTIVE PROTEIN (hsCRP)"},
    {
      "test_name":
      "HIRSUTISM EVALUATION PANEL (DHEA, SERUM Testosterone (Total and Free), LH, FSH, Sex Hormone Binding Globulin, 17 hydroxyprogeSTerone)"
    },
    {
      "test_name":
      "HIRSUTISM SCREENING PANEL (DHEA, Testosterone (Total and Free)"
    },
    {"test_name": "HISTAMINE"},
    {
      "test_name":
      "HISTOPATH + IgG + IgA + IgM + C-3 + C1q + FIBRINOGEN ON TISSUE"
    },
    {
      "test_name":
      "HISTOPATH + IgG + IgA + IgM + C-3 + C1q + FIBRINOGEN ON TISSUE [PHOTO]"
    },
    {
      "test_name":
      "HISTOPATHOLOGY & IHC; COMPLETE DISGNOSIS WITH SPECIAL STAINS & IHC (AS AND WHEN NEEDED)[PHOTO]"
    },
    {"test_name": "HISTOPATHOLOGY REVIEW - CoE Histopathlogy"},
    {
      "test_name":
      "HIV -1 ANTIBODIES(Confirmation) INDICATES- HIV -2 (WESTERN BLOT)"
    },
    {"test_name": "HIV-1 DNA DETECTOR,QUALITATIVE"},
    {"test_name": "HIV-1 GENOTYPIC RESISTANCE"},
    {"test_name": "HIV-1 REAL TIME MONITOR"},
    {"test_name": "HIV-1 VIRAL Load"},
    {"test_name": "HIV-1 VIRAL LOAD BY REAL TIME PCR"},
    {"test_name": "HIV EARLY SCREEN"},
    {"test_name": "HIV MONITOR (Viral Load, CD4 / CD8)"},
    {"test_name": "HIV ROCHE COBAS MONITOR (Viral Load, CD4 / CD8)"},
    {"test_name": "HLA A, B, DR LOCI TYPING PCR"},
    {"test_name": "HLA B27 (FLOWCYTOMETRY)"},
    {"test_name": "HLA B27 (PCR)"},
    {"test_name": "HLA Class I A LOCUS"},
    {"test_name": "HLA Class I B LOCUS"},
    {"test_name": "HLA Class I C LOCUS"},
    {"test_name": "HLA Class II DQ LOCUS"},
    {"test_name": "HLA Class II DR LOCUS"},
    {"test_name": "HLA DQ Typing"},
    {"test_name": "HLA-DR-PERCENT"},
    {"test_name": "HMB-45 (MELANOMA MARKER) [PHOTO]"},
    {"test_name": "HOLO TC; ACTIVE VITAMIN B12 (HOLOTRANSCOBALMIN)"},
    {"test_name": "HOMA"},
    {"test_name": "HOMOCYSTEINE"},
    {
      "test_name":
      "HOMOCYSTEINE REFLEX VIT B12 AND FOLIC ACID (If Homocysteine value is high perform VIT B12 AND FOLIC ACD)"
    },
    {"test_name": "HOMOCYSTEINE, URINE"},
    {"test_name": "HOMOGENTISIC ACID, URINE"},
    {
      "test_name":
      "HP & BREAST PANEL PROGNOSIS (LARGE SPECIMEN {ONE BIG/ TWO SMALL}, DNA PLOIDY, FC, BLOCK {DNA AND CELL CYCLE}, ESTROGEN RECEPTOR, PROGESTERONE RECEPTOR, Her-2/neu IHC) [PHOTO]"
    },
    {"test_name": "HP REVIEW WITH CMV STUDY BY DR.ANJALI AM"},
    {"test_name": "HPV DNA DETECTOR"},
    {"test_name": "HPV DNA Detector & PAP Smear"},
    {"test_name": "HPV TYPING BY SEQUENCING"},
    {"test_name": "H.PYLORI ANTIGEN DETECTION"},
    {"test_name": "hSCRP (HIGH SENSITIVE C-REACTIVE PROTEIN"},
    {"test_name": "HSV DNA DETECTOR"},
    {"test_name": "HTLV I & II ANTIBODIES"},
    {"test_name": "h-tTG/DGP"},
    {"test_name": "HUMAN CHORIONIC GONADOTROPIN"},
    {"test_name": "Human Epididymis Protein-4 (HE4)"},
    {"test_name": "HUNTINGTON DISEASE MOLECULAR ANALYSIS"},
    {"test_name": "HYBRID CAPTURE 2 HIGH RISK HPV DNA TEST"},
    {"test_name": "IBD SCREENING PANEL (ASCA IgA, ASCA IgG, ANCA)"},
    {"test_name": "IDH1 AND IDH2 GENE MUTATIONS"},
    {"test_name": "IgA"},
    {"test_name": "IgA, IFA"},
    {"test_name": "IgA, IgM & IgG IMMUNOGLOBULIN, QUANTITATIVE"},
    {"test_name": "IgA ON TISSUE [PHOTO]"},
    {"test_name": "IgD HEAVY CHAIN (SURFACE)"},
    {"test_name": "IgE, TOTAL"},
    {"test_name": "IGF BINDING PROTEIN-3"},
    {"test_name": "IgG"},
    {"test_name": "IGG1"},
    {"test_name": "IGG2"},
    {"test_name": "IGG3"},
    {"test_name": "IGG4"},
    {"test_name": "IgG, CSF"},
    {"test_name": "IgG HEAVY CHAIN (SURFACE)"},
    {"test_name": "IgG, IFA"},
    {"test_name": "IgG + IgA + IgM + C-3 + C1q + FIBRINOGEN ON TISSUE"},
    {"test_name": "IgG + IgA + IgM + C-3 + C1q + FIBRINOGEN ON TISSUE [PHOTO]"},
    {"test_name": "IgG ON TISSUE [PHOTO]"},
    {"test_name": "IgM"},
    {"test_name": "IgM HEAVY CHAIN (SURFACE)"},
    {"test_name": "IgM, IFA"},
    {"test_name": "IgM ON TISSUE [PHOTO]"},
    {"test_name": "IgVH GENE MUTATION"},
    {"test_name": "IHC (PHOTO), TISSUE / PARAFFIN BLOCK"},
    {"test_name": "IL28B Genotyping"},
    {"test_name": "IL-6 (INTERLUEKIN-6)"},
    {"test_name": "IMMUNOFIXATION ELECTROPHORESIS"},
    {"test_name": "IMMUNOFIXATION ELECTROPHORESIS, CSF"},
    {"test_name": "IMMUNOFIXATION ELECTROPHORESIS, URINE"},
    {
      "test_name":
      "IMMUNO FLUORESCENT ASSAY (IgG + IgA + IgM + C-3 + C1q + FIBRINOGEN ON TISSUE)"
    },
    {
      "test_name":
      "IMMUNO FLUORESCENT ASSAY (IgG + IgA + IgM + C-3 + C1q + FIBRINOGEN ON TISSUE [PHOTO])"
    },
    {"test_name": "IMMUNOREACTIVE TRYPSINOGEN (NEONATAL SCREENING)"},
    {
      "test_name":
      "INFECTIOUS MONONUCLEOSIS (EPSTEIN BARR VIRUS ANTIBODIES TETRA PANEL {(EBV (VCA) IgG, EBV(VCA) IgM),EBV(EA) IgG])"
    },
    {
      "test_name":
      "INFECTIOUS MONONUCLEOSIS (EPSTEIN BARR VIRUS EARLY ANTIGEN IgG ANTIBODIES, EBV (EA))"
    },
    {
      "test_name":
      "INFECTIOUS MONONUCLEOSIS (EPSTEIN BARR VIRUS NUCLEAR ANTIGEN IgG ANTIBODIES, EBV (NA))"
    },
    {
      "test_name":
      "INFECTIOUS MONONUCLEOSIS (EPSTEIN BARR VIRUS NUCLEAR ANTIGEN IgM ANTIBODIES, EBV (NA))"
    },
    {
      "test_name":
      "INFECTIOUS MONONUCLEOSIS (EPSTEIN BARR VIRUS VIRAL CAPSID ANTIGEN IgG ANTIBODIES, EBV (VCA))"
    },
    {
      "test_name":
      "INFECTIOUS MONONUCLEOSIS (EPSTEIN BARR VIRUS VIRAL CAPSID ANTIGEN IgM ANTIBODIES, EBV (VCA))"
    },
    {"test_name": "INFECTIOUS MONONUCLEOSIS (HETEROPHILE ANTIBODIES (HA))"},
    {"test_name": "INFLUENZA VIRUS A IgG"},
    {"test_name": "INFLUENZA VIRUS A IgM"},
    {"test_name": "INFLUENZA VIRUS B IgG"},
    {"test_name": "INFLUENZA VIRUS B IgM"},
    {"test_name": "INHIBIN A (DIMERIC)"},
    {"test_name": "INHIBIN B"},
    {
      "test_name":
      "INHIBIN B,LH, FSH & Prolactin (Inhibin B, LH, FSH, & Prolactin)"
    },
    {"test_name": "INHIBIN [PHOTO]"},
    {"test_name": "INSULIN LIKE GROWTH FACTOR-1 (IGF-1)"},
    {"test_name": "INSULIN, Serum (Fasting)"},
    {"test_name": "INSULIN, Serum (POST-PRANDIAL)"},
    {"test_name": "INTESTINAL PERMEABILITY"},
    {"test_name": "INTRINSIC FACTOR IgG"},
    {"test_name": "Inv(16)"},
    {"test_name": "JAK2 EXON 12 MUTATION"},
    {"test_name": "JAK2 V617F MUTATION DETECTION"},
    {"test_name": "JAPANESE ENCEPHALITIS VIRUS IgM ANTIBODIES"},
    {"test_name": "JC/BK DNA PCR (QUALITATIVE)"},
    {"test_name": "JC VIRUS (QUANTITATIVE)"},
    {"test_name": "JO-1 IgG ANTIBODIES"},
    {"test_name": "KALA-AZAR"},
    {"test_name": "KAPPA FREE LIGHT CHAIN"},
    {"test_name": "KAPPA LIGHT CHAIN [PHOTO]"},
    {"test_name": "KAPPA LIGHT CHAIN QUANTITATIVE, 24 hrs. URINE"},
    {"test_name": "KAPPA LIGHT CHAIN QUANTITATIVE, URINE RANDOM"},
    {"test_name": "KARYOTYPING: BLOOD LYMPHO CULTURE"},
    {
      "test_name": "KARYOTYPING: CHROMOSOME ANALYSIS IN HEMATOLOGICAL DISORDERS"
    },
    {"test_name": "KARYOTYPING: NEONATAL (NEWBORN TO ONE MONTH OLD CHILD)"},
    {"test_name": "KI-67 (Proliferating Cells) [PHOTO]"},
    {
      "test_name":
      "KIDNEY BIOPSY & IMMUNOFLUORESCENT ASSAY; (HISTOPATH + IgG + IgA + IgM + C-3 + C1q + FIBRINOGEN ON TISSUE)"
    },
    {
      "test_name":
      "KIDNEY BIOPSY & IMMUNOFLUORESCENT ASSAY; (HISTOPATH + IgG + IgA + IgM + C-3 + C1q + FIBRINOGEN ON TISSUE [PHOTO])"
    },
    {
      "test_name":
      "KIDNEY BIOPSY REFLEX TO IFA + IgG / IgA / IgM / C3/C1Q/FIBRINOGEN"
    },
    {"test_name": "KIDNEY STONE ANALYSIS"},
    {"test_name": "Kidney stone analysis by FTIR"},
    {"test_name": "KRAS codon 61 Mutation Detection"},
    {"test_name": "KRAS MUTATION DETECTION"},
    {"test_name": "LAMBDA FREE LIGHT CHAIN"},
    {"test_name": "LAMBDA LIGHT CHAIN [PHOTO]"},
    {"test_name": "LAMBDA LIGHT CHAIN QUANTITATIVE, 24 hrs. URINE"},
    {"test_name": "LAMBDA LIGHT CHAIN QUANTITATIVE, URINE RANDOM"},
    {"test_name": "LAMOTRIGINE"},
    {
      "test_name":
      "LAP (LEUCOCYTE ALKALINE PHOSPHATASE / NEUTROPHIL ALKALINE PHOSPHATASE (NAP)SCORE)"
    },
    {"test_name": "LARGE TISSUE / SPECIMEN BIOPSY"},
    {"test_name": "LBC- THINPREP CYTOLOGY [FULLY AUTOMATED]"},
    {"test_name": "LBC- THINPREP CYTOLOGY [FULLY AUTOMATED], PHOTO"},
    {"test_name": "LDH ISOENZYMES"},
    {"test_name": "LEAD, 24 HRS URINE"},
    {"test_name": "LEAD, BLOOD"},
    {"test_name": "LEAD, URINE SPOT"},
    {"test_name": "L E CELL"},
    {"test_name": "LEGIONELLA PNEUMOPHILA ANTIGEN DETECTION, URINE"},
    {"test_name": "LEGIONELLA PNEUMOPHILA IGM (SERUM,EIA)"},
    {"test_name": "LEISHMANIA DONOVANI (LD) BODIES DETECTION"},
    {"test_name": "LEPTIN"},
    {"test_name": "LEPTOSPIRA IgG ANTIBODIES"},
    {"test_name": "LEPTOSPIRA IgM ANTIBODIES"},
    {"test_name": "LEUKEMIA / LYMPHOMA EVALUATION WITH HISTOPATHOLOGY"},
    {
      "test_name":
      "LEUKEMIA TRANSLOCATION PANEL 1 (t(1;19) (q23;p13), Inv(16)(p13;q22), t(9;22) (q34;q11), t(4;11) (q21;q23), t(12;21) (p13;q22), t(15;17)(q22;q22), t(8;21)(q22;q22))"
    },
    {
      "test_name":
      "LEUKEMIA TRANSLOCATION PANEL 2 (Inv(16)(p13;q22), t(15;17)(q22;q22), t(8;21)(q22;q22))"
    },
    {
      "test_name":
      "LEUKEMIA TRANSLOCATION PANEL 3 (t(1;11) (p32;q23), t(1;11) (p21;q23), t(4;11) (q21;q23), t(6;11) (q27;q23), t(9;11) (p22;q23), t(10;11) (p12;q23), t(11;17) (q23;q21), t(11;19) (q23;p13.1), t(11;19) (q23;p13.3), Dup MLL (11q23), t(X;11) (q13;q23))"
    },
    {
      "test_name":
      "LEUKEMIA TRANSLOCATION PANEL 4 t(1; 19) (q23; p13), t(9; 22) (q34; q11), t(4;11) (q21; q23), t(1;11) (p32; q23), t(11; 19) (q23; p13.3), t(X;11) (q13; q23)"
    },
    {
      "test_name":
      "LEUKEMIA TRANSLOCATION PANEL 5 t(9; 22) (q34; q11), Dup MLL (11q23), t(11; 17) (q23; q21),"
    },
    {
      "test_name":
      "LEUKEMIA TRANSLOCATION PANEL 6 t(1; 19) (q23; p13), t(9; 22) (q34; q11), t(4;11) (q21; q23) and t(12; 21) (p13; q22),"
    },
    {"test_name": "LGL PANEL"},
    {
      "test_name":
      "LH & FSH (FOLLICLE STIMULATING HORMONE & LUTEINIZING HORMONE EVALUATION)"
    },
    {
      "test_name":
      "LH, FSH & PROLACTIN (LUTEINIZING HORMONE, FOLLICLE STIMULATING HORMONE EVALUATION & PROLACTIN)"
    },
    {"test_name": "LH (LUTEINIZING HORMONE)"},
    {"test_name": "LIPASE"},
    {"test_name": "LIPOPROTEIN (a)"},
    {"test_name": "LIPOPROTEIN-ASSOCIATED PHOSPHOLIPASE A2 ACTIVITY (PLAC)"},
    {"test_name": "LIPOPROTEIN ELECTROPHORESIS"},
    {"test_name": "LITHIUM"},
    {"test_name": "LIVER KIDNEY MICROSOME 1 (LKM1) AUTOANTIBODIES"},
    {
      "test_name":
      "LIVER PROFILE #2 (Bilirubin Total, Protein Total, Albumin, Globulin, Aspartate Aminotransferase, Alanine Aminotransferase, Bilirubin Direct, Hepatitis B Surface Antigen, Prothrombin Time, Alkaline Phosphatase)"
    },
    {"test_name": "LIVORHYTHM - 2"},
    {
      "test_name":
      "LIVORHYTHM - 4 (HCV RNA {NESTED REVERSE TRANSCRIPTASE PCR}, HCV ABS, HBVDNA PCR, Small tissue biopsy, Special STains, AFB Culture, MYCO3PLEX DNA PCR)"
    },
    {"test_name": "Lung Cancer Panel (EGFR Mutation+EML4 ALK by FISH)"},
    {"test_name": "LUPUS ANTICOAGULANT SCREENING PROFILE"},
    {"test_name": "LUTEINIZING HORMONE (LH)"},
    {"test_name": "LUTEINIZING HORMONE (LH)[PHOTO]"},
    {"test_name": "LYME DISEASE (BORRELIA BURGDORFERI IgG)"},
    {"test_name": "LYME DISEASE (BORRELIA BURGDORFERI IgM)"},
    {
      "test_name":
      "LYMPH0CYTE ENUMERATION, BASIC & NK CELLS (%CD3,%CD4,%CD8,%CD19,%CD16+56,ABS CD3,ABS CD4,ABS CD8,ABSCD19,ABSCD16+56)"
    },
    {
      "test_name":
      "LYMPH NODE BIOPSY: DIFFERENTIAL DIAGNOSIS (CD3,CD20,Bc12)[PHOTO]"
    },
    {
      "test_name":
      "LYMPHOCYTE ENUMERATION, BASIC (%CD3,%CD4,%CD8,%CD19,,ABS CD3,ABS CD4,ABS CD8,ABS CD19)"
    },
    {
      "test_name":
      "LYMPHOCYTE ENUMERATION, BASIC & HIV -1 ANTIBODIES,HIV ABS, WESTERN BLOT"
    },
    {
      "test_name":
      "LYMPHOCYTE ENUMERATION STUDY -T CELLS (%CD3,%CD4,%CD8,ABS CD3,ABS CD4,ABS CD8)"
    },
    {
      "test_name":
      "LYMPHOCYTE ENUMERATION, T & B CELLS (%CD3,%CD19,ABS CD3,ABS CD19)"
    },
    {
      "test_name":
      "LYMPHOCYTE ENUMERATION, T- HELPER CELLS (%CD3,%CD4,ABS CD3,ABS CD4)"
    },
    {"test_name": "LYMPHOCYTE SUBSET (CD4 PERCENTAGE AND ABSOLUTE COUNT )"},
    {
      "test_name":
      "LYMPHOMA: DIFFERENTIAL DIAGNOSIS (CD30, CD15, CD20, CD3, CD45)[PHOTO]"
    },
    {"test_name": "MALARIA ANTIBODY"},
    {"test_name": "MALARIA ANTIGEN (P. FALCIPARUM) DETECTION"},
    {"test_name": "MALIGNANT TUMORS: LYMPHOMA v/s CARCINOMA (CD45,CK)[PHOTO]"},
    {"test_name": "MANGANESE 24 HRS URINE"},
    {"test_name": "MANGANESE BLOOD"},
    {"test_name": "MANGANESE SERUM ICPMS"},
    {"test_name": "MANGANESE SPOT URINE"},
    {"test_name": "MAPLE SYRUP URINE DISORDERS (NEONATAL SCREENING)"},
    {
      "test_name":
      "MATERNAL SCREEN; DOUBLE MARKER TEST (First trimester risk assessment 8-13.6 weeks)- PAPA-P & FREE B-HCG)"
    },
    {
      "test_name":
      "MATERNAL SCREEN (QUADRUPLE MARKER TEST / 2nd Trimester Risk assessment, 14-22 Weeks. ( AFP, HCG,E3UN & DIA)"
    },
    {
      "test_name":
      "MATERNAL SCREEN; STANDARD INTEGRATED TEST, Phase I (1st Trimester) : 10 – 13.6 Weeks. (PAPA-P & FREE B-HCG). Phase II (2nd Trimester): 15-22 Weeks. (AFP, HCG, E3UN & DIA). Final risk assessment incorporates first and second trimester results."
    },
    {
      "test_name":
      "MATERNAL SCREEN (TRIPLE MARKER TEST / 2nd Trimester Risk assessment, 14-22 Weeks. (AFP, HCG & E3UN)"
    },
    {
      "test_name":
      "MDR-TB RAPID GENOTYPIC TEST (Note: This test is not applicable for MOTT)"
    },
    {"test_name": "MDS PANEL"},
    {"test_name": "MEASLES IgG ANTIBODIES"},
    {"test_name": "MEASLES IgG & IgM ANTIBODIES"},
    {"test_name": "MEASLES IgM ANTIBODIES"},
    {"test_name": "MEDIUM TISSUE / SPECIMEN BIOPSY"},
    {"test_name": "MELAN-A [PHOTO]"},
    {"test_name": "MELANOMA (S- 100/HMB-45/Melan-A) [PHOTO]"},
    {"test_name": "MENOPAUSAL DIAGNOSTIC PANEL (FSH, TSH, FT4, ESTRADIOL)"},
    {"test_name": "MENOPAUSE PLUS PROFILE"},
    {
      "test_name":
      "MENUPOSAL MONITORING PANEL (Estradiol, FSH, Lipid Profile, Calcium, Phosphorus)"
    },
    {"test_name": "MERCURY, 24 HRS URINE"},
    {"test_name": "MERCURY,SERUM ICPMS"},
    {"test_name": "MERCURY, URINE SPOT"},
    {"test_name": "METANEPHRINES"},
    {"test_name": "METASTASIS OF UNKNOWN ORIGIN [PHOTO]"},
    {
      "test_name":
      "METATASTIC TUMOUR BREAST (ER, PgR, Her-2/neu, GCDFP-15)[PHOTO]"
    },
    {"test_name": "METHAEMOGLOBIN ESTIMATION"},
    {"test_name": "METHYLMALONIC ACID, URINE"},
    {"test_name": "MIB-1 [PHOTO]"},
    {
      "test_name":
      "MIC2 GENE PRODUCTS, EWING SARCOMA MARKER[PHOTO]/Also known as CD99"
    },
    {"test_name": "MICROFILARIA DETECTION"},
    {"test_name": "MIC TESTING FOR RAPIDLY GROWING MYCOBACTERIA"},
    {"test_name": "MLH1"},
    {"test_name": "MLH1 Hypermethylation"},
    {"test_name": "MLL 11q rearrangement"},
    {"test_name": "MPL Mutation Detection"},
    {"test_name": "MSH2"},
    {"test_name": "MSH6"},
    {"test_name": "MTHFR MUTATION DETECTION"},
    {"test_name": "Multiple Myeloma panel"},
    {"test_name": "MUMPS IgG ANTIBODIES"},
    {"test_name": "MUMPS IgG & IgM ANTIBODIES"},
    {"test_name": "MUMPS IgM ANTIBODIES"},
    {"test_name": "MUSK ANTIBODY (SERUM,RIA)"},
    {"test_name": "MYC gene"},
    {"test_name": "MYCO3PLEX"},
    {"test_name": "MYCO3PLEX AD WITH FREE ADA"},
    {"test_name": "MYCO3PLEX AD WITH FREE HISTOPATH"},
    {"test_name": "MYCOBACTERIA DETECTION"},
    {"test_name": "MYCOBACTERIA DETECTION"},
    {"test_name": "MYCOBACTERIUM LEPRAE"},
    {"test_name": "MYCOBACTERIUM SPECIATION"},
    {"test_name": "MYCOBACTERIUM SPECIATION – COMMON"},
    {"test_name": "MYCOBACTERIUM SPECIATION – EXTENDED"},
    {"test_name": "MYCOPLASMA PNEUMONIAE IgG ANTIBODIES"},
    {"test_name": "MYCOPLASMA PNEUMONIAE IgM ANTIBODIES"},
    {"test_name": "MycoReal"},
    {"test_name": "MYCOtect"},
    {"test_name": "Myelin basic protein"},
    {"test_name": "MYELOMA PANEL (CD38,CD56,CD19.KAPPA,LAMBDA,CD45)"},
    {"test_name": "MYELOPEROXIDASE (MPO)[PHOTO]"},
    {"test_name": "MYELOPEROXIDASE (MPO) STAIN"},
    {"test_name": "MYO-D1 [PHOTO]"},
    {"test_name": "MYOGLOBIN"},
    {"test_name": "MYOGLOBIN, URINE (URINE SPOT, ECLIA)"},
    {"test_name": "NATURAL KILLER CELL EVALUATION (%CD16+56,ABS CD16+CD56)"},
    {"test_name": "NATURAL KILLER PANEL (CD3,CD16,CD56,CD45)"},
    {"test_name": "NEISSERIA GONORRHOEAE DNA PCR"},
    {"test_name": "NEISSERIA MENINGITIDIS A, B, C, Y, W135 ANTIGEN DETECTION"},
    {
      "test_name":
      "NEISSERIA MENINGITIDIS A, B, C, Y, W135 ANTIGEN DETECTION, CSF"
    },
    {"test_name": "NEONATAL KARYOTYPING (NEWBORN TO ONE MONTH OLD CHILD)"},
    {"test_name": "NEONATAL SCREENING (17-ALPHA HYDROXYPROGESTERONE)"},
    {"test_name": "NEONATAL SCREENING (Biotinidase)"},
    {"test_name": "NEONATAL SCREENING; COMPREHENSIVE NEONATAL SCREENING PANEL"},
    {"test_name": "NEONATAL SCREENING (GLUCOSE-6-PHOSPHATE DEHYDROGENASE)"},
    {"test_name": "NEONATAL SCREENING (IMMUNOREACTIVE TRYPSINOGEN)"},
    {"test_name": "NEONATAL SCREENING (MAPLE SYRUP URINE DISORDERS)"},
    {
      "test_name":
      "NEONATAL SCREENING PANEL-1 (Immunoreactive Trypsinogen, TSH, Total Galactose, 17-Alpha-Hydroxyprogesterone, Phenylalanine, Biotinidase, Glucose-6-Phosphate Dehydrogenase, Maple Syrup Urine Disease"
    },
    {
      "test_name":
      "NEONATAL SCREENING PANEL-2 (Immunoreactive Trypsinogen, TSH, 17-Alpha-HydroxyprogeSTerone, Phenylalanine, Glucose-6-Phosphate Dehydrogenase"
    },
    {"test_name": "NEONATAL SCREENING PANEL-3 (TSH, Phenylalanine)"},
    {"test_name": "NEONATAL SCREENING PANEL-4 (G6PD, TSH, Phenylalanine)"},
    {
      "test_name":
      "NEONATAL SCREENING PANEL (All 42 Parameters) FOR MORE THAN 1MONTH OLD UPTO 14 YEARS"
    },
    {"test_name": "NEONATAL SCREENING (PHENYLALANINE)"},
    {"test_name": "NEONATAL SCREENING (TOTAL GALACTOSE)"},
    {"test_name": "NEONATAL SCREENING (TSH)"},
    {
      "test_name":
      "NEUROENDOCRINE (NSE, Chromogranin-A, Synaptophysin, CD56, Pancytokeratin, Ki-67, S-100p)[PHOTO]"
    },
    {"test_name": "Neuromuscular Disorders mtDNA mutation Panel"},
    {"test_name": "NEURON SPECIFIC ENOLASE[PHOTO]"},
    {
      "test_name":
      "NEWBORN SCREENING FOR ACYLCARNITINE & AMINO ACIDS, Dried Blood spot"
    },
    {"test_name": "NEW NEONATAL SCREENING PANEL"},
    {"test_name": "NICKEL, 24 HRS URINE"},
    {"test_name": "NICKEL, SERUM BY ICPMS (SERUM)"},
    {"test_name": "NICKEL URINE SPOT"},
    {"test_name": "NICOTINE METABOLITE"},
    {"test_name": "NICOTINE METABOLITE, SERUM"},
    {
      "test_name":
      "NMO ANTIBODIES/ANTI-AQUAPORIN-4 (ANTI NEUROMYELITIS OPTICA),"
    },
    {"test_name": "NOCARDIA SPECIATION"},
    {
      "test_name":
      "NON-GYNAEC CYTOLOGY & FINE NEEDLE ASPIRATION CYTOLOGY (FNAC)"
    },
    {
      "test_name":
      "NON-GYNAEC CYTOLOGY & FINE NEEDLE ASPIRATION CYTOLOGY (FNAC), PHOTO"
    },
    {
      "test_name":
      "NON HODGKIN LYMPHOMA IMMUNOPHENOTYPING (CD20, CD3, CD43)[PHOTO]"
    },
    {"test_name": "NORADRENALIN, PLASMA"},
    {"test_name": "NORADRENALIN, URINE"},
    {"test_name": "NPM1 MUTATION DETECTION"},
    {"test_name": "NRAS exon 1 and 2 Mutation"},
    {"test_name": "NSE (NEURON SPECIFIC ENOLASE)"},
    {"test_name": "NT-PRO BNP (N-TERMINAL PRO B TYPE NATRIURETIC PEPTIDE)"},
    {"test_name": "NutriEVAL (KIT BASED TEST ONLY)"},
    {"test_name": "OLIGOCLONAL BANDS, CSF"},
    {"test_name": "ORGANIC ACID SCREEN,URINE"},
    {"test_name": "OSMOLALITY, 24 hrs URINE"},
    {"test_name": "OSMOLALITY, SERUM"},
    {"test_name": "OSMOLALITY,URINE"},
    {"test_name": "OSTEOCALCIN (N MID)"},
    {"test_name": "OSTEOMON (BETA CROSSLAPS & TOTAL P1NP)"},
    {"test_name": "OSTEONECTIN [PHOTO]"},
    {"test_name": "OSTEOPORESIS MONITORING (BETA CROSSLAPS & TOTAL P1NP)"},
    {"test_name": "OSTEOPOROSIS MONITORING (TOTAL P1NP)"},
    {
      "test_name":
      "OSTEOSCREEN PANEL - I (Calcium, Phosphorous, Vitamin D (25 Hydroxy), PTH Intact)"
    },
    {
      "test_name":
      "OSTEOSCREEN PANEL - II (Calcium, Phosphorous, Vitamin D (25 Hydroxy), PTH Intact, Osteocalcin, Alkaline Phosphatase)"
    },
    {"test_name": "OVARIAN MALIGNANCY RISK ALGORITHM (ROMA)"},
    {"test_name": "p53 (MUTANT WILD TYPE) [PHOTO]"},
    {"test_name": "p63 [PHOTO]"},
    {
      "test_name":
      "PADIATRIC ALLERGIC PANEL (EGG WHITE, MILK, SOYABEAN, WHEAT, HOUSE DUST)"
    },
    {"test_name": "PANCREATIC CANCER MONITOR (CA 19-9, CEA)"},
    {"test_name": "Pancreatic Elastase Test"},
    {"test_name": "PAN-CYTOKERATIN [PHOTO]"},
    {"test_name": "PANFUNGAL DETECTION & IDENTIFICATION PANEL"},
    {"test_name": "PANFUNGAL DNA DETECTOR"},
    {
      "test_name":
      "PAN NEUROTROPIC VIRUS PANEL ( GOLD STANDARD IN DIAGNOSING ASEPTIC MENINGITIS & ENCEPHALITIS"
    },
    {"test_name": "PAP DUO + HYBRID"},
    {"test_name": "PAP DUO-THINPREP CYTOLOGY+ HPV-PCR"},
    {"test_name": "PAP SMEAR REFLEX TO HPV DETECTION(DNA DETECTOR)"},
    {"test_name": "PAP STAIN"},
    {"test_name": "PAP STAIN [PHOTO]"},
    {"test_name": "PARACETAMOL"},
    {
      "test_name":
      "PARANEOPLASTIC DISORDER PROFILE ( HUABS, YOABS, RI ABS, PNMA2 ABS, AMPHIPHYSIN ABS)"
    },
    {"test_name": "PARVOVIRUS B19 DNA PCR"},
    {"test_name": "PARVOVIRUS B19 IgG"},
    {"test_name": "PARVOVIRUS B19 IgM"},
    {"test_name": "PAX-5{PHOTO}"},
    {
      "test_name":
      "PCOD Panel (LH, FSH, Prolactin, Testosterone (Total & Free), Insulin (Fasting & PP) Fasting & PP Sugar)"
    },
    {"test_name": "Pepsinogen I & II"},
    {"test_name": "PERIODIC ACID SCHIFF (PAS) STAIN"},
    {"test_name": "PHADIATOP - ALLERGEN ADULT (INDIVIDUALS ABOVE 5 YEARS)"},
    {"test_name": "PHADIATOP- ALLERGEN INFANT (INDIVIDUALS BELOW 5 YEARS)"},
    {"test_name": "PHENOBARBITAL"},
    {"test_name": "PHENYLALANINE (NEONATAL SCREENING)"},
    {"test_name": "PHENYTOIN (Eptoin,Dilantin)"},
    {"test_name": "PHILADELPHIA CHROMOSOME (BCR/ABL BREAKPOINT ANALYSIS)"},
    {"test_name": "PHILADELPHIA CHROMOSOME (BCR/ABL IS- INTERNATIONAL SCALE)"},
    {"test_name": "PHILADELPHIA CHROMOSOME (BCR / abl qualitative)"},
    {"test_name": "PHILADELPHIA CHROMOSOME (BCR/abl - quantitative)"},
    {
      "test_name": "PHILADELPHIA CHROMOSOME (BCR-abl transcript quantification)"
    },
    {
      "test_name":
      "PHOSPHOLIPID SYNDROME PANEL (Lupus Anticoagulant Screen, Cardiolipin IgG & IgM ABS, Anti-phospholipid IgG & IgM Abs)"
    },
    {"test_name": "PHOTO, IHC, TISSUE / PARAFFIN BLOCK"},
    {"test_name": "PIK3CA Gene Mutation"},
    {"test_name": "PIN 4 [PHOTO]"},
    {
      "test_name":
      "PITITUARY LESION HORMONES (Prolactin, Growth hormone, LH, FSH, ACTH,TSH)[PHOTO]"
    },
    {"test_name": "PIVKA-II (Decarboxy Prothrombine)"},
    {"test_name": "PLACENTAL ALKALINE PHOSPHATASE[PHOTO]"},
    {"test_name": "PLAC (LIPOPROTEIN-ASSOCIATED PHOSPHOLIPASE A2 ACTIVITY)"},
    {"test_name": "PLASMA OXALATE"},
    {"test_name": "Plasma RENIN"},
    {"test_name": "PLASMA VERY LONG CHAIN FATTY ACIDS"},
    {
      "test_name":
      "Plasminogen Activator Inhibitor-1 (PAI-1) / SERPINE-1, 4G/5G Genotyping"
    },
    {"test_name": "PLATELET ANTIBODIES (SERUM,IMMUNOFLUORESCENCE)"},
    {"test_name": "PML Ra Ra t(15:17)"},
    {"test_name": "PML Ra Ra t(15:17), QUALITATIVE"},
    {"test_name": "PML Ra Ra t(15:17), QUANTITATIVE"},
    {"test_name": "PMS2"},
    {"test_name": "PNEUMOCYSTIS CARINII DETECTION"},
    {"test_name": "PNH (CD55 and CD59)"},
    {"test_name": "POC FISH REFLEX TO POC KARYOTYPING"},
    {"test_name": "PORPHOBILINOGEN QUANTITATIVE URINE, 24 HRS"},
    {"test_name": "PORPHOBILINOGEN QUANTITATIVE URINE, Random"},
    {"test_name": "PORPHOBILINOGEN URINE"},
    {"test_name": "PORPHYRINS, 24HRS URINE"},
    {"test_name": "PORPHYRINS SPECIATION, 24HRS URINE"},
    {"test_name": "PRADER- WILLI SYNDROME MS PCR"},
    {"test_name": "PREALBUMIN"},
    {"test_name": "PREGNANCY ASSOCIATED Plasma PROTEIN-A (PAPP-A)"},
    {
      "test_name":
      "PRE-OP ROUTINE COAGULATION PROFILE (PT, APTT, Platelet Count, Factor XIII Activity)"
    },
    {"test_name": "PROCALCITONIN"},
    {"test_name": "PROGESTERONE"},
    {"test_name": "PROGESTERONE RECEPTOR (PgR) [PHOTO]"},
    {"test_name": "PROLACTIN"},
    {"test_name": "PROLACTIN [PHOTO]"},
    {"test_name": "PROLIFERATING CELL NUCLEAR ANTIGEN (PCNA), IHC[PHOTO]"},
    {"test_name": "PROSTATE SPECIFIC ANTIGEN, FREE"},
    {"test_name": "PROSTATE SPECIFIC ANTIGEN (PSA) FREE & TOTAL"},
    {"test_name": "PROSTATE SPECIFIC ANTIGEN (PSA) [PHOTO]"},
    {"test_name": "PROSTATE SPECIFIC ANTIGEN (PSA) TOTAL"},
    {"test_name": "PROTEIN C ACTIVITY"},
    {"test_name": "PROTEIN C ANTIGEN, PLASMA BY RID METHOD"},
    {"test_name": "PROTEIN ELECTROPHORESIS"},
    {"test_name": "PROTEIN ELECTROPHORESIS, CSF"},
    {"test_name": "PROTEIN ELECTROPHORESIS REFLEX TO IMMUNOFIXATION"},
    {"test_name": "PROTEIN ELECTROPHORESIS, URINE"},
    {
      "test_name":
      "PROTEIN ELECTROPHORESIS, URINE REFLEX TO IMMUNOFIXATION ELECTROPHORESIS, URINE"
    },
    {"test_name": "PROTEIN S ACTIVITY"},
    {"test_name": "PROTEIN S, FREE"},
    {"test_name": "ps2 (ESTROGEN REGULATED PROTEIN)[PHOTO]"},
    {"test_name": "PSA, FREE (PROSTATE SPECIFIC ANTIGEN), FREE"},
    {"test_name": "PSA FREE & TOTAL (PROSTATE SPECIFIC ANTIGEN) FREE & TOTAL"},
    {"test_name": "PSA (PROSTATE SPECIFIC ANTIGEN) TOTAL"},
    {"test_name": "PSA REFLEX TO FREE PSA (If PSA is > 4.0 perform Free PSA)"},
    {"test_name": "PSEUDOCHOLINESTERASE"},
    {"test_name": "PTH, INTACT INCLUDING TOTAL CALCIUM"},
    {
      "test_name":
      "QUADRUPLE MARKER TEST / 2nd Trimester Risk assessment, 14-22 Weeks. ( AFP, HCG,E3UN & DIA)"
    },
    {"test_name": "RAAS SCREENING PANEL (Plasma Renin, Aldosterone)"},
    {"test_name": "RABIES ANTIBODIES (TOTAL) (SERUM,EIA)"},
    {"test_name": "RAPID FILARIA ANTIGEN DETECTION"},
    {"test_name": "RAPID TYPHI IgM (TYPHI CHECK)"},
    {
      "test_name":
      "RATIONAL THYROID PANEL (TSH3G - UL If abnormal then FT3 & FT4)"
    },
    {"test_name": "RBC FOLATE"},
    {
      "test_name":
      "RECURRENT MISCARRIAGE PANEL (Protein C, Protein S, Lupus Antigoagulent, Antiphospholipid Antibody, Serum Homocystein, Anti Thrombin III Activity) [To be ordered with Factor V leiden (# 9894)] which will be charged separately"
    },
    {"test_name": "REDUCING SUBSTANCES IN PAEDIATRIC URINE SPECIMENS"},
    {"test_name": "RETINOL BINDING PROTEIN (RBP)"},
    {"test_name": "RETT SYNDROME DNA SEQUENCING ( MECP2 MUTATION)"},
    {"test_name": "RETURN OF PARAFFIN BLOCK / SLIDE"},
    {
      "test_name":
      "RHEUMATIC FEVER PANEL (ASO,CRP,ESR,THROAT SWAB CULTURE/SENSITIVITY)"
    },
    {
      "test_name":
      "RHEUMATOID ARTHARITIS PANEL (ANA, RHEUMATOID FACTOR, ANTI CCP)"
    },
    {"test_name": "RHEUMATOID FACTOR ANTIBODIES"},
    {
      "test_name":
      "RHEUMATOLOGY PROFILE - 1 (Rheumatology Profile - 2, DSDNA TITRE)"
    },
    {
      "test_name":
      "RHEUMATOLOGY PROFILE - 2 (SM ABS, U1SNRNP ABS, SS-A ABS, SS-B ABS)"
    },
    {"test_name": "ROMA (OVARIAN MALIGNANCY RISK ALGORITHM)"},
    {"test_name": "ROTA VIRUS ANTIGEN DETECTION FROM STOOL; RAPID CARD TEST"},
    {"test_name": "ROUND CELL TUMOURS"},
    {"test_name": "ROUND CELL TUMOURS (ADULTS) - 1 (NSE, CK, CD45)[PHOTO]"},
    {
      "test_name": "ROUND CELL TUMOURS (ADULTS) - 2 (HMB45, MPO, S-100P)[PHOTO]"
    },
    {
      "test_name":
      "ROUND CELL TUMOURS - BONE (NSE, S-100P, CK, DESMIN, CD45, SYNAP/CHROMAA, MIC-2)[PHOTO]"
    },
    {"test_name": "RPL (RECURRENT PREGNENCY LOSS PANEL) PANEL"},
    {"test_name": "RSV- RESPIRATORY SYNCYTIAL VIRUS-IGG"},
    {"test_name": "RSV- RESPIRATORY SYNCYTIAL VIRUS-IGM"},
    {"test_name": "RUBELLA IgG ANTIBODIES"},
    {"test_name": "RUBELLA IGG AVIDITY"},
    {"test_name": "RUBELLA IgG & IgM ANTIBODIES"},
    {"test_name": "RUBELLA IgM ANTIBODIES"},
    {"test_name": "S-100 [PHOTO]"},
    {"test_name": "S-100 PROTEIN[PHOTO]"},
    {"test_name": "SALICYLATE"},
    {"test_name": "SCA10 (SPINAL CEREBRAL ATAXIA TYPE-10)"},
    {"test_name": "SCA 12 (SPINAL CEREBRAL ATAXIA TYPE-12)"},
    {"test_name": "SCA17 (SPINAL CEREBRAL ATAXIA TYPE-17)"},
    {"test_name": "SCA 1 (SPINAL CEREBRAL ATAXIA TYPE-1)"},
    {"test_name": "SCA 2 (SPINAL CEREBRAL ATAXIA TYPE-2)"},
    {"test_name": "SCA 3 (SPINAL CEREBRAL ATAXIA TYPE-3)"},
    {"test_name": "SCA 6 (SPINAL CEREBRAL ATAXIA TYPE-6)"},
    {"test_name": "SCA 7 (SPINAL CEREBRAL ATAXIA TYPE-7)"},
    {"test_name": "SCA PANEL (SCA TYPE -1,12,2,3,6)"},
    {"test_name": "Scl-70 IgG ANTIBODIES"},
    {
      "test_name":
      "SCLERODERMA DIAGNOSTIC PANEL (ANA,U1 Sm RNP,CENTROMERE ABS,SCLERODERMA -70 IgG"
    },
    {"test_name": "Scrub Typhus Antibody"},
    {"test_name": "Scrub Typhus IgM Antibody"},
    {"test_name": "SdLDL; SMALL DENSE LDL"},
    {"test_name": "SELENIUM, 24 HRS URINE"},
    {"test_name": "SELENIUM, BLOOD"},
    {"test_name": "Selenium, Serum by ICPMS"},
    {"test_name": "SELENIUM URINE SPOT"},
    {"test_name": "SEMEN FRUCTOSE"},
    {"test_name": "SEROTONIN, SERUM"},
    {"test_name": "SEROTONIN, URINE"},
    {
      "test_name":
      "SERUM FREE LIGHT CHAIN (Free Light Chain Kappa, Free Light Chain Lambda, Kappa/Lambda Ratio)"
    },
    {"test_name": "SEX HORMONE BINDING GLOBULIN (SHBG)"},
    {"test_name": "SICKLE CELL DNA PCR"},
    {
      "test_name":
      "SICKLE SHORT PROGRAM SICKLE CELL VARIANT ANALYSIS, BLOOD SPOT"
    },
    {"test_name": "SICKLING TEST"},
    {"test_name": "SINGLE IHC MARKER - CoE Histopathlogy"},
    {"test_name": "SIROLIMUS"},
    {"test_name": "SLE DIAGNOSTIC PANEL (ANA & DsDNA WITH TITRE)"},
    {"test_name": "SMA CARRIER DETECTION"},
    {"test_name": "SMALL DENSE LDL COMBO"},
    {"test_name": "SMITH (Sm) IgG ANTIBODIES"},
    {"test_name": "SMOOTH MUSCLE ACTIN[PHOTO]"},
    {"test_name": "SOLUBLE TRANSFERRIN RECEPTOR( sTFR)"},
    {
      "test_name":
      "SPECIAL STAINS - ANY ONE (PAS/MUCICARMINE/CONGORED/RETICULIN/AFB/GMS/PRUSSIAN BLUE/MASSON/LUXOL FAST BLUE/ FITE FARRACO/ELASTIC STAIN/GIEMSA/ALCIAN BLUE )"
    },
    {"test_name": "Sphingomyelinase Disorder: Niemann Pick A/B"},
    {"test_name": "SPINAL MUSCULAR ATROPHY MICRODELETION PCR"},
    {"test_name": "SPINDLE CELL TUMOUR"},
    {"test_name": "SPORTS GENE TEST (ACTN3 Genotyping)"},
    {"test_name": "SRY by FISH"},
    {"test_name": "SS18 (SYT) Gene Rearrangement FISH"},
    {"test_name": "SS-A (Ro) IgG ANTIBODIES"},
    {"test_name": "SS-A (Ro) & SS-B (La) IgG ANTIBODIES"},
    {"test_name": "SS-B (La) IgG ANTIBODIES"},
    {
      "test_name":
      "STANDARD INTEGRATED TEST, Phase I (1st Trimester) : 10 – 13.6 Weeks. (PAPA-P & FREE B-HCG). Phase II (2nd Trimester): 15-22 Weeks. (AFP, HCG, E3UN & DIA). Final risk assessment incorporates first and second trimester results."
    },
    {
      "test_name":
      "STD DIAGNOSTIC PANEL (C TRACHOMATIS DNA DETECTOR, HPV DNA DETECTOR, HSV DNA DETECTOR )"
    },
    {"test_name": "STREPTOCOCCUS GROUP B ANTIGEN"},
    {"test_name": "STREPTOCOCCUS GROUP B ANTIGEN, CSF"},
    {"test_name": "STREPTOCOCCUS PNEUMONIAE ANTIGEN"},
    {"test_name": "STREPTOCOCCUS PNEUMONIAE ANTIGEN, CSF"},
    {"test_name": "SUCROSE LYSIS TEST"},
    {"test_name": "SUDAN BLACK STAIN , BLOOD/SMEAR"},
    {"test_name": "SYNAPTOPHYSIN BLOCK, PHOTO"},
    {"test_name": "SYNAPTOPHYSIN BLOCK[PHOTO]"},
    {"test_name": "SYPHILIS ANTIBODIES"},
    {"test_name": "T3, T4, TSH (THYROID PANEL)"},
    {"test_name": "TACROLIMUS"},
    {"test_name": "TACROLIMUS, EDTA/HEPARIN WHOLE BLOOD"},
    {"test_name": "TB CULTURE: ACID FAST BACILLI CULTURE MGIT"},
    {"test_name": "TBG (THYROXINE BINDING GLOBULIN)"},
    {
      "test_name":
      "TB MONITORING PANEL (CBC,ESR,SGPT/SGOT/CREATININE,ANA,AFB SMEAR)"
    },
    {"test_name": "TB PCR (MYCOREAL)"},
    {"test_name": "TB PCR (MYCOtect)"},
    {
      "test_name":
      "TB RAPID GENOTYPIC TEST (MDR-TB) (Note: This test is not applicable for MOTT)"
    },
    {"test_name": "TBRESIST (Note: This test is not applicable for MOTT)"},
    {
      "test_name":
      "TB SECOND LINE DRUG, GENOTYPIC ASSAY (Note: This test is not applicable for MOTT)"
    },
    {"test_name": "TB SPECIATION"},
    {"test_name": "TB SPECIATION – COMMON"},
    {"test_name": "TB SPECIATION – EXTENDED"},
    {"test_name": "TB- XPERT MTB / RIF ( GENE EXPERT)"},
    {"test_name": "TB- XPERT MTB / RIF ( GENE EXPERT) - EXTRAPULMONARY"},
    {"test_name": "T-CELL GENE REARRANGEMENT"},
    {"test_name": "TERMINAL DEOXYNUCLEOTIDYL TRANSFERASE (TDT)"},
    {"test_name": "TERMINAL DEOXYNUCLEOTIDYL TRANSFERASE (TDT)"},
    {"test_name": "TERMINAL DEOXYNUCLEOTIDYL TRANSFERASE (TDT)[PHOTO]"},
    {"test_name": "TESTICULAR CANCER MONITOR (AFP & HCG)"},
    {"test_name": "TESTOSTERONE, FREE"},
    {"test_name": "TESTOSTERONE, FREE/TOTAL"},
    {"test_name": "TESTOSTERONE, TOTAL"},
    {"test_name": "TETANUS IgG Antibodies"},
    {
      "test_name":
      "THALASSEMIA; ALPHA THALASSEMIA MUTATION DETECTION (α3.7, α4.2, αFIL, αSEA, αTHAI )"
    },
    {
      "test_name":
      "THALASSEMIA; BETA THALASSEMIA MUTATION DETECTION (IVS1-5 G-C, 619 bp deletion, cd 8/9 + G, IVS1-1 G-T, 41/42 – TTCT)"
    },
    {"test_name": "THALASSEMIA PROFILE (CBC, Iron, TIBC, HB variant analysis)"},
    {"test_name": "THEOPHYLLINE, SERUM/EDTA PLASMA"},
    {"test_name": "THROMBIN TIME"},
    {
      "test_name":
      "THROMBOCHEK PANEL (Protein C, Protein S, Lupus Antigoagulent, Antiphospholipid Antibody, Serum Homocystein, Anti Thrombin III Activity) [To be ordered with Factor V leiden (# 9894)] which will be charged separately"
    },
    {"test_name": "THROMBOTIC RISK PANEL"},
    {"test_name": "THYPROBE (TSH3G - UL, aTG, aTPO, FT4)"},
    {"test_name": "THYROGLOBULIN"},
    {"test_name": "THYROGLOBULIN [PHOTO]"},
    {
      "test_name":
      "THYROID ANTIBODIES (ANTI- THYROID PREOXIDASE abs. (also known as Anti Microsomal abs.) AND ANTI-THYROGLOBULIN ABS)"
    },
    {"test_name": "THYROID LESIONS"},
    {"test_name": "THYROID PANEL II (FT3, FT4, TSH3G - UL)"},
    {"test_name": "THYROID PANEL IV (T3, T4, TSH)"},
    {"test_name": "THYROID PANEL[PHOTO]"},
    {"test_name": "THYROID SCREENING PANEL (FT4, TSH3G - UL & aTPO)"},
    {"test_name": "THYROID STIMULATING HORMONE"},
    {
      "test_name":
      "THYROID STIMULATING HORMONE, 3rd GENERATION ULTRA (TSH3G - UL)"
    },
    {"test_name": "THYROID STIMULATING HORMONE (TSH)"},
    {"test_name": "THYROID-STIMULATING HORMONE (TSH)[PHOTO]"},
    {"test_name": "THYROID TRANSCRIPTION FACTOR- 1"},
    {"test_name": "THYROID TRANSCRIPTION FACTOR (TTF-1) [PHOTO]"},
    {"test_name": "THYROSCREEN (FT4 & TSH3G - UL)"},
    {"test_name": "THYROXINE FREE, FREE T4"},
    {"test_name": "THYROXINE T4"},
    {"test_name": "TISSUE FOR PROCESSING"},
    {"test_name": "TISSUE TRANSGLUTAMINASE IgA, TTG"},
    {"test_name": "TORCH IgG ANTIBODIES"},
    {"test_name": "TORCH IgG & IgM ANTIBODIES EVALUATION (10 Parameters)"},
    {"test_name": "TORCH IgG & IgM ANTIBODIES EVALUATION (9 Parameters)"},
    {"test_name": "TORCH IgM ANTIBODIES (4 Parameters)"},
    {"test_name": "TORCH IgM ANTIBODIES (5 Parameters)"},
    {"test_name": "TOTAL BILE ACIDS"},
    {"test_name": "TOTAL GALACTOSE (NEONATAL SCREENING)"},
    {"test_name": "TOTAL IgE"},
    {"test_name": "TOTAL P1NP"},
    {"test_name": "TOXOPLASMA IgG ANTIBODIES"},
    {"test_name": "TOXOPLASMA IGG AVIDITY"},
    {"test_name": "TOXOPLASMA IgG & IgM ANTIBODIES"},
    {"test_name": "TOXOPLASMA IgM ANTIBODIES"},
    {"test_name": "TPMT GENOTYPING"},
    {"test_name": "TPMT GENOTYPING+MTHFR MUTATION DETECTION PANEL"},
    {
      "test_name":
      "TPO; ANTI-THYROID PEROXIDASE ANTIBODIES / ANTI MICROSOMAL ABS"
    },
    {"test_name": "TRANSFERRIN"},
    {"test_name": "TRANSSPOT"},
    {"test_name": "TREPONEMA PALLIDIUM HEMAGGLUTINATION ASSAY (TPHA)"},
    {"test_name": "TRIIODOTHYRONINE, FREE T3 (FT3)"},
    {"test_name": "TRIIODOTHYRONINE T3"},
    {
      "test_name":
      "TRIPLE MARKER TEST / 2nd Trimester Risk assessment, 14-22 Weeks. (AFP, HCG & E3UN)"
    },
    {"test_name": "TROPONIN I"},
    {"test_name": "TROPONIN T"},
    {"test_name": "TRUE CARD PANEL (hSCRP , Lipid Profile)"},
    {"test_name": "Trypanosoma cruzi IgG"},
    {"test_name": "TSH (NEONATAL SCREENING)"},
    {"test_name": "TSH RECEPTOR ANTIBODIES"},
    {"test_name": "TSH (THYROID STIMULATING HORMONE)"},
    {"test_name": "TTG/DGP (h-tTG/DGP)"},
    {"test_name": "TTG (TISSUE TRANSGLUTAMINASE IgA)"},
    {"test_name": "TUMOR NECROSIS FACTOR -ALPHA"},
    {"test_name": "U1 snRNP ANTIBODIES"},
    {"test_name": "URINARY GLYCOSAMINOGLYCAN (GAG) QUANTITATION"},
    {"test_name": "URINARY OXALATE"},
    {"test_name": "URINARY VMA (VANILYL MANDELIC ACID)"},
    {
      "test_name":
      "URINE SUPERSATURATION PANEL (CALCIUM, MAGNESIUM,OXALATE,URIC ACID AND PHOSPHORUS, FROM 24hrs URINE )"
    },
    {
      "test_name":
      "UTI SCREENING PANEL (CBC,ESR,GLUCOSE FASTING, URINALYSIS,URINE CULTURE/SENSITIVITY)"
    },
    {
      "test_name":
      "VACCICHEQ (HBsAb, VZV IgG, MUMPS IgG, MEASLES IgG,Rubella IgG)"
    },
    {"test_name": "VALPROIC ACID"},
    {"test_name": "VANCOMYCIN"},
    {"test_name": "VARICELLA ZOSTER VIRUS (VZV) IgG ANTIBODIES (CHICKEN POX)"},
    {"test_name": "VARICELLA ZOSTER VIRUS (VZV) IgM ANTIBODIES (CHICKEN POX)"},
    {"test_name": "VDRL REFLEX TPHA CONFIRMATION"},
    {"test_name": "VGKC ANTIBODY (SERUM,IMMUNOFLUORESCENCE)"},
    {"test_name": "VIMENTIN[PHOTO]"},
    {
      "test_name":
      "VIRAL PNEUMONIA PANEL II (Adenovirus DNA, Cytomegalovirus DNA, HSV 1 & 2)"
    },
    {
      "test_name":
      "VIRAL PNEUMONIA PANEL I (Influenza A RNA, Influenza B RNA, Para Influenza, RSV, Enterovirus RNA)"
    },
    {"test_name": "VITAMIN A, SERUM/EDTA PLASMA"},
    {"test_name": "VITAMIN B12"},
    {"test_name": "VITAMIN B1, SERUM/EDTA PLASMA"},
    {"test_name": "VITAMIN B2, SERUM/EDTA PLASMA"},
    {"test_name": "VITAMIN B6, SERUM/EDTA PLASMA"},
    {"test_name": "VITAMIN C, EDTA Plasma"},
    {"test_name": "VITAMIN D (1,25 DIHYDROXY )"},
    {"test_name": "VITAMIN D (25-HYDROXY VITAMIN D)"},
    {"test_name": "VITAMIN D GOLD (25 HYDROXY VITAMIN D GOLD, LCMS), SERUM"},
    {"test_name": "VITAMIN E, SERUM/EDTA PLASMA"},
    {"test_name": "VITAMIN K1, SERUM"},
    {"test_name": "VITAMINPLUS (25-OH VIT D AND VIT B12)"},
    {"test_name": "VON WILLEBRAND FACTOR ANTIGEN, PLASMA"},
    {"test_name": "VON WILLEBRAND FACTOR, PLASMA"},
    {"test_name": "VZV PCR"},
    {"test_name": "WARFARIN SENSITIVITY BY GENOTYPING"},
    {"test_name": "WEIL FELIX"},
    {"test_name": "WEST NILE VIRUS IGG"},
    {"test_name": "WEST NILE VIRUS IGM"},
    {"test_name": "WILM'S TUMOR PROTEIN 1 (WT1)[PHOTO]"},
    {"test_name": "WT1 MUTATION DETECTION"},
    {"test_name": "XPERT MTB / RIF ( GENE EXPERT)"},
    {"test_name": "XPERT MTB / RIF ( GENE EXPERT) - EXTRAPULMONARY"},
    {"test_name": "YERSINIA ENTEROCOLITICA IgG"},
    {"test_name": "YERSINIA ENTEROCOLITICA IgM"},
    {"test_name": "ZAP-70"},
    {"test_name": "ZINC, 24 HR URINE"},
    {"test_name": "ZINC, SERUM"},
    {"test_name": "ZINC, URINE SPOT"},
    {"test_name": "α1- MICROGLOBULIN"},
    {"test_name": "α2- MACROGLOBULIN"}
  ];

  static String requisitionInfo = "Requisitions Info";
  static const pastOrders = "Pending Orders";
  static const pastOrdersSub = "Pharmacy/Lab/Imaging";
  static const noOrders = "No Past Orders available";

/* '0=>pending,1=>confirmed,2=>declined,3=>payment_pending,4=>completed'*/
  //requisitions
  static String requsitionsStatusText(status) {
    if (status == 0) {
      return "pending";
    } else if (status == 1) {
      return "confirmed";
    } else if (status == 2) {
      return "declined";
    } else if (status == 3) {
      return "Payment Pending";
    } else if (status == 4) {
      return "completed";
    }
    return '';
  }

  static Color requsitionsStatusColor(status) {
    if (status == 0) {
      return CustomColors.yellow1;
    } else if (status == 1) {
      return CustomColors.green;
    } else if (status == 2) {
      return CustomColors.red;
    } else if (status == 3) {
      return CustomColors.grey;
    } else if (status == 4) {
      return CustomColors.green;
    }
    return CustomColors.bg_app;
  }

  /*'0=>pharmacy,1=>lab,2=>imaging,3=>referral,4=>admission,5=>doctor_*/

  static String chatDateFormatBackend = "dd MMM hh:mm a";
}
