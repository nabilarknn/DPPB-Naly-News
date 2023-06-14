import 'package:flutter/material.dart';

class KategoriCard extends StatelessWidget {
  final String kategori;
  final String image;

  KategoriCard({
    super.key,
    required this.kategori,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 200,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.6),
                offset: Offset(0.0, 10.0),
                blurRadius: 10.0,
                spreadRadius: -6.0),
          ],
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.35), BlendMode.multiply),
              image: NetworkImage(image),
              fit: BoxFit.cover)),
      child: Stack(children: [
        Align(
          child: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 5.0),
            child: Text(
              kategori,
              style: TextStyle(
                fontSize: 34,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
          alignment: Alignment.center,
        )
      ]),
    );
  }
}
