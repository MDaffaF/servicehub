import 'package:flutter/material.dart';
import 'package:servicehub/view/DetailPage.dart';
import 'package:servicehub/view/ElectPage.dart';
import 'package:servicehub/view/Paintpage.dart';
import 'package:servicehub/view/Plumbingpage.dart';

void main() {
  runApp(Homescreen());
}

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        title: Text(
          'Good Afternoon, What Zit Tooya',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(),
              SizedBox(height: 20),
              SectionTitle(title: 'Jasa yang Populer di ServiceHub'),
              PopularServicesSection(),
              SizedBox(height: 20),
              SectionTitle(title: 'Browse all categories'),
              CategoriesSection(),
              SizedBox(height: 20),
              SectionTitle(title: 'Handyman services'),
              HandymanServicesSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search for “Indoor Cleaning”',
        prefixIcon: Icon(Icons.search),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  SectionTitle({required this.title});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          'View all >',
          style: TextStyle(color: Colors.blue),
        ),
      ],
    );
  }
}

class PopularServicesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ServiceCard(
            image: 'assets/images/cleaning.png', title: 'Cleaning the house'),
        SizedBox(width: 10),
        ServiceCard(
            image: 'assets/images/painting.png', title: 'Painting the house'),
      ],
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String image;
  final String title;
  
  ServiceCard({required this.image, required this.title});
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(image,
                height: 100, width: double.infinity, fit: BoxFit.cover),
          ),
          SizedBox(height: 5),
          Text(title),
        ],
      ),
    );
  }
}

class CategoriesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CategoryIcon(
          title: 'Plumbing',
          icon: Icons.plumbing,
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PlumbingPage()));
          },
        ),
        CategoryIcon(
          title: 'Electrical',
          icon: Icons.electrical_services,
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Electpage()));
          },
        ),
        CategoryIcon(
          title: 'Painting',
          icon: Icons.format_paint,
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PaintPage()));
          },
        ),
        CategoryIcon(
          title: 'Cleaning',
          icon: Icons.cleaning_services,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailPage(technician: {})),
            );
          },
        ),
      ],
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  CategoryIcon({required this.title, required this. icon, required this.onTap});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, 
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[200],
            radius: 30,
            child: Icon(icon, color: Colors.orange, size: 30),
          ),
          SizedBox(height: 5),
          Text(title),
        ],
      ),
    );
  }
}

class HandymanServicesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HandymanCard(image: 'assets/images/detail.png', title: 'House Cleaners'),
        SizedBox(width: 10),
        HandymanCard(image: 'assets/images/eh.png', title: 'Electrical Help'),
      ],
    );
  }
}

class HandymanCard extends StatelessWidget {
  final String image;
  final String title;
  
  HandymanCard({required this.image, required this.title});
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(image,
                    height: 100, width: double.infinity, fit: BoxFit.cover),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  color: Colors.orange,
                  padding: EdgeInsets.all(5),
                  child: Text(
                    'Starts @IDR 100,000/hr',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(title),
        ],
      ),
    );
  }
}
