import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/patient/prescription/prescription_detail_model.dart';

class PrescriptionProvider extends ChangeNotifier {
  bool isLoading = false;

  List<HistoryModel> prescriptionModelList = [];
  HistoryModel historyModel;
  PrescriptionDetailModel prescriptionDetailModel = PrescriptionDetailModel();
  int page = 1;

  Future getPrescriptions(
      {String request = 'all', String pageSize = '10', int page = 1}) async {
    isLoading = true;

    notifyListeners();

    if (page == 1) {
      prescriptionModelList.clear();
    }

    try {
      var response = await ApiRequest.getApi(
        '${ApiUrl
            .appointmentList}?request_type=$request&page=$page&page_size=$pageSize',
      );

      var baseResponse = BaseResponse.fromJson(jsonDecode(response.body));

      baseResponse.body['data']['rows'].forEach((appointment) {
        prescriptionModelList.add(HistoryModel.fromJson(appointment));
      });
    } catch (e) {}

    isLoading = false;
    notifyListeners();
  }

  Future getAppoinmentDetail(int appoinmentId) async {
    notifyListeners();

    try {
      var response = await ApiRequest.getApi(
        ApiUrl.appointmentDetail + "?appointment_id=$appoinmentId",
      );

      var baseResponse = BaseResponse.fromJson(jsonDecode(response.body));

      if (baseResponse.body != null) {
        historyModel = HistoryModel.fromJson(baseResponse.body['data']);
      }
    } catch (e) {}

    notifyListeners();
  }

  Future getDetailPrescriptions(int appointmentId,
      Function(String) onerror) async {
    isLoading = true;

    notifyListeners();
    try {
      var response = await ApiRequest.getApi(
        ApiUrl.prescriptionDetail + "?appointment_id=$appointmentId",
      );

      var baseResponse = BaseResponse.fromJson(jsonDecode(response.body));

      if (baseResponse.body != null) {
        prescriptionDetailModel =
            PrescriptionDetailModel.fromJson(baseResponse.body);
      }
    } catch (e) {
      onerror(e.toString());
    }

    isLoading = false;
    notifyListeners();
  }
}
