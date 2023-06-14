import 'package:cobadppb3/berita.dart';
import 'package:cobadppb3/home.dart';
import 'package:cobadppb3/kategori.dart';
import 'package:cobadppb3/login.dart';
import 'package:cobadppb3/trending.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int selectedIndex = 4;

  final List<Widget> pages = [
    Home(),
    Berita(),
    trending(),
    Kategori(),
    Settings(),
  ];
  bool valNotify1 = false;

  onChangeFunction1(bool newValue1) {
    setState(() {
      valNotify1 = newValue1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff9B1768),
        centerTitle: true,
        title: Text('Settings', style: TextStyle(fontSize: 22)),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 40),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Color(0xff9B1768),
                ),
                SizedBox(width: 10),
                Text("Account",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
              ],
            ),
            Divider(height: 20, thickness: 1),
            SizedBox(height: 10),
            buildAccountOption(context, "Change Password"),
            buildAccountOption(context, "Content Settings"),
            buildAccountOption(context, "Helpdesk"),
            buildAccountOption(context, "Display Mode"),
            buildAccountOption(context, "Font Reading Size"),
            buildAccountOption(context, "About Us"),
            SizedBox(height: 40),
            Row(
              children: [
                Icon(Icons.volume_up_outlined, color: Color(0xff9B1768)),
                SizedBox(width: 10),
                Text("Notifications",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
              ],
            ),
            Divider(height: 20, thickness: 1),
            SizedBox(height: 10),
            buildNotificationOption(
                "Notifications", valNotify1, onChangeFunction1),
            SizedBox(height: 50),
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    backgroundColor: Color(0xff9B1768),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (c) => LoginApp(),
                    ),
                  );
                },
                child: Text(
                  "Sign Out",
                  style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2.2,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        height: 80,
        backgroundColor: Color(0xff9B1768),
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.newspaper, title: 'News'),
          TabItem(icon: Icons.trending_down, title: 'Trending'),
          TabItem(icon: Icons.category_rounded, title: 'Categories'),
          TabItem(icon: Icons.settings, title: '  Setting'),
        ],
        initialActiveIndex: 4,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
            if (selectedIndex == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Home(), // Replace with your home screen widget
                ),
              );
            } else if (selectedIndex == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Berita(), // Replace with your news screen widget
                ),
              );
            } else if (selectedIndex == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      trending(), // Replace with your trending screen widget
                ),
              );
            } else if (selectedIndex == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Kategori(), // Replace with your categories screen widget
                ),
              );
            } else if (selectedIndex == 4) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Settings(), // Replace with your settings screen widget
                ),
              );
            }
          });
        },
      ),
    );
  }

  Padding buildNotificationOption(
      String title, bool value, Function onChangeMethod) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600])),
          Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(
                activeColor: Color(0xff9B1768),
                trackColor: Colors.grey,
                value: value,
                onChanged: (bool newValue) {
                  onChangeMethod(newValue);
                },
              )),
        ],
      ),
    );
  }

  GestureDetector buildAccountOption(BuildContext context, String title) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600])),
            Icon(Icons.arrow_forward_ios, color: Colors.grey)
          ],
        ),
      ),
    );
  }
}
