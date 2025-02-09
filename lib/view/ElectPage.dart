import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'CartScreen.dart';

class Electpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Details",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset("assets/icons/elh.png"),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Electrical Help",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Apakah Anda mengalami masalah listrik di rumah, kantor, atau tempat usaha? Jangan khawatir! ServiceHub siap memberikan solusi cepat, aman, dan profesional untuk segala kebutuhan kelistrikan Anda. Dari perbaikan instalasi listrik, pemasangan panel dan MCB, instalasi lampu serta stop kontak, hingga grounding dan penangkal petir, kami menangani semuanya dengan standar keamanan tinggi. Dengan tenaga ahli berpengalaman, kami memastikan setiap pekerjaan dilakukan dengan rapi, efisien, dan bebas risiko. Jangan biarkan masalah listrik mengganggu aktivitas Anda! Hubungi kami sekarang untuk layanan terbaik dan terpercaya. ⚡🔧",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 15),
                  
                  // Informasi Layanan
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _infoItem(Icons.star, "4.8"),
                      _infoItem(Icons.local_shipping, "FREE"),
                      _infoItem(Icons.attach_money, "20/Jam"),
                      _infoItem(Icons.location_on, "3 Km"),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Review Customer
                  _reviewItem("Dadang", "Saya sangat puas dengan layanan pembersihan dari tim ini! Mereka datang tepat waktu, ramah, dan bekerja dengan sangat teliti. Rumah saya benar-benar terasa lebih bersih dan segar setelah mereka selesai. Satu-satunya alasan saya tidak memberikan bintang 5 adalah karena ada beberapa sudut kecil yang masih bisa lebih diperhatikan. Tapi secara keseluruhan, saya pasti akan menggunakan jasa mereka lagi!.", "DG"),
                  _reviewItem("Jubaedah", "Layanan yang baik dan profesional! Tim house cleaners ini bekerja dengan cepat namun tetap detail dalam membersihkan setiap ruangan. Saya suka bagaimana mereka menggunakan produk pembersih yang ramah lingkungan. Namun, saya berharap mereka bisa sedikit lebih teliti dalam membersihkan bagian bawah perabot. Tapi selain itu, hasilnya memuaskan dan saya merekomendasikannya!", "JB"),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
          },
          child: Text(
            "Tambahkan ke Keranjang",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  // Widget untuk menampilkan informasi layanan
  Widget _infoItem(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, size: 24, color: Colors.orange),
        SizedBox(height: 5),
        Text(
          text,
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  // Widget untuk menampilkan ulasan pengguna
  Widget _reviewItem(String name, String review, String initials) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.orange.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  initials,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Text(
                name,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Spacer(),
              RatingBarIndicator(
                rating: 4,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
                itemCount: 5,
                itemSize: 18,
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            review,
            style: GoogleFonts.poppins(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
