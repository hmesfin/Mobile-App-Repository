import 'package:flutter/material.dart';

class PrescriptionFilterModel {
  String requestType;
  String page;
  String pageSize;

  PrescriptionFilterModel({@required this.page,
    @required this.pageSize,
    @required this.requestType});

  PrescriptionFilterModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    pageSize = json['page_size'];
    requestType = json['request_type'];
  }

  Map<String, String> toJson() {
    final Map<String, String> data = new Map<String, String>();
    data['page'] = this.page;
    data['page_size'] = this.pageSize;
    data['request_type'] = this.requestType;
    return data;
  }
}
