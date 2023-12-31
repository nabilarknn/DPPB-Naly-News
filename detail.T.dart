import 'package:flutter/material.dart';

class DetailT extends StatelessWidget {
  final url;
  final title;
  final content;
  final publishAt;
  final author;
  final urlToImage;

  DetailT(
      {this.url,
      this.title,
      this.content,
      this.publishAt,
      this.author,
      this.urlToImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          urlToImage != null
              ? Image.network(urlToImage)
              : Container(
                  height: 250,
                  color: Colors.grey[200],
                ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$title',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  '$publishAt',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 3),
                Text('$content'),
                Divider(),
                Text('Author : $author'),
                Text('$url'),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
