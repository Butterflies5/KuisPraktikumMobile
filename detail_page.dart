import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kuispraktikum/books_data.dart';

class DetailPage extends StatefulWidget {
  final BooksData place;

  const DetailPage({Key? key, required this.place}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail Buku"),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          //child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  height: (MediaQuery
                      .of(context)
                      .size
                      .height) / 3,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Image.network(widget.place.imageUrls[index]),
                      );
                    },
                    itemCount: widget.place.imageUrls.length,
                  ),
                ),

                Text(
                  "${widget.place.title}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40, color: Colors.black),
                ),
                Text(
                  "${widget.place.id}",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  "${widget.place.authors}",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  "${widget.place.publisher}",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "Date  : ${widget.place.publishedDate}",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15, color: Colors.brown),
                ),
                Text(
                  "${widget.place.description}",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 24,),
                Text(
                  "${widget.place.categories}",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 24,),
                Text(
                  "${widget.place.previewLink}",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        )
      //),
    );
  }
}