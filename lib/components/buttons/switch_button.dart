import 'package:flutter/material.dart';

class SwitchButtonCustom extends StatefulWidget {
  SwitchButtonCustom({Key? key}) : super(key: key);

  @override
  State<SwitchButtonCustom> createState() => _SwitchButtonCustomState();
}

class _SwitchButtonCustomState extends State<SwitchButtonCustom> {
  bool speaker = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(47),
        border: Border.all(width: 1,color: Colors.white.withOpacity(0.4))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              speaker = true;
              setState(() {});

            },
            child: Container(
              decoration: BoxDecoration(
                color: speaker == true ? Colors.white.withOpacity(0.7) : Colors.transparent,
                borderRadius: BorderRadius.circular(speaker==true?100:0),
                border: Border.all(width: speaker==true?1:0,color: Colors.white.withOpacity(0.4))
              ),
              child: Icon(Icons.speaker),
            ),
          ),
          GestureDetector(
            onTap: () {
              speaker = false;
              setState(() {});
            },
            child: Container(
              decoration: BoxDecoration(
                  color: speaker == false ? Colors.white.withOpacity(0.7) : Colors.transparent,

                  borderRadius: BorderRadius.circular(speaker==false?100:0),
                  border: Border.all(width: speaker==false?1:0,color: Colors.white.withOpacity(0.4))
              ),
              child:Icon(Icons.earbuds),
            ),
          )
        ],
      ),
    );
  }
}



class SwitchButtonCustom2 extends StatefulWidget {
  SwitchButtonCustom2({Key? key}) : super(key: key);

  @override
  _SwitchButtonCustom2State createState() => _SwitchButtonCustom2State();
}

class _SwitchButtonCustom2State extends State<SwitchButtonCustom2> {
  bool speaker = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(47),
          border: Border.all(width: 1,color: Colors.white.withOpacity(0.4))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              speaker = true;
              setState(() {});

            },
            child: Container(
              decoration: BoxDecoration(
                  color: speaker == true ? Colors.white.withOpacity(0.7) : Colors.transparent,
                  borderRadius: BorderRadius.circular(speaker==true?100:0),
                  border: Border.all(width: speaker==true?1:0,color: Colors.white.withOpacity(0.4))
              ),
              child: Icon(Icons.mic),
            ),
          ),
          GestureDetector(
            onTap: () {
              speaker = false;
              setState(() {});
            },
            child: Container(
              decoration: BoxDecoration(
                  color: speaker == false ? Colors.white.withOpacity(0.7) : Colors.transparent,

                  borderRadius: BorderRadius.circular(speaker==false?100:0),
                  border: Border.all(width: speaker==false?1:0,color: Colors.white.withOpacity(0.4))
              ),
              child:Icon(Icons.mic_off),
            ),
          )
        ],
      ),
    );
  }
}
