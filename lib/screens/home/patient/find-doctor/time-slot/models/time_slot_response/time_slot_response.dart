class TimeSlotDataItem {
  String available;
  String slot_end;
  String slot_start;

  TimeSlotDataItem({this.available, this.slot_end, this.slot_start});

  factory TimeSlotDataItem.fromJson(Map<String, dynamic> json) {
    return TimeSlotDataItem(
      available: json['available'],
      slot_end: json['slot_end'],
      slot_start: json['slot_start'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['available'] = this.available;
    data['slot_end'] = this.slot_end;
    data['slot_start'] = this.slot_start;
    return data;
  }
}
