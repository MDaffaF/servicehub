import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Header Section
            Stack(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/icons/about_us.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 250,
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: Text(
                      'About Us',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),

            // About Us Description
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Who We Are",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "ServiceHub is your trusted platform for finding and booking professional services easily. We connect users with verified service providers in various categories such as home cleaning, painting, plumbing, and more.",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  SizedBox(height: 20),

                  // Mission Section
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(Icons.lightbulb, color: Colors.orange, size: 40),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            "Our mission is to provide an easy, secure, and fast way to find top-quality service providers for your needs.",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),

                  // Our Team Section
                  Text(
                    "Meet Our Team",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(height: 10),
                  TeamSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Team Section
class TeamSection extends StatelessWidget {
  final List<Map<String, String>> teamMembers = [
    {"name": "Rizal", "role": "BNN (Bagian Ngedit Ngedit)", "image": "assets/icons/rizal.png"},
    {"name": "Agung Rizki Hermawan", "role": "Backend", "image": "assets/icons/agung.png"},
    {"name": "Muhammad Daffa Fikriawan", "role": "Frontend", "image": "assets/icons/daffa.png"},
    {"name": "Putri", "role": "Tester&Report", "image": "assets/icons/putri.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWideScreen = constraints.maxWidth > 600;
        return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isWideScreen ? 3 : 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: isWideScreen ? 0.8 : 1.2,
          ),
          itemCount: teamMembers.length,
          itemBuilder: (context, index) {
            final member = teamMembers[index];
            return TeamCard(
              name: member["name"]!,
              role: member["role"]!,
              image: member["image"]!,
            );
          },
        );
      },
    );
  }
}

// Team Card
class TeamCard extends StatelessWidget {
  final String name;
  final String role;
  final String image;

  TeamCard({required this.name, required this.role, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(image, height: 80, width: 80, fit: BoxFit.cover),
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            role,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
