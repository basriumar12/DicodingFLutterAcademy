import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/database.dart';
import 'package:flutter_app/model/homeitem.dart';
import 'package:flutter_app/model/meal.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';

class Details extends StatefulWidget {
  final String idMeal;
  final int type;

  Details({this.idMeal, this.type});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<Details> {
  String namaMakanan = "";
  bool _isFavorite = false;
  Meal data;

  @override
  void initState() {
    super.initState();
    DBProvider.db.getData(widget.idMeal).then((value) {
      setState(() => _isFavorite = value != null);
    });
  }

  Future<HomeItem> getDetail() async {
    final Response response = await http.get("https://www.themealdb.com/api/json/v1/1/lookup.php?i="+widget.idMeal);

    if (response.statusCode == 200) {
      return myModelFromJson(response.body);
    } else {
      throw Exception('Gagal mendapatkan post');
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: new FutureBuilder<HomeItem>(
          future: getDetail(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            data = snapshot.data.meals.single;

            return NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    backgroundColor: Colors.lightGreen,
                    expandedHeight: 250.0,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Text(snapshot.data.meals.single.strMeal,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            )),
                        background: Hero(
                          tag: snapshot.data.meals.single.idMeal,
                          child: new FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: snapshot.data.meals.single.strMealThumb,
                            fit: BoxFit.cover,
                          ),
                        )),
                  ),
                ];
              },
              body: Center(
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 50.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(snapshot.data.meals.single.strInstructions),
                    ),
                  ],
                ),
              ),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(!_isFavorite) {
            Meal dataMeal = Meal(
              idMeal: data.idMeal,
              strMeal: data.strMeal,
              strMealThumb: data.strMealThumb,
              strInstructions: data.strInstructions,
              type: widget.type
            );
            DBProvider.db.newMeal(dataMeal).then((value) {
              if (value > 0) {
                setState(() => _isFavorite = true);
              }
            });

            Flushbar(
              aroundPadding: EdgeInsets.all(8),
              borderRadius: 8,
//            title: "",
              message: "Added",
              duration: Duration(seconds: 5),
            ).show(context);
          } else {
            DBProvider.db.deleteMeal(data.idMeal).then((value) {
              if (value > 0) {
                setState(() => _isFavorite = false);
              }
            });
            Flushbar(
              aroundPadding: EdgeInsets.all(8),
              borderRadius: 8,
//            title: "",
              message: "Removed",
              duration: Duration(seconds: 5),
            ).show(context);
          }
        },
        tooltip: 'Increment',
        child: Icon(_isFavorite? Icons.remove_circle: Icons.add_circle),
      ),
    );
  }
}