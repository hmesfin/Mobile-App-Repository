class ChatModel {
  String text;
  int timestamp;
  String userId;
  String username;
  String userpic;
  bool self;

  ChatModel({this.text,
    this.timestamp,
    this.userId,
    this.username,
    this.userpic,
    this.self});

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      text: json['text'],
      timestamp: json['timestamp'] is String
          ? int.parse(json['timestamp'])
          : json['timestamp'],
      userId: json['userId'],
      username: json['username'],
      userpic: json['userpic'],
      self: json['self'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['timestamp'] = this.timestamp;
    data['userId'] = this.userId;
    data['username'] = this.username;
    data['userpic'] = this.userpic;
    data['self'] = this.self;
    return data;
  }
}
