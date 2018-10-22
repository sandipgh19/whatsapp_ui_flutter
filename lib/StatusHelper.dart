import 'package:whatsapp_ui_flutter/StatusItem.dart';

class StatusHelper {

  static var statusList = [StatusItem("Sandip", "Yesterday, 11:21 PM")];

  static StatusItem getStatusItem(int position) {
    return statusList[position];
  }

  static var itemCount = statusList.length;

}