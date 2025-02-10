import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  void _markAsCompleted(int index) {
    setState(() {
      completedProjects.add(inProgressProjects[index]);
      inProgressProjects.removeAt(index);
      if (inProgressProjects.isEmpty) {
        _selectedTabIndex = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Projects',
            style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: _selectedTabIndex == 0
                          ? Colors.orange.shade100
                          : Colors.grey.shade200,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedTabIndex = 0;
                      });
                    },
                    child: Text('In Progress',
                        style: TextStyle(
                            color: _selectedTabIndex == 0
                                ? Colors.orange
                                : Colors.grey)),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: _selectedTabIndex == 1
                          ? Colors.orange.shade100
                          : Colors.grey.shade200,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedTabIndex = 1;
                      });
                    },
                    child: Text('Completed',
                        style: TextStyle(
                            color: _selectedTabIndex == 1
                                ? Colors.orange
                                : Colors.grey)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: _selectedTabIndex == 0
                  ? inProgressProjects.length
                  : completedProjects.length,
              itemBuilder: (context, index) {
                var project = _selectedTabIndex == 0
                    ? inProgressProjects[index]
                    : completedProjects[index];
                return _selectedTabIndex == 0
                    ? _buildProjectCard(project, index)
                    : _buildCompletedProjectCard(project);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(Map<String, String> project, int index) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(project['title']!,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('Processing', style: TextStyle(color: Colors.grey)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                SizedBox(width: 8),
                Text('Scheduled for ${project['date']}'),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.access_time, size: 16, color: Colors.grey),
                SizedBox(width: 8),
                Text(project['time']!),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: Colors.black),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () => _markAsCompleted(index),
              child: Center(
                child: Text('Mark as completed',
                    style: TextStyle(color: Colors.black)),
              ),
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
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(project['title']!,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Icon(FontAwesomeIcons.solidCheckCircle,
                    size: 18, color: Colors.green),
              ],
            ),
            SizedBox(height: 8),
            Text('✅ Completed',
                style: TextStyle(
                    color: Colors.green, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
