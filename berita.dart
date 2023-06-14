import 'dart:convert';

import 'package:cobadppb3/business.kat.dart';
import 'package:cobadppb3/detail.berita.dart';
import 'package:cobadppb3/home.dart';
import 'package:cobadppb3/kategori.dart';
import 'package:cobadppb3/settings.dart';
import 'package:cobadppb3/tech.kat.dart';
import 'package:cobadppb3/trending.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Berita extends StatefulWidget {
  @override
  _BeritaState createState() => _BeritaState();
}

class _BeritaState extends State<Berita> {
  List _posts = [];
  int selectedIndex = 1;

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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff9B1768),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.newspaper), SizedBox(width: 10), Text('News')],
        ),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          itemCount: _posts.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                color: Colors.grey[200],
                height: 100,
                width: 100,
                child: _posts[index]['urlToImage'] != null
                    ? Image.network(_posts[index]['urlToImage'])
                    : Center(),
              ),
              title: Text('${_posts[index]['title']}'),
              subtitle: Text('${_posts[index]['description']}'),
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
              },
            );
          },
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
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
        initialActiveIndex: 1,
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
