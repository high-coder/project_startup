import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../getx/currentState.dart';


class Root extends StatefulWidget {
  const Root({Key? key}) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {


  final CurrentState stateController = Get.put(CurrentState());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    stateController.navigateUserToTheDesiredScreen();

  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
