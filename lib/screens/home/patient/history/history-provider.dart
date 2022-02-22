import 'package:virtudoc_app/index.dart';
import './post-visit-list-model.dart';
import './post-visit-details-model.dart';

class PostVisitListProvider extends ChangeNotifier {
  PostVisitListModel postVisitListModel;
  bool isLoading = false;
  int page = 1;
  List<PostVisitListModel> _list = [];

  List<PostVisitListModel> get list => _list;

  void getFeedbackList(int patientId, int page) async {
    try {
      if (page == 1) {
        list.clear();
      }

      isLoading = true;
      notifyListeners();
      var response = await ApiRequest.getApi(
        ApiUrl.getPostVisitList(patientId, page),
      );

      final body = json.decode(response.body) as Map<String, dynamic>;
      final data = body['body']['data'];

      data.forEach((element) {
        _list.add(PostVisitListModel.fromJson(element));
      });
      isLoading = false;

      notifyListeners();
    } catch (err) {
      isLoading = false;
      notifyListeners();
    }
  }
}

class PostVisitDetailsProvider extends ChangeNotifier {
  PostVisitDetailsModel postVisitDetailsModel;
  bool isLoading = false;

  fetch(int postVisitId) async {
    try {
      isLoading = true;
      notifyListeners();
      var response = await ApiRequest.getApi(
          "${ApiUrl.postVisitDetails}?post_visit_id=$postVisitId");
      final body = json.decode(response.body) as Map<String, dynamic>;
      final data = body['body']['data'];
      postVisitDetailsModel = PostVisitDetailsModel.fromJson(data);
      isLoading = false;
    } catch (err) {
      isLoading = false;
    }
    notifyListeners();
  }
}
