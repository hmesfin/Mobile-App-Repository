import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/location/country_model.dart';
import 'package:virtudoc_app/screens/location/issuing_country_model.dart';
import 'package:virtudoc_app/screens/location/locality_model.dart';
import 'package:virtudoc_app/screens/location/region_model.dart';

class LocationProvider extends ChangeNotifier {
  double latitude, longitude;
  List<RegionModel> locationList = [];
  List<CityModel> cityList = [];
  List<CountryModel> issuingCountrylist = [];
  List<LocalityModel> localityList = [];
  bool isLoading = false;
  String error;
  bool showError = false;

  getCountry() async {
    isLoading = true;
    notifyListeners();
    try {
      issuingCountrylist.clear();
      var response = await get(ApiUrl.getCountry);

      var baseResponse = BaseResponse.fromJson(jsonDecode(response.body));

      baseResponse.body['data'].forEach((country) {
        issuingCountrylist.add(CountryModel.fromJson(country));
      });
    } on PlatformException catch (e) {
      showError = true;
      error = e.message;
    } catch (er) {
      showError = true;
      error = er.toString();
    }

    isLoading = false;
    notifyListeners();
  }

  getLocations({String countryCode}) async {
    isLoading = true;
    notifyListeners();
    try {
      locationList.clear();
      var response = await get(ApiUrl.getRegion + "?country_code=$countryCode");

      var baseResponse = BaseResponse.fromJson(jsonDecode(response.body));

      baseResponse.body['data'].forEach((country) {
        locationList.add(RegionModel.fromJson(country));
      });
    } on PlatformException catch (e) {
      showError = true;
      error = e.message;
    } catch (er) {
      showError = true;
      error = er.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  getCity({int regionId}) async {
    isLoading = true;
    notifyListeners();
    try {
      cityList.clear();
      var response =
          await get(ApiUrl.getCitiesByRegion + "?region_id=$regionId");

      var baseResponse = BaseResponse.fromJson(jsonDecode(response.body));

      baseResponse.body['data'].forEach((country) {
        cityList.add(CityModel.fromJson(country));
      });
    } on PlatformException catch (e) {
      showError = true;
      error = e.message;
    } catch (er) {
      showError = true;
      error = er.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  getLocality({int cityId}) async {
    isLoading = true;
    notifyListeners();
    try {
      localityList.clear();
      var response = await get(ApiUrl.getLocalitiesByCity + "?city_id=$cityId");

      var baseResponse = BaseResponse.fromJson(jsonDecode(response.body));

      baseResponse.body['data'].forEach((country) {
        localityList.add(LocalityModel.fromJson(country));
      });
    } on PlatformException catch (e) {
      showError = true;
      error = e.message;
    } catch (er) {
      showError = true;
      error = er.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
