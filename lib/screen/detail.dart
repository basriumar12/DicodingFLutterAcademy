import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/homeitem.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:transparent_image/transparent_image.dart';

class Details extends StatelessWidget {
  final String url;
  Details({this.url});
  String namaMakanan = "";

  Future<HomeItem> getDetail() async {
    final Response response = await http.get(url);

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

          namaMakanan = snapshot.data.meals.single.strMeal;

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
          Flushbar(
            aroundPadding: EdgeInsets.all(8),
            borderRadius: 8,
//            title: "",
            message: namaMakanan,
            duration: Duration(seconds: 5),
          )..show(context);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
