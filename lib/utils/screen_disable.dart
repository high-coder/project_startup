import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lottie/lottie.dart';

import '../getx/screenDisable.dart';

class ScreenLoader extends StatelessWidget {
  Widget child;

  ScreenLoader({Key? key, required this.child}) : super(key: key);
  ScreenDisableController _instance = Get.find();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("the screen loader page is rebuilding");

    return Stack(
      children: [
        child,
        Obx(() => Visibility(
              visible: _instance.disableScreen.value,
              child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: size.height,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                      ),
                      child: Center(
                          child: Lottie.asset("assets/lottie/airplane.json")),
                    ),
                  ) ??
                  Container(),
            ))
      ],
    );
  }
}
