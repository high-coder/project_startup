import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../getx/currentState.dart';

class AllConnections extends StatefulWidget {
  const AllConnections({super.key});

  @override
  State<AllConnections> createState() => _AllConnectionsState();
}

class _AllConnectionsState extends State<AllConnections> {
  CurrentState _instance = Get.find();

  bool isLoading = false;
  late ScrollController _scrollController;
  int _skip = 0;
  int numberOfPagePerRequest = 10;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _instance.fetchConnections(_skip);
    _scrollController.addListener(() async {
      var nextPageTrigger = 0.8 * _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels > nextPageTrigger) {
        if (isLoading == false) {
          _skip += 10;
          isLoading = true;
          // update the screen UI someway here
          setState(() {});
          _instance.fetchConnections(_skip);
          // make the function call Here man

          isLoading = false;
        }
      }
    });
    //_instance.fetch
  }

  /// technically this page should also have the pagination here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
