import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/orders/model/open_orders_response.dart';
import 'package:virtudoc_app/screens/orders/model/orders_listing_response.dart';

class OrdersListingProvider with ChangeNotifier {
  bool isLoading = false;
  bool noData = false;
  int openOrderCount = 0;
  int page = 0;
  String doctorId;
  String additionalInfo = "";
  DoctorDetailData doctorDetailData;
  List<OrderListingItem> ordersList = [];

  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  void refreshList() async {
    await Future.delayed(Duration(milliseconds: 2000));
    refreshController.refreshCompleted();
    notifyListeners();
  }

  Future getOpenOrderCount() async {
    noData = false;
    notifyListeners();
    var response = await ApiRequest.getApi(ApiUrl.getOpenOrderCount);
    Map decode = jsonDecode(response.body);
    OpenOrdersResponse result = OpenOrdersResponse.fromJson(decode);
    if (result.body.data.count != null) {
      openOrderCount = result.body.data.count;
      notifyListeners();
    }
  }

  Future init() async {
    page = 0;
    noData = false;
    notifyListeners();
  }

  Future getOrdersListing() async {
    if (page == 0) {
      ordersList.clear();
    }
    isLoading = true;
    notifyListeners();
    var response = await ApiRequest.getApi(ApiUrl.getOrdersListing(++page));
    Map decode = jsonDecode(response.body);
    OrdersListingResponse result = OrdersListingResponse.fromJson(decode);
    if (result.body.data.rows.length != 0) {
      ordersList.addAll(result.body.data.rows);
      notifyListeners();
    } else {
      --page;
      notifyListeners();
    }
    if (ordersList.length == 0) {
      noData = true;
    }
    refreshController.loadComplete();
    isLoading = false;
    notifyListeners();
  }

  Future deleteOrderRequisition(orderId, index, {Function error}) async {
    isLoading = true;
    notifyListeners();
    var response =
        await ApiRequest.deleteApi(ApiUrl.deleteOrderRequisition(orderId));
    Map decode = jsonDecode(response.body);
    if (response.statusCode == 200) {
      ordersList.removeAt(index);
      if (ordersList.length == 0) {
        noData = true;
      }
    } else {
      error(decode['message']);
    }
    // await Future.delayed(Duration(seconds: 1));
    isLoading = false;
    notifyListeners();
  }
}
