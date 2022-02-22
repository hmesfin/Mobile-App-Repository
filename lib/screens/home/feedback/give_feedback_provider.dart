import 'package:virtudoc_app/index.dart';

class GiveFeedbackProvider with ChangeNotifier {
  bool isLoading = false;
  int appointment_id;
  int doctor_id;
  int rating = 0;
  String review;
  String doctor_name;

  init({@required appointment_id, @required doctor_id, @required doctor_name}) {
    rating = 0;
    review = "";
    this.doctor_name = doctor_name;
    this.appointment_id = appointment_id;
    this.doctor_id = doctor_id;
    notifyListeners();
  }

  Future setReview(text) async {
    review = text;
    notifyListeners();
  }

  Future setRating(int rate) async {
    rating = rate;
    notifyListeners();
  }

  Future submitFeedback({Function success, Function failure}) async {
    if (review == "" || review == null) {
      return failure(Strings.enterFeedback);
    }
    Map body = {
      "appointment_id": appointment_id,
      "doctor_id": doctor_id,
      "rating": rating,
      "review": review
    };
    isLoading = true;
    notifyListeners();
    var response = await ApiRequest.postApi(ApiUrl.giveFeedback, body);
    isLoading = false;
    Map decode = jsonDecode(response.body);

    if (response.statusCode == 200) {
      notifyListeners();
      return success();
    } else {
      notifyListeners();
      return failure(decode['message']);
    }
  }
}
