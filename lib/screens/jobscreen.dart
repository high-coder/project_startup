import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JobScreen extends StatelessWidget {
  const JobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(leading: Icon(Icons.menu), title: Text("Project")),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Social Media Marketing',
                                style: GoogleFonts.roboto(
                                    fontSize: 20, height: 2)),
                            Text('trip to india',
                                style: GoogleFonts.openSans(fontSize: 15)),
                          ]),
                      Image.network(
                        "https://s3-symbol-logo.tradingview.com/alphabet--600.png",
                        height: 60,
                        width: 60,
                      )
                    ],
                  ),
                  SizedBox(
                    child: Row(children: const [
                      Icon(Icons.house),
                      Text("Work From House")
                    ]),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.play_arrow_sharp),
                          Text("Start Immediately")
                        ],
                      ),
                      SizedBox(width: 20  ),
                      Row(
                        children: [
                          Icon(Icons.calendar_today),
                          Text("4 Months")
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
