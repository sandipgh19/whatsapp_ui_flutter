import 'package:flutter/material.dart';
import 'package:whatsapp_ui_flutter/CallHelper.dart';
import 'package:whatsapp_ui_flutter/CallItem.dart';
import 'package:whatsapp_ui_flutter/ChatHelper.dart';
import 'package:whatsapp_ui_flutter/ChatIem.dart';
import 'package:whatsapp_ui_flutter/StatusHelper.dart';
import 'package:whatsapp_ui_flutter/StatusItem.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Color whatsAppGreen = Color.fromRGBO(18, 140, 126, 1.0);
  Color whatsAppGreenLight = Color.fromRGBO(37, 211, 102, 1.0);

  TabController tabController;
  var fabIcon = Icons.message;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(vsync: this, length: 4)
      ..addListener(() {
        setState(() {
          switch (tabController.index) {
            case 0:
              break;
            case 1:
              fabIcon = Icons.message;
              break;
            case 2:
              fabIcon = Icons.camera_enhance;
              break;
            case 3:
              fabIcon = Icons.call;
              break;
          }
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "WhatsApp",
          style: TextStyle(
              color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.w600),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.more_vert),
          ),
        ],
        backgroundColor: whatsAppGreen,
        bottom: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              child: Text("CHATS"),
            ),
            Tab(
                child: Text(
              "STATUS",
            )),
            Tab(
                child: Text(
              "CALLS",
            )),
          ],
          indicatorColor: Colors.white,
          controller: tabController,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Icon(Icons.camera_alt),
          ListView.builder(
            itemBuilder: (context, position) {
              ChatItem chatItem = ChatHelper.getChatItem(position);

              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.account_circle,
                          size: 64.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      chatItem.user,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.0),
                                    ),
                                    Text(
                                      chatItem.messageTime,
                                      style: TextStyle(color: Colors.black45),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    chatItem.recentMessage,
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 16.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                ],
              );
            },
            itemCount: ChatHelper.itemCount,
          ),
          ListView.builder(
            itemBuilder: (context, position) {
              StatusItem statusItemModel = StatusHelper.getStatusItem(position);

              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.account_circle,
                          size: 64.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      statusItemModel.name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.0),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                    statusItemModel.time,
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 16.0),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                ],
              );
            },
            itemCount: StatusHelper.itemCount,
          ),
          ListView.builder(
            itemBuilder: (context, position) {
              CallItem callItemModel = CallHelper.getCallItem(position);

              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.account_circle,
                          size: 64.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          callItemModel.user,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20.0),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2.0),
                                      child: Text(
                                        callItemModel.time,
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 16.0),
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.call,
                                  color: whatsAppGreen,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                ],
              );
            },
            itemCount: CallHelper.itemCount,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(fabIcon),
        backgroundColor: whatsAppGreenLight,
      ),
    );
  }
}
