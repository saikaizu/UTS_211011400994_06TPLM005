import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Landing Page Sai Pratama',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 0, 255, 128)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Sai Pratama'),
      debugShowCheckedModeBanner: false, // Menyembunyikan teks debug di pojok kanan atas
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          children: [
            Icon(
              Icons.android, // Ganti dengan ikon Material Icons yang Anda inginkan
              size: 40, // Sesuaikan ukuran ikon yang diinginkan
            ),
            SizedBox(width: 10), // Jarak antara ikon dan judul
            Text(
              widget.title,
              style: GoogleFonts.nunito( // Contoh menggunakan jenis font Nunito
                fontSize: 20, // Sesuaikan ukuran font yang diinginkan
                fontWeight: FontWeight.bold, // Sesuaikan bobot font yang diinginkan
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Expanded( // Menggunakan Expanded agar Swiper bisa mengambil sisa ruang

              child: Swiper(
  itemBuilder: (BuildContext context, int index) {
    return Image.asset(
      'assets/${String.fromCharCode(97 + index)}.png', // Misalnya, a.png, b.png, c.png, d.png, e.png
      fit: BoxFit.fill,
    );
  },
  itemCount: 5, // Jumlah total gambar yang akan ditampilkan
  pagination: SwiperPagination(),
  control: SwiperControl(),
),

            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          launch('https://wa.me/6281315255532');
        },
        tooltip: 'Open WhatsApp',
        child: const Icon(Icons.message),
      ),
    );
  }
}
