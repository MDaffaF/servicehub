import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProjectsScreen(),
    );
  }
}

class ProjectsScreen extends StatefulWidget {
  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  int _selectedTabIndex = 0;

  List<Map<String, String>> inProgressProjects = [
    {
      'title': 'Indoor Cleaning',
      'company': 'Palmcedar Cleaning',
      'service': 'One-Time Cleaning Service',
      'date': 'Wed, 8 Mar',
      'time': '9:00 AM - 11:10 AM',
    },
    {
      'title': 'Plumbing Service',
      'company': 'Opakjeph Plumbing Service',
      'service': '',
      'date': 'Wed, 8 Mar',
      'time': '9:00 AM - 11:10 AM',
    },
  ];

  List<Map<String, String>> completedProjects = [];

  List<Map<String, dynamic>> nearbyTechnicians = [
    {
      'name': 'John Doe',
      'specialty': 'Electrician',
      'rating': 4.5,
      'price': '\$50/hour',
      'photo': 'assets/icons/teknisi.png',
    },
    {
      'name': 'Jane Smith',
      'specialty': 'Plumber',
      'rating': 4.7,
      'price': '\$60/hour',
      'photo': 'assets/icons/teknisi.png',
    },
  ];

  void _markAsCompleted(int index) {
    setState(() {
      completedProjects.add(inProgressProjects[index]);
      inProgressProjects.removeAt(index);
      if (inProgressProjects.isEmpty) {
        _selectedTabIndex = 2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projects',
            style: GoogleFonts.inter(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildTabButton(0, 'Nearby Technicians'),
                SizedBox(width: 8),
                _buildTabButton(1, 'In Progress'),
                SizedBox(width: 8),
                _buildTabButton(2, 'Completed'),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: _getItemCount(),
              itemBuilder: (context, index) {
                if (_selectedTabIndex == 0) {
                  return _buildTechnicianCard(nearbyTechnicians[index]);
                } else if (_selectedTabIndex == 1) {
                  return _buildProjectCard(inProgressProjects[index], index);
                } else {
                  return _buildCompletedProjectCard(completedProjects[index]);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  int _getItemCount() {
    if (_selectedTabIndex == 0) {
      return nearbyTechnicians.length;
    } else if (_selectedTabIndex == 1) {
      return inProgressProjects.length;
    } else {
      return completedProjects.length;
    }
  }

  Widget _buildTabButton(int index, String text) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor:
              _selectedTabIndex == index ? Colors.orange.shade100 : Colors.grey.shade200,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        child: Text(text,
            style: TextStyle(
                color: _selectedTabIndex == index ? Colors.orange : Colors.grey)),
      ),
    );
  }

Widget _buildTechnicianCard(Map<String, dynamic> technician) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    margin: EdgeInsets.symmetric(vertical: 8),
    child: Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(technician['photo']),
                radius: 30,
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    technician['name'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    technician['specialty'],
                    style: TextStyle(color: Colors.grey[700], fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${technician['price']}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 18),
                  SizedBox(width: 4),
                  Text(
                    technician['rating'].toString() + "/5",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // Tambahkan aksi untuk tombol detail
              },
              child: Text(
                'Detail',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
  Widget _buildProjectCard(Map<String, String> project, int index) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(project['title']!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => _markAsCompleted(index),
              child: Text('Mark as completed'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompletedProjectCard(Map<String, String> project) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: Colors.green.shade100,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(project['title']!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('✅ Completed', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
