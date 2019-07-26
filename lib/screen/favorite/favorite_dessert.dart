import 'package:flutter/material.dart';
import 'package:flutter_app/database.dart';
import 'package:flutter_app/model/homeitem.dart';
import 'package:flutter_app/model/meal.dart';
import 'package:flutter_app/screen/detail.dart';
import 'package:flushbar/flushbar.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:transparent_image/transparent_image.dart';

class FavoriteDessert extends StatelessWidget {

  List<Container> daftarMakanan = new List();

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Meal>>(
      future: DBProvider.db.getDataDessert(2),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        } else if(snapshot.data.length == 0) {
          return Center(
            child: Text(
              "Tidak ada favorite"
            ),
          );
        }

        for(Meal data in snapshot.data) {
          daftarMakanan.add(Container(
            height: 120.0,
            child: InkWell(
              onTap: () {},
              child: Card(
                child: Column(
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Details(
                                    type: 2,
//                                      url: "https://www.themealdb.com/api/json/v1/1/lookup.php?i="+data.idMeal,
                                    idMeal: data.idMeal,
                                  )));
                          Flushbar(
                            aroundPadding: EdgeInsets.all(8),
                            borderRadius: 8,
                            title: "Makanan",
                            message: data.strMeal,
                            duration: Duration(seconds: 5),
                          )..show(context);
                        },
                        child: ColumnCustom(
                          tag: data.idMeal,
                          gambar: data.strMealThumb,
                          nama: data.strMeal,
                        ))
                  ],
                ),
              ),
            ),
          ));
        }

        return new GridView.count(
            crossAxisCount: 2,
            children: daftarMakanan
        );
      },
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
              child: ClipRRect(
                borderRadius: new BorderRadius.circular(16.0),
                child: new FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: gambar,
                  // height: 90.0,
                  // width: 100.0,
                  height: 130.0,
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
            Center(
                child: Text(
                  nama,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                )
            ),
          ],
        )
      ],
    );
  }
}
