import 'package:whatsapp_ui_flutter/Chattem.dart';

class ChatHelper {
  static var chatList = [
    ChatItem("Alice", "Lunch in the evening?", "16/07/2018"),
    ChatItem("Jack", "Sure", "16/07/2018"),
    ChatItem("Jane", "Meet this week?", "16/07/2018"),
    ChatItem("Ned", "Received!", "16/07/2018"),
    ChatItem("Steve", "I'll come too!", "16/07/2018")
  ];

  ChatItem getChatItem(int position) {
    return chatList[position];
  }

  static var itemCount = chatList.length;
}
