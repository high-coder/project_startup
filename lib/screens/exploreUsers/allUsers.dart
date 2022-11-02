

import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:get/get.dart';

import '../../getx/currentState.dart';
import '../../models/ourUser.dart';

class AllUsers extends StatefulWidget {
  const AllUsers({Key? key}) : super(key: key);

  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {

  ScrollController controller = ScrollController();
  CurrentState _instance = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(_scrollListener);
  }
  void _scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      print("at the end of list");
      //movieListBloc.fetchNextMovies();
      // fetch more users here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FirestoreListView<OurUser>(
          query: _instance.snaps,
          itemBuilder: (context, snapshot) {
            final user = snapshot.data();
            return Container(
              child: Text("${user.name}"),
            );
          },
        )
      ),
    );
  }
}
