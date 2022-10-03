import 'package:flutter/material.dart';
import 'package:kuispraktikum/books_data.dart';
import 'package:kuispraktikum/detail_page.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page Rekomendasi Buku"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          // Instansiasi
          // dengan format
          // final namaClass namaVariabel = namaConstructor
          final BooksData place = booksData[index];

          // Inkwell mirip seperti button yang bisa diklik dan ada fungsinya
          // Bedanya adalah button hanyalah sebuah tombol
          // Sedangkan Inkwell adalah container yang bisa di klik
          // ElevatedButton menggunakan onPressed, sedangkan InkWell menggunakan onTap
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(place : place)));
            },
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(place.imageUrls[0], width: 120,),
                  Text(place.title,style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(place.publishedDate)
                ],
              ),
            ),
          );
        },
        itemCount: booksData.length,
      ),
    );
  }
}