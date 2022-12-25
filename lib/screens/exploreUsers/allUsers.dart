import 'package:flutter/material.dart';

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
    _instance.fetchFirstSetOfUsers();
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
    print("somtsdhkjbnfg dsgbds fgibdsfg dsfgihadsfghibads");
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          // child: FirestoreListView<OurUser>(
          //   query: _instance.snaps,
          //   itemBuilder: (context, snapshot) {
          //     final user = snapshot.data();
          //     return Container(
          //       child: Text("${user.name}"),
          //     );
          //   },
          // )
          child: Column(
            children: [
              Text("something random here mate "),
              // here add the title of the page maybe a search button among other things
              ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        Text(
                            "name of the user : ${_instance.allUsers[index].name}"),
                        // here add the accept and reject button
                      ],
                    ),
                  );
                },
                itemCount: _instance.allUsers.length,
                controller: controller,
              )
            ],
          ),
        ),
      ),
    );
  }
}
