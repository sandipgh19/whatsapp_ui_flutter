import 'package:whatsapp_ui_flutter/ChatIem.dart';

class ChatHelper {
  static var chatList = [
    ChatItem("Jack", "Lunch in the evening?", "22/10/2018"),
    ChatItem("Alice", "Sure", "21/10/2018"),
    ChatItem("Sandip", "Meet this week?", "20/10/2018"),
    ChatItem("Ned", "Received!", "19/10/2018"),
    ChatItem("Steve", "I'll come too!", "18/10/2018")
  ];

  static ChatItem getChatItem(int position) {
    return chatList[position];
  }

  static var itemCount = chatList.length;
}
