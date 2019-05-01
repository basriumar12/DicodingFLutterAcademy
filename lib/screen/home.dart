import 'package:flutter/material.dart';
import 'package:flutter_app/model/model.dart';
import 'package:flutter_app/screen/detail.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    createlist(DataItem produk) => Container(
          height: 120.0,
          child: InkWell(
            onTap: () {},
            child: Card(
              child: Column(
                children: <Widget>[
                  InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Details(
                                    namaMakanan: produk.nama,
                                    gambarMakanan: produk.gambar,
                                    detailMakanan: produk.detail,
                                  ))),
                      child: ColumnCustom(
                        tag: produk.nama,
                        gambar: produk.gambar,
                        nama: produk.nama,
                      ))
                ],
              ),
            ),
          ),
        );

    final grid = GridView.count(
      crossAxisCount: 2,
      children: data.map((produk) => createlist(produk)).toList(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Makanan'),
      ),
      body: grid,
    );
  }
}

class ColumnCustom extends StatelessWidget {
  final String gambar, nama, tag;

  ColumnCustom({this.nama, this.gambar, this.tag});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Hero(
              tag: tag,
              placeholderBuilder: (context, child) {
                return Opacity(opacity: 0.2, child: child);
              },
              child: ClipRRect(
                borderRadius: new BorderRadius.circular(16.0),
                child: Image.asset(
                  gambar,
                  // height: 90.0,
                  // width: 100.0,
                  height: 150.0,
                  fit: BoxFit.cover,
                ),
              ),
            )),
        SizedBox(
          width: 5.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              nama,
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}
