import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final String namaMakanan, detailMakanan, gambarMakanan;
  Details({this.namaMakanan, this.detailMakanan, this.gambarMakanan});

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(namaMakanan),
    );

    return Scaffold(
      // appBar: appBar,
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
              // Align(
              //   alignment: Alignment.center,
              //   child: Text(
              //     "Rp " + money.format(produk.price),
              //     style: Theme.of(context)
              //         .textTheme
              //         .headline
              //         .copyWith(color: Theme.of(context).accentColor),
              //   ),
              // ),
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
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
