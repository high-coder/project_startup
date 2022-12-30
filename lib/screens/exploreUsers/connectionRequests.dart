import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:project_startup/getx/currentState.dart';

/// This page is for displaying the connectionRequests that the user has received
class ConnectionRequests extends StatefulWidget {
  const ConnectionRequests({super.key});

  @override
  State<ConnectionRequests> createState() => _ConnectionRequestsState();
}

class _ConnectionRequestsState extends State<ConnectionRequests> {
  CurrentState _instance = Get.find();

  bool isLoading = false;
  late ScrollController _scrollController;
  int _skip = 0;
  int numberOfPagePerRequest = 10;
  @override
  void initState() {
    _instance.pendingConnections.clear();
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _instance.fetchRequests(_skip);
    _scrollController.addListener(() async {
      var nextPageTrigger = 0.8 * _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels > nextPageTrigger) {
        if (isLoading == false) {
          _skip += 10;
          isLoading = true;
          // update the screen UI someway here
          setState(() {});
          _instance.fetchRequests(_skip);
          // make the function call Here man

          isLoading = false;
        }
      }
    });
    //_instance.fetch
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
