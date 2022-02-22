import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:virtudoc_app/index.dart';

class ApiRequest {
  static Future<http.Response> postApi(String url, Map jsonMap) async {
    log(url);
    //print(PreferenceUtils.getString(PreferenceKeys.TOKEN));
    url = Uri.encodeFull(url);
    log(url);
    log(jsonMap.toString());
    var body = json.encode(jsonMap);

    log(body);
    var response = await http.post(url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": PreferenceUtils.getString(PreferenceKeys.TOKEN) ?? ''
        },
        body: body);
    log("StatusCode:${response.statusCode}");
    log('Response:${response.body}');
    return response;
  }

  static Future<http.Response> getApi(String url,
      {Map<String, String> header}) async {
    url = Uri.encodeFull(url);

    log(url);
    Map<String, String> defaultHeader = {
      "Content-Type": "application/json",
      "Authorization": PreferenceUtils.getString(PreferenceKeys.TOKEN),
      "device_token": ""
    };
    if (header != null) {
      defaultHeader.addAll(header);
    }

    log(PreferenceUtils.getString(PreferenceKeys.TOKEN));
    var response = await http.get(
      url,
      headers: defaultHeader,
    );
    // if (url != ApiUrl.getUser) {
    log("StatusCode:${response.statusCode}");
    log('Response:${response.body}');
    // }
    return response;
  }

  static Future<http.Response> putApi(String url, Map jsonMap) async {
    log(url);
    log(jsonMap.toString());
    var body = json.encode(jsonMap);
    var response = await http.put(url,
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              PreferenceUtils.getString(PreferenceKeys.TOKEN) ?? '',
        },
        body: body);
    log("StatusCode:${response.statusCode}");
    log('Response:${response.body}');
    return response;
  }

  static Future<http.Response> deleteApi(String url,
      {Map<String, String> header}) async {
    url = Uri.encodeFull(url);

    log(url);
    Map<String, String> defaultHeader = {
      "Content-Type": "application/json",
      "Authorization": PreferenceUtils.getString(PreferenceKeys.TOKEN),
      "device_token": ""
    };
    if (header != null) {
      defaultHeader.addAll(header);
    }
    log(PreferenceUtils.getString(PreferenceKeys.TOKEN));
    var response = await http.delete(
      url,
      headers: defaultHeader,
    );
    // if (url != ApiUrl.getUser) {
    log("StatusCode:${response.statusCode}");
    log('Response:${response.body}');
    // }
    return response;
  }
}
