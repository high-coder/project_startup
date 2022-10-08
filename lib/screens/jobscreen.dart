import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JobScreen extends StatelessWidget {
  const JobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List languages = [
      "HTML and CSS",
      " Python",
      "Java",
      "JavaScript.",
      "Swift.",
      "C++",
      " C#",
      "R."
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(leading: Icon(Icons.menu), title: Text("Project")),
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.only(left: 14, top: 10, right: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Social Media Marketing',
                            style: GoogleFonts.roboto(fontSize: 20, height: 2)),
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
                height: 50,
                child: Row(children: const [
                  Icon(Icons.house),
                  SizedBox(width: 8),
                  Text(
                    "Work From House",
                  )
                ]),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(Icons.play_arrow_sharp),
                      SizedBox(width: 4),
                      Text("Start Immediately")
                    ],
                  ),
                  SizedBox(width: 20),
                  Row(
                    children: [
                      Icon(Icons.calendar_today),
                      SizedBox(width: 8),
                      Text("4 Months")
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.money),
                        SizedBox(width: 8),
                        Text("2000/month")
                      ],
                    ),
                    SizedBox(width: 20),
                    Row(
                      children: [
                        Icon(Icons.hourglass_bottom_outlined),
                        SizedBox(width: 8),
                        Text("14 Oct' 22")
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: 5, left: 12, right: 12, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          Icon(Icons.av_timer),
                          Text(" Posted 7days ago")
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                        padding: EdgeInsets.only(
                            top: 5, left: 12, right: 12, bottom: 5),
                        decoration: BoxDecoration(
                            color: Colors.blueGrey.shade50,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(" Internship with jo offer")),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: Row(children: [
                  Icon(Icons.people),
                  SizedBox(width: 8),
                  Text("257 applicant")
                ]),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                width: double.maxFinite,
                height: 1,
                decoration: const BoxDecoration(color: Colors.black12),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 15),
                child: Text(
                  "About Across The Globe",
                  style: GoogleFonts.inter(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis vitae sem eu felis viverra congue. Vivamus varius imperdiet quam vitae viverra. Proin turpis leo, vehicula sit amet scelerisque at, ornare vitae ligula. Maecenas aliquet ornare mi et consequat. Vestibulum aliquet massa massa, mollis semper dolor consequat id. Proin sollicitudin viverra arcu id condimentum. Donec dui erat, semper at maximus non, faucibus id est. Ut finibus imperdiet sapien a interdum. Praesent sit amet scelerisque ipsum. Suspendisse lobortis blandit enim ac volutpat.

Mauris vel convallis mauris, eu mattis mi. Suspendisse vitae hendrerit enim, ac hendrerit risus. Curabitur cursus orci quis elementum feugiat. Cras porttitor ex eu tempor accumsan. Ut quis velit arcu. Vestibulum eget aliquet risus. Etiam fermentum lectus a enim rhoncus, eu tincidunt ante suscipit. Nunc rutrum massa eget sapien malesuada sodales.s""",
                style: GoogleFonts.openSans(fontSize: 15),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                width: double.maxFinite,
                height: 1,
                decoration: const BoxDecoration(color: Colors.black12),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 12),
                child: Text(
                  "About the work from Home job/Internship",
                  style: GoogleFonts.inter(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...",
                style: GoogleFonts.poppins(fontSize: 12),
              ),
              Container(
                margin: EdgeInsets.only(top: 18),
                child: ListView.builder(
                    itemCount: 8,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, index) => Container(
                        margin: EdgeInsets.only(top: 6, bottom: 6),
                        child: Text(
                            "${index + 1})  Lorem ipsum dolor sit amet, consectetur adipiscing elit"))),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 12),
                child: Text(
                  "Skill(s) required",
                  style: GoogleFonts.inter(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                child: Wrap(
                    children: List.generate(
                        8,
                        (index) => Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(
                                  top: 4, bottom: 4, right: 6, left: 6),
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey.shade50,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Text(languages[index]),
                            ))),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40, bottom: 12),
                child: Text(
                  "Who can apply",
                  style: GoogleFonts.inter(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                "Only those candiates can apply who:",
                style: GoogleFonts.inter(
                    fontSize: 13, fontWeight: FontWeight.w500),
              ),
              Container(
                margin: EdgeInsets.only(top: 18),
                child: ListView.builder(
                    itemCount: 8,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, index) => Container(
                        margin: EdgeInsets.only(top: 6, bottom: 6),
                        child: Text(
                            "${index + 1})  Lorem ipsum dolor sit amet, consectetur adipiscing elit"))),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40, bottom: 12),
                child: Text(
                  "Perks",
                  style: GoogleFonts.inter(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                child: Wrap(
                    children: List.generate(
                        8,
                        (index) => Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(
                                  top: 4, bottom: 4, right: 6, left: 6),
                              decoration: BoxDecoration(
                                  color: Colors.blueGrey.shade50,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Text(languages[index]),
                            ))),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40, bottom: 12),
                child: Text(
                  "Number of openings",
                  style: GoogleFonts.inter(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              Text("5"),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 30, bottom: 50),
                  padding:
                      EdgeInsets.only(left: 30, top: 15, right: 30, bottom: 15),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8)),
                  child: Text("Apply Now",
                      style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Colors.white)),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
