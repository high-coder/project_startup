import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  await Firebase.initializeApp();

  const ProjectStartup();
}

class ProjectStartup extends StatefulWidget {
  const ProjectStartup({Key? key}) : super(key: key);

  @override
  State<ProjectStartup> createState() => _ProjectStartupState();
}

class _ProjectStartupState extends State<ProjectStartup> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(),
    );
  }
}
