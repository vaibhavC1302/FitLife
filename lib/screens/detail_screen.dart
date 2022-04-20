import 'package:flutter/material.dart';
import 'package:yoga_app_ui/constraints.dart';
import 'package:yoga_app_ui/widgets/BottomNavBar.dart';
import 'package:yoga_app_ui/widgets/serachbar.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          height: 50,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              BottomNavItem(
                icon: Icons.calendar_month_outlined,
              ),
              BottomNavItem(
                icon: Icons.sports_gymnastics,
                isactive: true,
              ),
              BottomNavItem(
                icon: Icons.settings,
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              Container(
                height: size.height * 0.45,
                decoration: const BoxDecoration(
                  color: kBlueLightColor,
                  image: DecorationImage(
                    image: AssetImage('assets/meditation_bg.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * 0.05),
                      const Text(
                        "Meditation",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 30),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        '3-10 MIN Course',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: size.width * 0.6,
                        child: const Text(
                          'Live happier and healthier by learning the fundamentals of meditation and mindfullness',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.5,
                        child: const SearchBar(),
                      ),
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          SessionCard(
                            SessonNum: 01,
                            tapped: () {},
                          ),
                          SessionCard(SessonNum: 02, tapped: () {}),
                          SessionCard(
                            SessonNum: 03,
                            tapped: () {},
                            isDone: true,
                          ),
                          SessionCard(SessonNum: 04, tapped: () {}),
                          SessionCard(SessonNum: 05, tapped: () {}),
                          SessionCard(SessonNum: 06, tapped: () {})
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Meditation",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 17),
                              blurRadius: 23,
                              spreadRadius: -13,
                              // color: kShadowColor
                            )
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/Meditation_women_small.png'),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text('Basic 2',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  Text('Start and deepen your practice')
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.lock_outline,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class SessionCard extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final int SessonNum;
  final bool isDone;
  final Function tapped;
  const SessionCard({
    Key? key,
    // ignore: non_constant_identifier_names
    required this.SessonNum,
    this.isDone = false,
    required this.tapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 - 10,
          // padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 17),
                    blurRadius: 23,
                    spreadRadius: -13,
                    color: kShadowColor)
              ]),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                tapped;
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                          border: Border.all(color: kBlueColor),
                          shape: BoxShape.circle,
                          color: isDone ? kBlueLightColor : Colors.white),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? Colors.white : kBlueLightColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Session $SessonNum',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
