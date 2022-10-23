import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class CustomPicker extends StatefulWidget {
  const CustomPicker(
      {Key? key,
        required this.width,
        required this.height,
        required this.data,
        required this.controller,
        this.cornerText,
        this.color,
        this.onChange,
        this.fontSize,
        this.highlightedFont})
      : super(key: key);
  final double? fontSize;
  final double? highlightedFont;
  final double width;
  final double height;
  final List data;
  final FixedExtentScrollController controller;
  final String? cornerText;
  final Color? color;
  final Function? onChange;

  @override
  _CustomPickerState createState() => _CustomPickerState();
}

class _CustomPickerState extends State<CustomPicker> {
  late double width;
  late double height;
  late String cornerText;
  late int selectedIndex;
  late Color color;
  late Function onChange;
  late double fontSize;
  late double highlightedFont;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex = widget.controller.initialItem;
    color = widget.color ?? Colors.black;
    cornerText = widget.cornerText ?? '';
    onChange = widget.onChange ?? (index) {};
    fontSize = widget.fontSize ?? 24;
    highlightedFont = widget.highlightedFont ?? 20;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: widget.key,
      width: widget.width,
      height: widget.height,
      child: Stack(children: [
        Center(
            child: Container(
              alignment: Alignment.center,
              width: widget.width,
              height: widget.height / 3,
              decoration: BoxDecoration(
                  //color: Color(0xffFFFFFF),
                  border: Border.symmetric(horizontal: BorderSide(color: Color(0xffEFEFEF), width: 1)),

                  //borderRadius: BorderRadius.circular(30),
                  // boxShadow: [
                  //   BoxShadow(
                  //       offset: Offset(4, 4),
                  //       color: Color(0xff000000).withOpacity(0.25),
                  //       blurRadius: 10),
                  //   BoxShadow(
                  //       offset: Offset(0, -2),
                  //       color: Color(0xffffffff).withOpacity(0.25),
                  //       blurRadius: 10),
                  // ]

              ),
              child: Stack(children: [
                Positioned(
                    bottom: 5,
                    right: 8,
                    child: Text(cornerText.toString(),
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              fontSize: 12,
                              color: color,
                              fontWeight: FontWeight.w600),
                        ))),
              ]),
            )),
        ListWheelScrollView.useDelegate(
            itemExtent: widget.height / 3,
            onSelectedItemChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
              onChange(index);
            },
            physics: const FixedExtentScrollPhysics(),
            controller: widget.controller,
            childDelegate: ListWheelChildBuilderDelegate(
                builder: (ctx, index) {
                  return Container(
                      width: widget.width,
                      height: widget.height / 3,
                      child: Center(
                        child: Text(
                          widget.data[index].toString(),
                          style: selectedIndex == index
                              ? GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontSize: fontSize, color: Colors.white))
                              : GoogleFonts.roboto(
                              textStyle: TextStyle(
                                  fontSize: highlightedFont,
                                  color: Color(0xffC4C4C4))),
                        ),
                      ));
                },
                childCount: widget.data.length))
      ]),
    );
  }
}
