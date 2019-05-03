import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final String namaMakanan, detailMakanan, gambarMakanan;
  Details({this.namaMakanan, this.detailMakanan, this.gambarMakanan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.lightGreen,
              expandedHeight: 250.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(namaMakanan,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      )),
                  background: Hero(
                    tag: namaMakanan,
                    child: Image.asset(
                      gambarMakanan,
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
                child: Text(detailMakanan),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Flushbar(
            aroundPadding: EdgeInsets.all(8),
            borderRadius: 8,
//            title: "",
            message: namaMakanan,
            duration: Duration(seconds: 1),
          )..show(context);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
