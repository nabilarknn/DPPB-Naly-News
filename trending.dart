// import 'dart:convert';

import 'package:cobadppb3/berita.dart';
import 'package:cobadppb3/business.kat.dart';
import 'package:cobadppb3/home.dart';
import 'package:cobadppb3/settings.dart';
import 'package:cobadppb3/tech.kat.dart';
import 'package:cobadppb3/trending_crypto.dart';
import 'package:cobadppb3/trending_celeb.dart';
import 'package:cobadppb3/trending_apple.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:cobadppb3/kategori.dart';

// import 'package:http/http.dart' as http;

class trending extends StatefulWidget {
  const trending({super.key});

  @override
  State<trending> createState() => _trendingState();
}

class _trendingState extends State<trending> {
  int selectedIndex = 2;
  final List<Widget> pages = [
    Home(),
    Berita(),
    trending(),
    Kategori(),
    Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff9B1768),
        // elevation: 0.0,
        title: Text("Trends for you!"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            ListTile(
              leading: Container(
                padding: EdgeInsets.only(left: 10.0),
                child: Icon(Icons.tag),
              ),
              title: Text("Apple"),
              onTap: () {
                _onItemTapped(0);
              },
            ),
            Divider(
              color: Colors.brown,
            ),
            ListTile(
              leading: Container(
                padding: EdgeInsets.only(left: 10.0),
                child: Icon(Icons.tag),
              ),
              title: Text("Crypto"),
              onTap: () {
                _onItemTapped(1);
              },
            ),
            Divider(color: Color(0xff9B1768)),
            ListTile(
              leading: Container(
                padding: EdgeInsets.only(left: 10.0),
                child: Icon(Icons.tag),
              ),
              title: Text("Celeb"),
              onTap: () {
                _onItemTapped(2);
              },
            ),
            Divider(
              color: Color(0xff9B1768),
            ),
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
        initialActiveIndex: 2,
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

  void _onItemTapped(int index) {
    if (index == 0) {
      // Indeks 0 adalah indeks untuk Apple
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TrendingApple()),
      );
    } else if (index == 1) {
      // Indeks 1 adalah indeks untuk Apple
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TrendingCrypto()),
      );
    } else if (index == 2) {
      // Indeks 1 adalah indeks untuk Apple
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TrendingCeleb()),
      );
    }
  }
}
