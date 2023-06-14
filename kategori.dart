import 'package:cobadppb3/business.kat.dart';
import 'package:cobadppb3/home.dart';
import 'package:cobadppb3/settings.dart';
import 'package:cobadppb3/sports.kat.dart';
import 'package:cobadppb3/tech.kat.dart';
import 'package:cobadppb3/entertainment.kat.dart';
import 'package:cobadppb3/health.kat.dart';
import 'package:cobadppb3/trending.dart';
import 'package:cobadppb3/berita.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:cobadppb3/widget/card.dart';

class Kategori extends StatefulWidget {
  const Kategori({super.key});

  @override
  State<Kategori> createState() => _KategoriState();
}

class _KategoriState extends State<Kategori> {
  int selectedIndex = 3;

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.category),
            SizedBox(width: 10),
            Text('Categories')
          ],
        ),
      ),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (c) => Business(),
                ),
              );
            },
            child: KategoriCard(
              kategori: 'Business',
              image:
                  "https://img.freepik.com/free-photo/group-diverse-people-having-business-meeting_53876-25060.jpg?w=1060&t=st=1686593598~exp=1686594198~hmac=3ffc0657376e59a057bab55f6a07706599f8d883d7495a3d907746331c44a8fd",
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (c) => Entertainment(),
                ),
              );
            },
            child: KategoriCard(
              kategori: 'Entertainment',
              image:
                  "https://img.freepik.com/free-photo/woman-crowd-taking-picture-stage-music-festival_342744-560.jpg?w=900&t=st=1686593874~exp=1686594474~hmac=e4e33f51842de7245c2fe20427122cfb2cefe340aab4e31bd64d3e639340b890",
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (c) => sport(),
                ),
              );
            },
            child: KategoriCard(
              kategori: 'Sports',
              image:
                  "https://img.mlbstatic.com/mlb-images/image/upload/t_2x1/t_w1536/v1686527443/mlb/c0x6m8zk8kzjpgpkmlru.jpg",
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (c) => Tech(),
                ),
              );
            },
            child: KategoriCard(
              kategori: 'Technology',
              image:
                  "https://img.freepik.com/free-photo/medium-shot-man-wearing-vr-glasses_23-2149126949.jpg?size=626&ext=jpg&ga=GA1.2.540244317.1686136822&semt=sph",
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (c) => Health(),
                ),
              );
            },
            child: KategoriCard(
              kategori: 'Health',
              image:
                  "https://img.freepik.com/free-vector/healthcare-background-with-medical-symbols-hexagonal-frame_1017-26363.jpg?size=626&ext=jpg&ga=GA1.1.540244317.1686136822&semt=sph",
            ),
          ),
        ],
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
        initialActiveIndex: 3,
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
}
