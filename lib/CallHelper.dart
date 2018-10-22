import 'package:whatsapp_ui_flutter/CallItem.dart';

class CallHelper {
  static var listItem = [CallItem("Sandip", "Today 10:49 PM")];

  static CallItem getCallItem(int position) {
    return listItem[position];
  }

  static var itemCount = listItem.length;
}
