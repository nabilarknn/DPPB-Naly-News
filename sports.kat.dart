import 'dart:convert';

import 'package:cobadppb3/detail.S.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class sport extends StatefulWidget {
  const sport({super.key});

  @override
  State<sport> createState() => _sportState();
}

class _sportState extends State<sport> {
  List _posts = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9B1768),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.sports_basketball),
            SizedBox(width: 10),
            Text('Sport News')
          ],
        ),
      ),
      body: ListView.builder(
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
                        builder: (c) => Detailsport(
                              url: _posts[index]['url'],
                              title: _posts[index]['title'],
                              content: _posts[index]['content'],
                              publishAt: _posts[index]['publishAt'],
                              author: _posts[index]['author'],
                              urlToImage: _posts[index]['urlToImage'],
                            )));
              },
            );
          }),
    );
  }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=6e0a5835c2734deca7a6d3caa27668f2'));
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
