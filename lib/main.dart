import 'package:flutter/material.dart';
import 'package:flutter_app/screen/home.dart';



void main() => runApp(MaterialApp(
  home : Home(),
  debugShowCheckedModeBanner: false,
));

// void main() {
//   runApp(new MaterialApp(
//     title: "Makanan Enak",
//     home: new Main(),
//   ));
// }

// class Main extends StatefulWidget {
//   @override
//   _MainState createState() => new _MainState();
// }

// class _MainState extends State<Main> {
//   List<Container> daftarMakanan = new List();

//   var makanan = [
//     {"nama": "Gado Gado", "detail": "Gado-gado adalah makanan terenak dan terlejat dari sayuran","gambar": "gado.jpg"},
//     {"nama": "Ilabulo", "detail": "Ilabulo adalah makanan dari gorontalo yang enak dan lezat terbuat dari sagu","gambar": "ilabulo.jpg"},
//     {"nama": "Kebab", "detail": "Kebab isi macam-macam makanan yang berasal dari arab saudi yang lezat banget loh","gambar": "kebab.jpg"},
//     {"nama": "Kepiting", "detail": "kepiting saus padang sangat lezat dan enak, dimakan pakai nasi panas, uhh lezat banget","gambar": "kepiting.jpg"},
//     {"nama": "Ketoprak", "detail": "Ketoprak Cirebon yang selalu ada di malam hari, terbuat dari lontong dan saus kacang yang lezatnya membahana","gambar": "ketoprak.jpg"},

//     {"nama": "Lalampa", "detail": "Lalampa enak dimakan ketika panas, lalampa berisi nasi dan suir ikan, yang di buungkus dengan daun","gambar": "lalampa.jpg"},

//     {"nama": "Milu Siram", "detail": "Milu siram yaitu makanan dari gorontalo, terbuat dari jagung dan campuran kelapa yang enak dimakan dengan ikan cakalang dan dabu-dabu tumbuh","gambar": "milu.jpg"},

//     {"nama": "Mujair", "detail": "Mujair Bakar enak di sajikan dengan dabu-dabu tumbuh yang di goreng, rasa gak usah ditanya karena sangat enak dan lezat","gambar": "mujair.jpg"},

//     {"nama": "Nasi Kuning", "detail": "Nasi Kuning ada di semua daerah, biasanya di buat ketika ada yang berulang tahun","gambar": "nasikuning.jpg"},

//     {"nama": "Nasi Padang", "detail": "Siapa yang gak kenal nasi padang? wew nasi padang gak usah di tanya kelazatannya, di setiap daerah kita bisa jumpai warung padang dengan aneka ragam lauk dan sayurnya yang enak","gambar": "nasipadang.jpg"},

//     {"nama": "Nila", "detail": "Ikan nila, siapa yang sudah pernah rasa ikan satu ini, ikan nila enak di bakar dan di sajikan dengan sambal roa yang pedas banget","gambar": "nila.jpg"},

//     {"nama": "onde", "detail": "Onde-onde, satu jajanan ini enak loh, familiar kita dapatin di street food, isinya macam-macam, ada kacang hijau, coklat, keju dan lain sebagainya","gambar": "onde.jpg"},

//     {"nama": "Popolulu", "detail": "Popolulu, ada yag tau jajanan ini ? ini jajanan berasal dari gorontalo loh, jajanan ini enak banget, apalagi dimakan ketika masih panas, gak kebayang lezatnya. Biasanya isinya ada ubi dan kacang ijo","gambar": "popolulu.jpg"},

//     {"nama": "Soto", "detail": "Soto, salah satu street food yang sering kita temui di jalanan yah, rasanya khas banget dan enak jika dimakan dikala cuaca dingin","gambar": "soto.jpg"},

//     {"nama": "Tuna", "detail": "Ikan Tuna, ada yang pernah makan ikan tuna? ikan ini salah satu spesies ikan besar yang dagingnya enak banget ya, karena ikan ini bisa di buat apa aja, dibakar, di goreng apalagi di sate pakai dabu-dabu pedas, woww....!! ","gambar": "tuna.jpg"},


//   ];

//   _makeAlist() async {
//     for (var i = 0; i < makanan.length; i++) {
//       final loopingMakanan = makanan[i];
//       final String gambar = loopingMakanan["gambar"];

//       daftarMakanan.add(new Container(
//           padding: new EdgeInsets.all(10.0),
//           child: new Card(
//               child: new Column(
//                 children: <Widget>[
//                   new Hero(
//                     tag: loopingMakanan['nama'],
//                     child: new Material(
//                       //memperbasar/memeprkecil animasi
//                       child: new InkWell(
//                         onTap: () =>
//                             Navigator.of(context).push(new MaterialPageRoute(
//                               builder: (BuildContext context) => new DetailMakanan(
//                                 namaMakanan: loopingMakanan['nama'],
//                                 detailMakanan: loopingMakanan['detail'],
//                                 gambarMakanan: gambar,
//                               ),
//                             )),
//                         child: new Image.asset(
//                           "img/$gambar",
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                   new Padding(
//                     padding: new EdgeInsets.all(10.0),
//                   ),
//                   new Text(
//                     loopingMakanan['nama'],
//                     style: new TextStyle(fontSize: 20.0),
//                   )
//                 ],
//               ))));
//     }
//   }

//   @override
//   void initState() {
//     _makeAlist();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text(
//           "Makanan",
//           style: new TextStyle(color: Colors.white),
//         ),
//       ),
//       body: new GridView.count(
//         crossAxisCount: 2,
//         children: daftarMakanan,
//       ),
//     );
//   }
// }

// class DetailMakanan extends StatelessWidget {
//   DetailMakanan({this.namaMakanan, this.detailMakanan, this.gambarMakanan});
//   final String namaMakanan;
//   final String detailMakanan;
//   final String gambarMakanan;

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: new ListView(
//         children: <Widget>[
//           new Container(
//               height: 240.0,
//               child: new Hero(
//                 tag: namaMakanan,
//                 child: new Material(
//                   child: new InkWell(
//                     child: new Image.asset(
//                       "img/$gambarMakanan",
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//               )),
//           new BagianNamaMakanan(
//             namaVar: namaMakanan,
//           ),
//          // new BagianIcon(),
//           new DetailMakananPage(
//             detailMakanan: detailMakanan,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class BagianNamaMakanan extends StatelessWidget {
//   BagianNamaMakanan({this.namaVar});
//   final String namaVar;

//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//       padding: new EdgeInsets.all(10.0),
//       child: new Row(
//         children: <Widget>[
//           new Expanded(
//             child: new Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 new Text(
//                   namaVar,
//                   style: new TextStyle(fontSize: 20.0, color: Colors.red),
//                 ),
//                 new Text(
//                   "",
//                   style: new TextStyle(fontSize: 17.0, color: Colors.white10),
//                 ),
//               ],
//             ),
//           ),
//           new Row(
//             children: <Widget>[
//               new Icon(
//                 Icons.star,
//                 size: 30.0,
//                 color: Colors.red,
//               ),
//               new Text(
//                 "5",
//                 style: new TextStyle(fontSize: 18.0),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }




// class DetailMakananPage extends StatelessWidget {

//   DetailMakananPage({this.detailMakanan});
//   final String detailMakanan;
//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//       padding: new EdgeInsets.all(10.0),
//       child: new Card(
//         child: new Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: new Text(
//             detailMakanan
//           ,
//             style: new TextStyle(fontSize: 18.0),
//             textAlign: TextAlign.justify,
//           ),
//         ),
//       ),
//     );
//   }
// }
