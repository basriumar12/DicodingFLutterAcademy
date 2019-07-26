import 'package:flutter/material.dart';
import 'package:flutter_app/database.dart';
import 'package:flutter_app/model/meal.dart';
import 'package:flutter_app/screen/detail.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter_app/screen/favorite/favorite_breakfast.dart';
import 'package:flutter_app/screen/favorite/favorite_dessert.dart';
import 'package:transparent_image/transparent_image.dart';

class FavoriteScreen extends StatelessWidget {

  List<Container> daftarMakanan = new List();

  @override
  Widget build(BuildContext context) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.lightGreen,
                bottom: TabBar(
                  tabs: [
                    Tab(text: "Dessert"),
                    Tab(text: "Seafood")
                  ],
                )
            ),
            body: TabBarView(
              children: [
                new FavoriteDessert(),
                new FavoriteBreakfast()
              ],
            )
        )
      );
  }
}
