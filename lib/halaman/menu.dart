import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ta_final/halaman/list.dart';
import 'jam.dart';
import 'konversi_uang.dart';


class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData(
        appBarTheme: AppBarTheme(

          color: Colors.white, // Atur warna AppBar secara global
          iconTheme: IconThemeData(
            color: Colors.black, // Ubah warna tombol kembali secara global
          ),
          titleTextStyle: TextStyle(
            color: Colors.black, // Atur warna teks judul AppBar secara global
            fontSize: 20, // Atur ukuran teks judul AppBar secara global
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red[100],
        body: ListView(
          children: [
            MenuCard(
              img: "../assets/timcina.jpg",
              title: "China Team",
              description:
              "Akan berisikan berbagai info tentang tim sepak bola liga china",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomePage();
                    },
                  ),
                );
              },
            ),
            MenuCard(
              img: "../assets/uang.jpg",
              title: "Konversi uang",
              description:
              "Anda bisa mengkonversikan uang kedalam 3 mata uang, yaitu rupuah, dolar amerika, dan peso",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Konversi();
                    },
                  ),
                );
              },
            ),
            MenuCard(
              img: "../assets/jam.jpg",
              title: "Konversi Jam",
              description:
              "anda bisa melihat perbedaan zona waktu",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TimeConverter();
                    },
                  ),
                );
              },
            ),
          ],
        ),

      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final String img;
  final String title;
  final String description;
  final VoidCallback onTap;

  MenuCard({
    required this.img,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Atur tinggi shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Atur border radius
      ),
      margin: EdgeInsets.fromLTRB(10, 10, 10, 20), // Atur margin dari luar Card
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 15),
            Container(
              width: 200, // Atur lebar kontainer
              height: 200, // Atur tinggi kontainer
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit
                      .cover, // Atur bagaimana gambar ditampilkan dalam kontainer
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  50, 10, 50, 20), // Atur jarak dari sisi kiri dan atas
              child: Text(description),
            ),
          ],
        ),
      ),
    );
  }
}