import 'dart:developer';

import 'package:socket_io_client/socket_io_client.dart';
import 'package:timezone/timezone.dart';
import 'package:virtudoc_app/index.dart';
import 'package:virtudoc_app/screens/home/doctor/chat/model/chat_model.dart';

class ChatProvider with ChangeNotifier {
  List<Map> userList = [];

  var appointmentId = 0;
  var username = "";
  var otherUsername = "";
  var pic = "";
  var socketUserId = "";
  TextEditingController messageController = new TextEditingController();
  List<ChatModel> chatList = [];
  List<ChatModel> chatList2 = [];
  Socket socket;
  bool isLoading = true;
  bool isSocketConnected = true;
  var size = 100.0;

  Future setSize(size) async {
    this.size = size;
    notifyListeners();
  }

  Future socketConfig({Function notConnected}) async {
    //TODO change to prod url
    String url = ApiUrl.chatStageUrl;
    isLoading = true;

    messageController.clear();
    chatList.clear();
    // chatList.reversed;

    socket = io(url, <String, dynamic>{
      'transports': ['websocket'],
    });

    if (!socket.connected) {
      socket.connect();

      socket.onConnectError((data) => {print('error   $data')});
    }

    notifyListeners();
    await Future.delayed(Duration(seconds: 3));

    if (socket.connected) {
      socket.emit('joinRoom', [
        {
          'username': '${username ?? ""}',
          'roomname': 'room-$appointmentId',
          'userpic': '${pic ?? ""}',
          'userrole': '${PreferenceUtils.getString(PreferenceKeys.ROLE)}'
        }
      ]);
      socket.emit('chat-list');
      await listendAllMessages();
    } else {
      return notConnected();
    }
    isLoading = false;
    notifyListeners();
  }

  Future disconnect({Function success}) async {
    await PreferenceUtils.putBool(PreferenceKeys.IS_CHATTING, false);
    log('${jsonEncode(chatList)}');

    chatList.removeWhere((element) => element.timestamp == null);
    if (chatList.isNotEmpty)
      chatList.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    socket.emit('on-exit', jsonEncode(chatList));
    socket?.emit('disconnect');
    socket?.disconnect();
    socket?.destroy();
    socket?.dispose();
  }

  Future listendAllMessages() async {
    chatList.clear();
    notifyListeners();

    if (socket?.connected ?? false) {
      socket.on('message', (data) {
        log('$data');
        if (data is List) {
          List<ChatModel> localList = [];
          data.forEach((element) {
            ChatModel chatModel = ChatModel.fromJson(element);
            if (chatModel.username == username) {
              chatModel.self = true;
            } else {
              chatModel.self = false;
            }

            localList.add(chatModel);
          });

          //replacimg the local list to chat list
          chatList = localList;

          //sorting chat list on basis of time
          chatList.sort((a, b) => b.timestamp.compareTo(a.timestamp));
          notifyListeners();
        }
        if (data is Map) {
          ChatModel chatModel = new ChatModel();
          data.forEach((key, value) {
            if (key == "userId") {
              chatModel.userId = value;
            }
            if (key == "username") {
              chatModel.username = value;
              if (username == value) {
                chatModel.self = true;
              } else {
                chatModel.self = false;
              }
            }
            if (key == "userpic") {
              chatModel.userpic = value;
            }
            if (key == "timestamp") {
              chatModel.timestamp = value is String ? int.parse(value) : value;
            }
            if (key == "text") {
              chatModel.text = value;
            }
          });
          chatList.insert(0, chatModel);
          socket.emit('on-exit', jsonEncode(chatList));
        }
        notifyListeners();
      });
    }
  }

  Future sendMessage() async {
    if (socket?.connected ?? false) {
      if (messageController.text.isNotEmpty) {
        socket.emit('chat', '${messageController.text}');

        messageController.clear();
        notifyListeners();
      }
    }
  }
}
