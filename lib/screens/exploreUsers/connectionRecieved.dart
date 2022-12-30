import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_startup/utils/screen_disable.dart';

import '../../getx/currentState.dart';

class ConnectionRecieved extends StatefulWidget {
  const ConnectionRecieved({super.key});

  @override
  State<ConnectionRecieved> createState() => _ConnectionRecievedState();
}

class _ConnectionRecievedState extends State<ConnectionRecieved> {
  CurrentState _instance = Get.find();
  bool isLoading = false;
  late ScrollController _scrollController;
  int _skip = 0;
  int numberOfPagePerRequest = 10;
  @override
  void initState() {
    _instance.receivedList.clear();
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
    return ScreenLoader(
      child: Scaffold(
        backgroundColor: Colors.red,
        body: SafeArea(
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: _instance.receivedList.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        CircleAvatar(),
                        Text(
                          _instance.receivedList[index].name ?? "",
                          style: GoogleFonts.inter(color: Colors.white),
                        ),
                        IconButton(
                            onPressed: () {
                              _instance.actionOnConnectionRequest(
                                  "accept", index);
                            },
                            icon: Icon(Icons.check)),
                        IconButton(
                            onPressed: () {
                              _instance.actionOnConnectionRequest(
                                  "reject", index);
                            },
                            icon: Icon(Icons.close))
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
