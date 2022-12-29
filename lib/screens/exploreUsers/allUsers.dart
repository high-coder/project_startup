import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_startup/components/buttons/transparent_button.dart';
import 'package:project_startup/models/button_model.dart';
import 'package:project_startup/screens/exploreUsers/allConnections.dart';
import 'package:project_startup/screens/exploreUsers/connectionSent.dart';
import 'package:project_startup/utils/our_text_styles.dart';

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
    _instance.runMeAtFirst();
  }

  void _scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      print("at the end of list");
      //movieListBloc.fetchNextMovies();
      _instance.fetchNextUsers();
      // fetch more users here
    }
  }

  @override
  Widget build(BuildContext context) {
    print("somtsdhkjbnfg dsgbds fgibdsfg dsfgihadsfghibads");
    return Scaffold(
      //backgroundColor: Colors.white,
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

              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TransparentButton(
                      onTapp: () {
                        // this page should display the connections that the user has
                        Get.to(() => AllConnections());
                      },
                      buttonDetails: ButtonModel(
                          border: false,
                          icon: false,
                          size: 'lg',
                          text: 'Connections',
                          buttonColor: Colors.blue,
                          iconB: Icons.check),
                    ),
                    TransparentButton(
                      onTapp: () {
                        Get.to(() => ConnectionsSent());
                      },
                      buttonDetails: ButtonModel(
                          border: false,
                          icon: false,
                          size: 'lg',
                          text: 'Sent Requests ',
                          buttonColor: Colors.blue,
                          iconB: Icons.check),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),

              // Expanded(
              //   child: TextField(
              //     style: GoogleFonts.inter(
              //       color: Colors.white,
              //     ),
              //     decoration: InputDecoration(),
              //     onChanged: (value) {
              //       print(value);
              //       // send the value to a function to check
              //     },
              //   ),
              // ),
              // here add the title of the page maybe a search button among other things
              GetBuilder<CurrentState>(
                builder: (contextt) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        padding:
                            EdgeInsets.only(left: 15, right: 15, bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                "${_instance.allUsers[index].name}",
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            // here add the connect button
                            Builder(
                              builder: (context) {
                                if (_instance.allUsers[index].relation !=
                                    null) {
                                  if (_instance.allUsers[index].relation ==
                                      "Pending") {
                                    return Expanded(
                                      flex: 1,
                                      child: TransparentButton(
                                        onTapp: () {},
                                        buttonDetails: ButtonModel(
                                            border: false,
                                            icon: false,
                                            size: 'lg',
                                            text: 'Pending ',
                                            buttonColor: Colors.blue,
                                            iconB: Icons.check),
                                      ),
                                    );
                                  } else if (_instance
                                          .allUsers[index].relation ==
                                      "Received") {
                                    return Text("REc");
                                  } else if (_instance
                                          .allUsers[index].relation ==
                                      "Friend") {
                                    return Text("Friends");
                                  } else {
                                    return Text("something");
                                  }
                                } else {
                                  return Expanded(
                                    flex: 1,
                                    child: TransparentButton(
                                      onTapp: () {
                                        print("thiehrteiouhrt efiuhb dsifds");
                                        _instance.sendConnectionRequest(
                                            _instance.allUsers[index].uid!,
                                            index);
                                      },
                                      buttonDetails: ButtonModel(
                                          border: false,
                                          icon: false,
                                          size: 'lg',
                                          text: 'Connect',
                                          buttonColor: Colors.blue,
                                          iconB: Icons.check),
                                    ),
                                  );
                                }
                              },
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: _instance.allUsers.length,
                    controller: controller,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
