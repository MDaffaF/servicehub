import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'CartScreen.dart';

class PlumbingPage extends StatelessWidget {
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
              child: Image.asset("assets/images/plumb.png"),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Plumbing Service",
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Experiencing clogged drains, leaking pipes, or problematic plumbing installations? ServiceHub is ready to provide fast and professional solutions for all your plumbing needs at home, apartments, offices, or businesses. We offer leak repairs, new pipe installations, drain unclogging, sink and toilet repairs, and complete plumbing systems with neat and high-quality workmanship. With experienced professionals and modern equipment, we ensure every job is done efficiently and lasts long. Don't let plumbing issues disrupt your comfort! Contact us now for fast and reliable service. 🚰🔧✅",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _infoItem(Icons.star, "4.8"),
                      _infoItem(Icons.local_shipping, "FREE"),
                      _infoItem(Icons.attach_money, "20/Hour"),
                      _infoItem(Icons.location_on, "3 Km"),
                    ],
                  ),
                  SizedBox(height: 20),
                  _reviewItem("Dadang", "I am very satisfied with the cleaning service from this team! They arrived on time, were friendly, and worked very thoroughly. My house felt much cleaner and fresher after they finished. The only reason I didn't give 5 stars is that some small corners could have been more thoroughly cleaned. But overall, I will definitely use their service again!", "DG"),
                  _reviewItem("Jubaedah", "Good and professional service! This cleaning team worked quickly but still paid attention to detail in cleaning each room. I like how they use environmentally friendly cleaning products. However, I hope they can be a bit more thorough in cleaning under furniture. But other than that, the result is satisfying, and I recommend them!", "JB"),
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
            "Add to Cart",
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