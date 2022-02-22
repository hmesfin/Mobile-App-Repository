import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/doctor/calender-doctor/selected-model.dart';

class CalenderProvider with ChangeNotifier {
  bool isLoading = false;
  List<SelectedModel> selectedList = [];

  Future getCalenderView() async {
    isLoading = true;
    selectedList.clear();
    notifyListeners();
    var getCalenderView = await ApiRequest.getApi(
        ApiUrl.getCalenderView(CommonWidgets().utcTimeSTamp(DateTime.now())));
    if (getCalenderView.statusCode == 200) {
      Map decode1 = jsonDecode(getCalenderView.body);
      CalenderViewResponse calenderViewResponse =
      new CalenderViewResponse.fromJson(decode1);
      if ((calenderViewResponse?.body?.data?.length ?? 0) > 0) {
        calenderViewResponse.body.data.forEach((element) {
          selectedList.add(SelectedModel(
              element.available == "0" ? false : true,
              DateFormat(Strings.yyyyMMDD).parse(element.date_by),
              element.event_id));
        });
      }
    }
    isLoading = false;
    notifyListeners();
  }

  Future markUnavailble(DateTime day,
      {Function failure, Function success}) async {
    var connected = await CommonWidgets().internetCheck();
    if (!connected) {
      return failure(Strings.not_connected);
    }
    isLoading = true;
    notifyListeners();
    var eventId;
    selectedList?.forEach((element) {
      if (DateFormat(Strings.yyyyMMDD).format(day) ==
          DateFormat(Strings.yyyyMMDD).format(element.dateTime)) {
        eventId = element.eventd;
      }
    });
    Map map = {
      "event_id": eventId,
      "date_by": CommonWidgets().utcTimeSTamp(day),
    };
    var res = await ApiRequest.postApi(ApiUrl.setUnAvailability, map);
    isLoading = false;
    notifyListeners();
    if (res.statusCode == 200) {
      Map dec = jsonDecode(res.body);
      if (res.statusCode == 200) {
        return success();
      } else {
        return failure(dec['message']);
      }
    }
  }
}
