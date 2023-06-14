import 'dart:convert'; // Library yang menyediakan utilitas encode decode json

import 'package:cobadppb3/trending.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TrendingCrypto extends StatefulWidget {
  @override
  _TrendingCryptoState createState() => _TrendingCryptoState();
}

class _TrendingCryptoState extends State<TrendingCrypto> {
  List _posts = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xff9B1768),
        title: Text(
          "Trending News",
          style: TextStyle(color: Colors.white),
        ),
      ),

      body: ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              color: Colors.grey[200],
              height: 200,
              width: 200,
              child: _posts[index]['urlToImage'] != null
                  ? Image.network(_posts[index]['urlToImage'])
                  : Center(),
            ),
            title: Text('${_posts[index]['title']}'),
            subtitle: Text('${_posts[index]['description']}'),
            // onTap: () {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (c) => Detail(
            //         url: _posts[index]['url'],
            //         title: _posts[index]['title'],
            //         content: _posts[index]['content'],
            //         publishedAt: _posts[index]['publishedAt'],
            //         author: _posts[index]['author'],
            //         urlToImage: _posts[index]['urlToImage'],
            //       ),
            //     ),
            //   );
            // },
          );
        },
        // shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
      ),
    );
    // bottomNavigationBar: BottomNavigationBar(
    //   items: [
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.home),
    //       label: "home",
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.search),
    //       label: "trending",
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.settings),
    //       label: "setting",
    //     ),
    //   ],
    //   onTap: _onItemTapped,
    // ),
  }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?q=crypto&apiKey=6e0a5835c2734deca7a6d3caa27668f2'));
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
}
//   void _onItemTapped(int index) {
//     if (index == 1) {
//       // Indeks 1 adalah indeks untuk ikon "search"
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => trending()),
//       );
//     }
//   }
// }
//   Widget HalamanTrending() {
//     // Kembalikan widget tampilan halaman trending yang diinginkan
//     return Container(
//         // child: Text('Halaman Trending'),
//         );
//   }
// }
