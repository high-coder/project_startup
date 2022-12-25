import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_startup/getx/authController.dart';
import 'package:project_startup/screens/exploreUsers/allUsers.dart';

import '../../getx/currentState.dart';
import '../../getx/homePageController.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  AuthService authController = Get.find();

  TabController? _tabController;

  CurrentState _instance = Get.find();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 5,
      vsync: this,
    );
    // _tabController.
  }

  void changeIndex(int indexValue) {
    _homeController.changeTabIndex(indexValue);
    _tabController?.index = indexValue;
    print(_tabController?.index);
    setState(() {});
  }

  HomePageController _homeController = Get.put(HomePageController());

  Color iconUnselectedColor = Colors.black;
  buildBottomNavigationMenu(context) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 60,
          child: BottomNavigationBar(
            showUnselectedLabels: false,
            showSelectedLabels: false,
            onTap: changeIndex,
            currentIndex: _homeController.tabIndex.value,
            backgroundColor: Colors.black,
            unselectedItemColor: iconUnselectedColor,
            selectedItemColor: Colors.blue.withOpacity(0.5),
            //unselectedLabelStyle: unselectedLabelStyle,
            //selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.airplanemode_active,
                    size: 20.0,
                    //color: iconUnselectedColor,
                  ),
                ),
                label: 'Home',

                //backgroundColor:appBgWildStrawberry
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.near_me,
                    size: 20.0,
                    //color: iconUnselectedColor,
                  ),
                ),
                label: 'Explore',
                //backgroundColor:appBgWildStrawberry
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.whatshot,
                    size: 20.0,
                    //color: iconUnselectedColor,
                  ),
                ),
                label: 'Places',
                //backgroundColor:appBgWildStrawberry
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.message,
                    size: 20.0,
                    //color: iconUnselectedColor,
                  ),
                ),
                label: 'Settings',
                //backgroundColor:appBgWildStrawberry
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.settings,

                    size: 20.0,
                    //color: iconUnselectedColor,
                  ),
                ),

                label: 'Settings',
                //backgroundColor:appBgWildStrawberry
              ),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    //authController.logOut();

    return Scaffold(
        //backgroundColor: Colors.white,
        bottomNavigationBar: buildBottomNavigationMenu(context),
        body: SafeArea(
          // child:Column(
          //   children: [
          //     Text(
          //       "This is your home mate",
          //       style: GoogleFonts.openSans(color: Colors.white),
          //     ),
          //     GestureDetector(
          //       onTap: () {
          //         authController.logOut();
          //       },
          //       child: Text("Logout",                style: GoogleFonts.openSans(color: Colors.white),
          //       ),
          //     )
          //   ],
          // )

          child: GetBuilder<HomePageController>(
            builder: (contexttt) {
              return TabBarView(
                controller: _tabController,
                children: [
                  Container(
                      child: GestureDetector(
                          onTap: () {
                            authController.logOut();
                          },
                          child: Text(
                            "log out",
                            style: GoogleFonts.openSans(color: Colors.white),
                          ))),
                  Container(),
                  Container(),
                  AllUsers(),
                  Container(),
                ],
              );
            },
          ),
        ));
  }
}
