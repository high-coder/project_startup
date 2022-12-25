import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'jobscreen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextStyle tagStyle =
        GoogleFonts.inter(fontSize: 13, color: Colors.blueGrey);
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          ],
        ),
        body: CustomScrollView(slivers: [
          const SliverAppBar(
            leading: Icon(Icons.menu),
            title: Text('SliverAppBar'),
            backgroundColor: Colors.green,
          ),
          SliverFixedExtentList(
            itemExtent: 300.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) => const JobScreen()))
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: Container(
                        padding:
                            const EdgeInsets.only(right: 20, left: 20, top: 30),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromRGBO(72, 72, 72, 0.12),
                                offset: Offset(0, 0),
                                spreadRadius: 0,
                              ),
                              BoxShadow(
                                  color: Color.fromRGBO(72, 72, 72, 0.08),
                                  offset: Offset(0, 2),
                                  spreadRadius: 4,
                                  blurRadius: 10),
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Social Media Marking ",
                                          style: GoogleFonts.inter(
                                              fontSize: 26,
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                              fontWeight: FontWeight.w800)),
                                      Text("Taraa Zameen Par ",
                                          style: GoogleFonts.inter(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              height: 2))
                                    ]),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ClipOval(
                                      child: Image.network(
                                    "https://s3-symbol-logo.tradingview.com/alphabet--600.png",
                                    width: 60,
                                    height: 60,
                                  )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                              child: Row(
                                children: const [
                                  Icon(Icons.house_outlined),
                                  Text("Work from Home")
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 60,
                              width: size.width * 0.7,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(Icons.play_arrow_outlined),
                                          Text(
                                            "Start Date",
                                          )
                                        ],
                                      ),
                                      Text("Immediately",
                                          style:
                                              GoogleFonts.openSans(height: 1.5))
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(Icons.calendar_today),
                                          Text("Duration")
                                        ],
                                      ),
                                      Text("4 Months",
                                          style:
                                              GoogleFonts.openSans(height: 1.5))
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(Icons.money),
                                          Text(
                                            "Stipend",
                                          )
                                        ],
                                      ),
                                      Text("\$ 200",
                                          style:
                                              GoogleFonts.openSans(height: 1.5))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                              child: Row(children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 5),
                                  padding: const EdgeInsets.only(
                                      left: 10, top: 3, bottom: 3, right: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.blue.shade50,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Row(
                                    children: [
                                      Icon(Icons.replay_5_sharp,
                                          size: 20, color: Colors.blue),
                                      Text("7 Days to Go",
                                          style: GoogleFonts.inter(
                                              fontSize: 13, color: Colors.blue))
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5, right: 5),
                                  padding: EdgeInsets.only(
                                      left: 10, top: 5, bottom: 5, right: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey.shade50,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Internship",
                                        style: tagStyle,
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 5, right: 5),
                                  padding: EdgeInsets.only(
                                      left: 10, top: 5, bottom: 5, right: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.blueGrey.shade50,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Part time Allowed",
                                        style: tagStyle,
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                            )
                          ],
                        )),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ]));
  }
}
