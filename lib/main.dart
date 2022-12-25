// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:project_startup/screens/mainscreen.dart';

// import 'models/ourUser.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   await Firebase.initializeApp();
//   await Hive.initFlutter();
//   Hive.registerAdapter(OurUserDetailOriginal());
//   runApp(const ProjectStartup());
// }

// class ProjectStartup extends StatefulWidget {
//   const ProjectStartup({Key? key}) : super(key: key);

//   @override
//   State<ProjectStartup> createState() => _ProjectStartupState();
// }

// class _ProjectStartupState extends State<ProjectStartup> {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MainScreen(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_startup/models/ourUser.dart';
import 'package:project_startup/screens/dataCollection/yearOfPassing.dart';
import 'package:project_startup/screens/root.dart';
import 'package:project_startup/utils/our_colours.dart';
import 'package:project_startup/utils/our_text_styles.dart';

import 'screens/dataCollection/userDataCollection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(OurUserDetailOriginal());
  runApp(ProjectStartup());
}

class ProjectStartup extends StatefulWidget {
  const ProjectStartup({Key? key}) : super(key: key);

  @override
  State<ProjectStartup> createState() => _ProjectStartupState();
}

class _ProjectStartupState extends State<ProjectStartup> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Project Startup',
        debugShowCheckedModeBanner: false,
        theme: MyColors.darkTheme,
        //darkTheme: darkTheme,
        home: Root());
  }
}
