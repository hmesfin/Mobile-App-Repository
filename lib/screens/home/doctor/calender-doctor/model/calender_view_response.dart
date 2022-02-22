class CalenderViewResponse {
  CalenderViewBody body;
  String message;
  int status;
  bool success;

  CalenderViewResponse({this.body, this.message, this.status, this.success});

  factory CalenderViewResponse.fromJson(Map<String, dynamic> json) {
    return CalenderViewResponse(
      body:
      json['body'] != null ? CalenderViewBody.fromJson(json['body']) : null,
      message: json['message'],
      status: json['status'],
      success: json['success'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['success'] = this.success;
    if (this.body != null) {
      data['body'] = this.body.toJson();
    }
    return data;
  }
}

class CalenderViewBody {
  List<CalenderViewData> data;

  CalenderViewBody({this.data});

  factory CalenderViewBody.fromJson(Map<String, dynamic> json) {
    return CalenderViewBody(
      data: json['data'] != null
          ? (json['data'] as List)
          .map((i) => CalenderViewData.fromJson(i))
          .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CalenderViewData {
  String available;
  String date_by;
  int duration;
  String end_time;
  int event_id;
  String start_time;

  CalenderViewData({this.available,
    this.date_by,
    this.duration,
    this.end_time,
    this.event_id,
    this.start_time});

  factory CalenderViewData.fromJson(Map<String, dynamic> json) {
    return CalenderViewData(
      available: json['available'],
      date_by: json['date_by'],
      duration: json['duration'],
      end_time: json['end_time'],
      event_id: json['event_id'],
      start_time: json['start_time'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['available'] = this.available;
    data['date_by'] = this.date_by;
    data['duration'] = this.duration;
    data['end_time'] = this.end_time;
    data['event_id'] = this.event_id;
    data['start_time'] = this.start_time;
    return data;
  }
}
