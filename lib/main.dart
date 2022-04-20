import 'package:flutter/material.dart';
import 'package:yoga_app_ui/constraints.dart';
import 'package:yoga_app_ui/screens/detail_screen.dart';
import 'package:yoga_app_ui/widgets/category_card.dart';
import 'widgets/BottomNavBar.dart';
import 'widgets/serachbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meditation App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Cairo',
        scaffoldBackgroundColor: kBackgroundcolor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
      body: Stack(
        children: [
          Container(
            height: size.height * 0.45,
            decoration: const BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                  image: AssetImage("assets/main1.png"), fit: BoxFit.cover),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 52,
                        width: 52,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffeeb599)),
                        child: const Icon(
                          Icons.menu,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "Good Morning\nShishir",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                  const SearchBar(),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.85,
                      children: [
                        CategoryCard(
                          press: () {},
                          path: 'assets/Hamburger.png',
                          title: 'Diet',
                        ),
                        CategoryCard(
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const DetailScreen()),
                              );
                            },
                            title: 'Meditation',
                            path: 'assets/meditation.png'),
                        CategoryCard(
                          press: () {},
                          title: 'Yoga',
                          path: 'assets/yoga.png',
                        ),
                        CategoryCard(
                          press: () {},
                          title: 'Exercises',
                          path: 'assets/gym.png',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
