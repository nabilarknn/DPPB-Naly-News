import 'dart:convert';

import 'package:cobadppb3/berita.dart';
import 'package:cobadppb3/detail.berita.dart';
import 'package:cobadppb3/kategori.dart';
import 'package:cobadppb3/settings.dart';
import 'package:cobadppb3/trending.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _posts = [];
  int selectedIndex = 0;

  final List<Widget> pages = [
    Home(),
    Berita(),
    trending(),
    Kategori(),
    Settings(),
  ];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  Widget build(BuildContext context) {
    BoxFit fit;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 10),
            Text(
              'Naly News',
              style: TextStyle(
                  color: Color(0xff9B1768),
                  fontFamily: "Fredoka",
                  fontSize: 30),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      Image.network(
                          "https://img.freepik.com/premium-vector/background-screen-saver-breaking-news-with-map_88653-877.jpg?w=2000",
                          width: 400,
                          height: 150,
                          fit: BoxFit.contain),
                      Image.network(
                          "https://img.freepik.com/premium-vector/web_181623-67.jpg?w=2000",
                          width: 400,
                          height: 150,
                          fit: BoxFit.contain),
                      Image.network(
                          "https://img.freepik.com/premium-photo/online-news-mobile-phone-close-up-businesswoman-reading-news-articles-smartphone-screen-application-hand-holding-smart-device-mockup-website-newspaper-portal-internet_157125-9552.jpg?w=2000",
                          width: 400,
                          height: 150,
                          fit: BoxFit.contain),
                      Image.network(
                          "https://img.freepik.com/premium-psd/woman-reading-newspaper-mockup_53876-150757.jpg?w=2000",
                          width: 400,
                          height: 150,
                          fit: BoxFit.contain)
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                "Selamat Datang di Naly News!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Fredoka",
                  color: Color(0xff9B1768),
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: SizedBox(
                      width: 100,
                      child: _posts[index]['urlToImage'] != null
                          ? Image.network(
                              _posts[index]['urlToImage'],
                              width: 100,
                              fit: BoxFit.cover,
                            )
                          : SizedBox.shrink(),
                    ),
                    title: Text(
                      '${_posts[index]['title']}',
                      maxLines: 2,
                    ),
                    subtitle: Text(
                      '${_posts[index]['description']}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (c) => Detailberita(
                            url: _posts[index]['url'],
                            title: _posts[index]['title'],
                            content: _posts[index]['content'],
                            publishAt: _posts[index]['publishAt'],
                            author: _posts[index]['author'],
                            urlToImage: _posts[index]['urlToImage'],
                          ),
                        ),
                      );

                      AlertDialog alert = AlertDialog(
                        title: Text("HATI HATI DENGAN HOAX!"),
                        content: Text(
                            'Jika mendapatkan informasi yang mencurigakan, pastikan untuk memverifikasinya melalui sumber yang terpercaya sebelum mempercayainya.'),
                      );

                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert;
                          });
                    },
                  );
                },
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
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
        initialActiveIndex: 0,
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

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=52a86d9268f54f9cb8d08588b104629b'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _posts = data['articles'];
        });
      }
    } catch (e) {
      print(e);
    }
  }

  void _onItemTapped(int index) {
    if (index == 1) {
      // Indeks 1 adalah indeks untuk ikon "search"
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Detailberita()),
      );
    }
  }
}
